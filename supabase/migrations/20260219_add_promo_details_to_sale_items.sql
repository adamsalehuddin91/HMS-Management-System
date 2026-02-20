-- Migration: Add promo details to sale_items and update complete_sale RPC

-- 1. Add columns to sale_items
ALTER TABLE sale_items
  ADD COLUMN IF NOT EXISTS promo_id UUID REFERENCES promotions(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS promo_description TEXT;

-- 2. Update complete_sale RPC
CREATE OR REPLACE FUNCTION public.complete_sale(
    p_customer_id UUID,
    p_booking_id UUID,
    p_subtotal DECIMAL(10,2),
    p_discount_amount DECIMAL(10,2),
    p_points_redeemed INTEGER,
    p_points_discount DECIMAL(10,2),
    p_deposit_deducted DECIMAL(10,2),
    p_total DECIMAL(10,2),
    p_payment_method TEXT,
    p_created_by UUID,
    p_cart_items JSONB, -- Array of cart items
    p_products JSONB, -- Array of products with current stock
    p_is_promotional BOOLEAN DEFAULT false,
    p_points_earned INTEGER DEFAULT 0
) RETURNS JSONB AS $$
DECLARE
    v_sale_id UUID;
    v_item JSONB;
    v_product JSONB;
    v_product_id UUID;
    v_quantity INTEGER;
    v_current_stock INTEGER;
    v_new_stock INTEGER;
    v_commission JSONB;
    v_points_earned INTEGER;
    v_net_points_change INTEGER;
    v_new_points_balance INTEGER;
    v_current_points_balance INTEGER;
    v_current_visit_count INTEGER;
BEGIN
    -- 1. Create the sale record
    INSERT INTO public.sales (
        customer_id, booking_id, subtotal, discount_amount,
        points_redeemed, points_discount, deposit_deducted,
        total, payment_method, status, created_by, created_at,
        is_promotional, points_earned
    ) VALUES (
        p_customer_id, p_booking_id, p_subtotal, p_discount_amount,
        p_points_redeemed, p_points_discount, p_deposit_deducted,
        p_total, p_payment_method, 'completed', p_created_by, NOW(),
        p_is_promotional, p_points_earned
    ) RETURNING id INTO v_sale_id;

    -- 2. Update booking status if from booking
    IF p_booking_id IS NOT NULL THEN
        UPDATE public.bookings
        SET status = 'completed'
        WHERE id = p_booking_id;
    END IF;

    -- 3. Process each cart item
    FOR v_item IN SELECT * FROM jsonb_array_elements(p_cart_items)
    LOOP
        -- Insert sale item
        INSERT INTO public.sale_items (
            sale_id, item_type, item_id, item_name, stylist_id,
            quantity, price, unit_price, discount, total,
            commission_rate, commission_amount, created_at,
            promo_id, promo_description
        ) VALUES (
            v_sale_id,
            v_item->>'itemType',
            (v_item->>'id')::UUID,
            v_item->>'name',
            NULLIF(v_item->>'primaryStaffId', '')::UUID,
            (v_item->>'quantity')::INTEGER,
            (v_item->>'price')::DECIMAL(10,2),
            (v_item->>'price')::DECIMAL(10,2),
            0,
            (v_item->>'price')::DECIMAL(10,2) * (v_item->>'quantity')::INTEGER,
            COALESCE((v_item->'commission'->>'primaryRate')::DECIMAL(5,2), 0),
            COALESCE((v_item->'commission'->>'primary')::DECIMAL(10,2), 0),
            NOW(),
            NULLIF(v_item->>'promoId', '')::UUID,
            v_item->>'promoDescription'
        );

        -- Handle product stock deduction
        IF v_item->>'itemType' = 'product' THEN
            v_product_id := (v_item->>'id')::UUID;
            v_quantity := (v_item->>'quantity')::INTEGER;

            -- Atomically update stock with check
            UPDATE public.products
            SET stock_quantity = stock_quantity - v_quantity
            WHERE id = v_product_id
              AND stock_quantity >= v_quantity -- Prevent overselling
            RETURNING stock_quantity INTO v_new_stock;

            -- If no rows updated, stock was insufficient
            IF NOT FOUND THEN
                RAISE EXCEPTION 'Insufficient stock for product %', v_item->>'name'
                    USING HINT = 'Stock race condition detected';
            END IF;

            -- Get the balance before for stock movement record
            SELECT stock_quantity + v_quantity INTO v_current_stock
            FROM public.products
            WHERE id = v_product_id;

            -- Record stock movement
            INSERT INTO public.stock_movements (
                product_id, type, quantity, balance_before, balance_after,
                reason, reference_id, performed_by, created_at
            ) VALUES (
                v_product_id, 'out', -v_quantity, v_current_stock, v_new_stock,
                'POS Sale', v_sale_id, p_created_by, NOW()
            );
        END IF;

        -- Insert commissions
        IF v_item->'commission' IS NOT NULL THEN
            v_commission := v_item->'commission';
            
            -- Primary staff commission (sale_amount uses originalPrice for fair commission)
            IF (v_commission->>'primary')::DECIMAL(10,2) > 0 THEN
                INSERT INTO public.commissions (
                    staff_id, sale_id, service_name, sale_amount,
                    commission_rate, amount, month, is_paid, created_at
                ) VALUES (
                    (v_item->>'primaryStaffId')::UUID,
                    v_sale_id,
                    v_item->>'name',
                    COALESCE((v_item->>'originalPrice')::DECIMAL(10,2), (v_item->>'price')::DECIMAL(10,2)) * (v_item->>'quantity')::INTEGER,
                    (v_commission->>'primaryRate')::DECIMAL(5,2),
                    (v_commission->>'primary')::DECIMAL(10,2),
                    TO_CHAR(NOW(), 'YYYY-MM'),
                    FALSE,
                    NOW()
                );
            END IF;

            -- Secondary staff commission (services only)
            IF v_item->>'itemType' = 'service'
               AND v_item->>'secondaryStaffId' IS NOT NULL
               AND (v_commission->>'secondary')::DECIMAL(10,2) > 0 THEN
                INSERT INTO public.commissions (
                    staff_id, sale_id, service_name, sale_amount,
                    commission_rate, amount, month, is_paid, created_at
                ) VALUES (
                    (v_item->>'secondaryStaffId')::UUID,
                    v_sale_id,
                    v_item->>'name',
                    COALESCE((v_item->>'originalPrice')::DECIMAL(10,2), (v_item->>'price')::DECIMAL(10,2)) * (v_item->>'quantity')::INTEGER,
                    (v_commission->>'secondaryRate')::DECIMAL(5,2),
                    (v_commission->>'secondary')::DECIMAL(10,2),
                    TO_CHAR(NOW(), 'YYYY-MM'),
                    FALSE,
                    NOW()
                );
            END IF;
        END IF;
    END LOOP;

    -- 4. Update customer points
    IF p_customer_id IS NOT NULL THEN
        -- Use passed points_earned directly
        v_points_earned := p_points_earned;
        v_net_points_change := v_points_earned - p_points_redeemed;

        -- Get current customer data
        SELECT points_balance, visit_count
        INTO v_current_points_balance, v_current_visit_count
        FROM public.customers
        WHERE id = p_customer_id;

        v_new_points_balance := COALESCE(v_current_points_balance, 0) + v_net_points_change;

        -- Update customer
        UPDATE public.customers
        SET points_balance = v_new_points_balance,
            visit_count = COALESCE(v_current_visit_count, 0) + 1,
            updated_at = NOW()
        WHERE id = p_customer_id;

        -- Record points redemption
        IF p_points_redeemed > 0 THEN
            INSERT INTO public.points_transactions (
                customer_id, type, points, balance_after,
                reference_id, reason, performed_by, created_at
            ) VALUES (
                p_customer_id, 'redeemed', -p_points_redeemed,
                COALESCE(v_current_points_balance, 0) - p_points_redeemed,
                v_sale_id, 'POS Redemption', p_created_by, NOW()
            );
        END IF;

        -- Record points earned
        IF v_points_earned > 0 THEN
            INSERT INTO public.points_transactions (
                customer_id, type, points, balance_after,
                reference_id, reason, performed_by, created_at
            ) VALUES (
                p_customer_id, 'earned', v_points_earned, v_new_points_balance,
                v_sale_id, 'POS Purchase', p_created_by, NOW()
            );
        END IF;
    END IF;

    -- Return success with sale ID
    RETURN jsonb_build_object(
        'success', TRUE,
        'saleId', v_sale_id
    );

EXCEPTION
    WHEN OTHERS THEN
        -- Any error will rollback the entire transaction
        RAISE EXCEPTION 'Sale completion failed: %', SQLERRM;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
