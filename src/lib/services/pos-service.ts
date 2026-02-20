import { createClient } from "@/lib/supabase/client";
import { logError } from "@/lib/utils/error-logger";
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
        products,
        isPromotional = false,
    }: {
        user: { id: string } | null;
        selectedCustomer: { id: string; points_balance?: number; visit_count?: number } | null;
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
        products: { id: string; stock_quantity: number }[];
        isPromotional?: boolean;
    }) {
        const supabase = createClient();

        // Prepare cart items with commission calculations
        const cartItemsWithCommissions = cart.map(item => {
            const primaryStaff = staff.find(s => s.id === item.primaryStaffId);
            const secondaryStaff = item.secondaryStaffId ? staff.find(s => s.id === item.secondaryStaffId) : null;

            // Commission always based on original price, not promo price
            const commissionPrice = item.originalPrice || item.price;
            const commission = primaryStaff
                ? calculateItemCommission(commissionPrice, item.quantity, primaryStaff, secondaryStaff || null, item.itemType)
                : null;

            return {
                id: item.id,
                itemType: item.itemType,
                name: item.name,
                primaryStaffId: item.primaryStaffId || null,
                secondaryStaffId: item.secondaryStaffId || null,
                quantity: item.quantity,
                price: item.price,
                originalPrice: item.originalPrice || item.price,
                commission: commission ? {
                    primary: commission.primary,
                    primaryRate: commission.primaryRate,
                    secondary: commission.secondary || 0,
                    secondaryRate: commission.secondaryRate || 0
                } : null,
                promoId: item.promoId || null,
                promoDescription: item.promoDescription || null
            };
        });

        // Build RPC params — base params that exist in current DB
        const rpcParams: Record<string, unknown> = {
            p_customer_id: selectedCustomer?.id || null,
            p_booking_id: currentBookingId || null,
            p_subtotal: subtotal,
            p_discount_amount: 0,
            p_points_redeemed: actualPointsToRedeem,
            p_points_discount: pointsDiscount,
            p_deposit_deducted: actualDepositDeduction,
            p_total: total,
            p_payment_method: paymentMethod,
            p_created_by: user?.id || null,
            p_cart_items: cartItemsWithCommissions,
            p_products: products,
        };

        // Try with new params first, fallback without if RPC doesn't support them yet
        let data, error;
        ({ data, error } = await supabase.rpc('complete_sale', {
            ...rpcParams,
            p_is_promotional: isPromotional,
            p_points_earned: pointsEarned,
        }));

        // If error is about unknown params, retry without the new ones
        if (error && (error.message?.includes('p_is_promotional') || error.message?.includes('p_points_earned') || error.code === '42883')) {
            console.log('RPC fallback: complete_sale without promo params');
            ({ data, error } = await supabase.rpc('complete_sale', rpcParams));
        }

        if (error) {
            // Check for specific error types
            if (error.message?.includes('Insufficient stock')) {
                throw new Error('One or more products have insufficient stock. Please refresh and try again.');
            }
            console.error('complete_sale RPC error:', JSON.stringify(error, null, 2));
            throw new Error(error.message || `RPC failed (${error.code}): ${JSON.stringify(error)}`);
        }

        if (!data?.saleId) {
            throw new Error('Sale completed but no sale ID returned. Please check recent transactions.');
        }

        return { saleId: data.saleId };
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
            logError('POS Service - Void Sale', fetchError);
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
            logError('POS Service - Void Sale', updateSaleError);
            throw updateSaleError;
        }

        // 3. Reverse customer points
        if (sale.customer_id && sale.customer) {
            const pointsEarned = sale.points_earned || 0;
            const pointsRedeemed = sale.points_redeemed || 0;

            // Reversal: deduct earned, add back redeemed (never go below 0)
            const currentBalance = sale.customer.points_balance || 0;
            const newBalance = Math.max(0, currentBalance - pointsEarned + pointsRedeemed);

            await supabase.from('customers')
                .update({
                    points_balance: newBalance,
                    updated_at: new Date().toISOString()
                })
                .eq('id', sale.customer_id);

            // Record points transactions with correct running balance
            const reversalTransactions = [];
            let runningBalance = currentBalance;

            if (pointsEarned > 0) {
                runningBalance -= pointsEarned;
                reversalTransactions.push({
                    customer_id: sale.customer_id,
                    type: 'adjust',
                    points: -pointsEarned,
                    balance_after: runningBalance,
                    reference_id: saleId,
                    reason: 'POS Void (Earned Reversal)',
                    performed_by: voidedBy
                });
            }
            if (pointsRedeemed > 0) {
                runningBalance += pointsRedeemed;
                reversalTransactions.push({
                    customer_id: sale.customer_id,
                    type: 'adjust',
                    points: pointsRedeemed,
                    balance_after: runningBalance,
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
