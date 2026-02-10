import { createClient } from "@/lib/supabase/client";
import {
    CartItem,
    StaffMember,
    calculateItemCommission,
    getCommissionBreakdown
} from "@/lib/utils/pos-calculations";

export const posService = {
    /**
     * Complete a sale by creating all necessary records in Supabase
     */
    async completeSale({
        user,
        selectedCustomer,
        currentBookingId,
        subtotal,
        pointsDiscount,
        pointsEarned,
        actualPointsToRedeem,
        actualDepositDeduction,
        total,
        paymentMethod,
        cart,
        staff,
        products // Needed to update stock levels
    }: {
        user: any;
        selectedCustomer: any;
        currentBookingId: string | null;
        subtotal: number;
        pointsDiscount: number;
        pointsEarned: number;
        actualPointsToRedeem: number;
        actualDepositDeduction: number;
        total: number;
        paymentMethod: string;
        cart: CartItem[];
        staff: StaffMember[];
        products: any[];
    }) {
        const supabase = createClient();

        // 1. Create the sale record
        const { data: saleData, error: saleError } = await supabase
            .from('sales')
            .insert({
                customer_id: selectedCustomer?.id || null,
                booking_id: currentBookingId || null,
                subtotal: subtotal,
                discount_amount: 0,
                points_redeemed: actualPointsToRedeem,
                points_discount: pointsDiscount,
                deposit_deducted: actualDepositDeduction,
                total: total,
                payment_method: paymentMethod,
                status: 'completed',
                created_by: user?.id || null,
                created_at: new Date().toISOString()
            })
            .select()
            .single();

        if (saleError) throw saleError;

        const saleId = saleData.id;

        // 2. Update booking status to completed if from booking
        if (currentBookingId) {
            await supabase
                .from('bookings')
                .update({ status: 'completed' })
                .eq('id', currentBookingId);
        }

        // 3. Create sale items and commissions
        for (const item of cart) {
            const isProduct = item.itemType === 'product';
            const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
            const secondaryStaff = item.secondaryStaffId ? staff.find(s => s.id === item.secondaryStaffId) : null;

            const commission = primaryStaff
                ? calculateItemCommission(item.price, item.quantity, primaryStaff, secondaryStaff || null, item.itemType)
                : null;

            // Insert sale item
            const { data: saleItemData, error: saleItemError } = await supabase
                .from('sale_items')
                .insert({
                    sale_id: saleId,
                    item_type: item.itemType,
                    item_id: item.id,
                    item_name: item.name,
                    stylist_id: item.primaryStaffId,
                    quantity: item.quantity,
                    price: item.price,
                    unit_price: item.price,
                    discount: 0,
                    total: item.price * item.quantity,
                    commission_rate: commission?.primaryRate || 0,
                    commission_amount: commission?.primary || 0
                })
                .select()
                .single();

            if (saleItemError) throw saleItemError;

            // Deduct stock for products and record movement
            if (isProduct) {
                const product = products.find(p => p.id === item.id);
                if (product) {
                    const balanceBefore = product.stock_quantity;
                    const balanceAfter = Math.max(0, balanceBefore - item.quantity);

                    await supabase
                        .from('products')
                        .update({ stock_quantity: balanceAfter })
                        .eq('id', item.id);

                    // Record record movement (Stock History)
                    await supabase.from('stock_movements').insert({
                        product_id: item.id,
                        type: 'out',
                        quantity: -item.quantity,
                        balance_before: balanceBefore,
                        balance_after: balanceAfter,
                        reason: 'POS Sale',
                        reference_id: saleId,
                        performed_by: user?.id || null
                    });
                }
            }

            // Insert commissions
            if (commission && primaryStaff && saleItemData) {
                const currentMonth = new Date().toISOString().slice(0, 7); // YYYY-MM

                const commissionsToInsert = [];

                if (commission.primary > 0) {
                    commissionsToInsert.push({
                        staff_id: primaryStaff.id,
                        sale_id: saleId,
                        sale_item_id: saleItemData.id,
                        service_name: item.name,
                        sale_amount: item.price * item.quantity,
                        commission_rate: commission.primaryRate,
                        commission_amount: commission.primary,
                        month: currentMonth,
                        is_paid: false
                    });
                }

                if (!isProduct && secondaryStaff && commission.secondary > 0) {
                    commissionsToInsert.push({
                        staff_id: secondaryStaff.id,
                        sale_id: saleId,
                        sale_item_id: saleItemData.id,
                        service_name: item.name,
                        sale_amount: item.price * item.quantity,
                        commission_rate: commission.secondaryRate,
                        commission_amount: commission.secondary,
                        month: currentMonth,
                        is_paid: false
                    });
                }

                if (commissionsToInsert.length > 0) {
                    await supabase.from('commissions').insert(commissionsToInsert);
                }
            }
        }

        // 4. Update customer points
        if (selectedCustomer) {
            const netPointsChange = pointsEarned - actualPointsToRedeem;
            const newBalance = (selectedCustomer.points_balance || 0) + netPointsChange;

            await supabase.from('customers')
                .update({
                    points_balance: newBalance,
                    visit_count: (selectedCustomer.visit_count || 0) + 1,
                    updated_at: new Date().toISOString()
                })
                .eq('id', selectedCustomer.id);

            // Record points transactions
            const pointsTransactions = [];
            if (actualPointsToRedeem > 0) {
                pointsTransactions.push({
                    customer_id: selectedCustomer.id,
                    type: 'redeemed',
                    points: -actualPointsToRedeem,
                    balance_after: (selectedCustomer.points_balance || 0) - actualPointsToRedeem,
                    reference_id: saleId,
                    reason: 'POS Redemption',
                    performed_by: user?.id || null
                });
            }
            if (pointsEarned > 0) {
                pointsTransactions.push({
                    customer_id: selectedCustomer.id,
                    type: 'earned',
                    points: pointsEarned,
                    balance_after: newBalance,
                    reference_id: saleId,
                    reason: 'POS Purchase',
                    performed_by: user?.id || null
                });
            }

            if (pointsTransactions.length > 0) {
                await supabase.from('points_transactions').insert(pointsTransactions);
            }
        }

        return { saleId };
    },

    /**
     * Void a sale and reverse all its effects
     */
    async voidSale({
        saleId,
        voidedBy,
        voidReason
    }: {
        saleId: string;
        voidedBy: string;
        voidReason: string;
    }) {
        const supabase = createClient();

        // 1. Fetch original sale details
        const { data: sale, error: fetchError } = await supabase
            .from('sales')
            .select(`
                *,
                sale_items (*),
                customer:customers (*)
            `)
            .eq('id', saleId)
            .single();

        if (fetchError) {
            console.error("Fetch sale error:", fetchError);
            throw fetchError;
        }
        if (!sale) throw new Error("Sale not found");
        if (sale.status === 'voided') throw new Error("Transaction already voided");

        // 2. Update sale status to voided
        const { error: updateSaleError } = await supabase
            .from('sales')
            .update({
                status: 'voided',
                voided_at: new Date().toISOString(),
                voided_by: voidedBy,
                void_reason: voidReason
            })
            .eq('id', saleId);

        if (updateSaleError) {
            console.error("Update sale status error:", updateSaleError);
            throw updateSaleError;
        }

        // 3. Reverse customer points
        if (sale.customer_id && sale.customer) {
            const pointsEarned = Math.floor(sale.total);
            const pointsRedeemed = sale.points_redeemed || 0;

            // Reversal logic:
            // Earned points -> Deduct
            // Redeemed points -> Add back
            const netPointsReversal = pointsRedeemed - pointsEarned;
            const newBalance = (sale.customer.points_balance || 0) + netPointsReversal;

            await supabase.from('customers')
                .update({
                    points_balance: newBalance,
                    updated_at: new Date().toISOString()
                })
                .eq('id', sale.customer_id);

            // Record points transactions
            const reversalTransactions = [];
            if (pointsEarned > 0) {
                reversalTransactions.push({
                    customer_id: sale.customer_id,
                    type: 'adjusted',
                    points: -pointsEarned,
                    balance_after: (sale.customer.points_balance || 0) - pointsEarned,
                    reference_id: saleId,
                    reason: 'POS Void (Earned Reversal)',
                    performed_by: voidedBy
                });
            }
            if (pointsRedeemed > 0) {
                reversalTransactions.push({
                    customer_id: sale.customer_id,
                    type: 'earned', // Add back as earned or adjusted
                    points: pointsRedeemed,
                    balance_after: newBalance,
                    reference_id: saleId,
                    reason: 'POS Void (Redemption Reversal)',
                    performed_by: voidedBy
                });
            }

            if (reversalTransactions.length > 0) {
                await supabase.from('points_transactions').insert(reversalTransactions);
            }
        }

        // 4. Void commissions
        await supabase
            .from('commissions')
            .update({ status: 'voided' })
            .eq('sale_id', saleId);

        // 5. Restore stock for products
        for (const item of sale.sale_items) {
            if (item.item_type === 'product') {
                const { data: product } = await supabase
                    .from('products')
                    .select('stock_quantity')
                    .eq('id', item.item_id)
                    .single();

                if (product) {
                    const balanceBefore = product.stock_quantity;
                    const balanceAfter = balanceBefore + item.quantity;

                    await supabase
                        .from('products')
                        .update({ stock_quantity: balanceAfter })
                        .eq('id', item.item_id);

                    // Record movement
                    await supabase.from('stock_movements').insert({
                        product_id: item.item_id,
                        type: 'in',
                        quantity: item.quantity,
                        balance_before: balanceBefore,
                        balance_after: balanceAfter,
                        reason: 'POS Void Reversal',
                        reference_id: saleId,
                        performed_by: voidedBy
                    });
                }
            }
        }

        return { success: true };
    }
};
