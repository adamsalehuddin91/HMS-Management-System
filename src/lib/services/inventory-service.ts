import { createClient } from "@/lib/supabase/client";
import { Product, StockMovement } from "@/types";

export const inventoryService = {
  /**
   * Fetch all inventory products with their UI-required fields
   */
  async getProducts() {
    const supabase = createClient();
    const { data, error } = await supabase
      .from('products')
      .select('*')
      .order('name');

    if (error) throw error;
    return data;
  },

  /**
   * Adjust stock for a product and record the movement
   */
  async adjustStock({
    productId,
    changeAmount,
    balanceBefore,
    type,
    reason,
    performedBy,
    referenceId
  }: {
    productId: string;
    changeAmount: number;
    balanceBefore: number;
    type: 'in' | 'out' | 'adjust';
    reason: string;
    performedBy: string;
    referenceId?: string;
  }) {
    const supabase = createClient();
    const balanceAfter = balanceBefore + changeAmount;

    // 1. Update product stock
    const { error: updateError } = await supabase
      .from('products')
      .update({ 
        stock_quantity: balanceAfter,
        updated_at: new Date().toISOString()
      })
      .eq('id', productId);

    if (updateError) throw updateError;

    // 2. Record stock movement
    const { error: movementError } = await supabase
      .from('stock_movements')
      .insert({
        product_id: productId,
        type,
        quantity: changeAmount,
        balance_before: balanceBefore,
        balance_after: balanceAfter,
        reason,
        reference_id: referenceId,
        performed_by: performedBy,
        created_at: new Date().toISOString()
      });

    if (movementError) {
      console.error("Failed to record stock movement:", movementError);
      // We don't throw here to avoid rolling back the stock update, 
      // though in a production app we should use a transaction/RPC.
    }

    return { balanceAfter };
  },

  /**
   * Fetch stock movement history
   */
  async getMovementHistory(limit = 50) {
    const supabase = createClient();
    const { data, error } = await supabase
      .from('stock_movements')
      .select(`
        *,
        product:products(name, brand)
      `)
      .order('created_at', { ascending: false })
      .limit(limit);

    if (error) throw error;
    return data;
  }
};
