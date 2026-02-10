/**
 * Cleanup partially imported Feb 2025 sales
 * (imported with only 1000/5208 customers loaded)
 */

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = 'https://vntytlgvjdfqltntngks.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZudHl0bGd2amRmcWx0bnRuZ2tzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MDA0MjYwMCwiZXhwIjoyMDg1NjE4NjAwfQ.4sx_XQvE_JXpcR3YQHKbGNUhnnw6RZN2IFt_xkcSMZU';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

async function main() {
  console.log('=== Cleanup partial Feb 2025 import ===\n');

  // Find Feb 2025 Zobaze sales
  const { data: sales, error } = await supabase
    .from('sales')
    .select('id')
    .like('notes', 'Zobaze HM-%')
    .gte('created_at', '2025-02-01')
    .lt('created_at', '2025-03-01');

  if (error) {
    console.error('Error finding sales:', error.message);
    return;
  }

  console.log(`Found ${sales.length} Feb 2025 Zobaze sales to delete`);

  if (sales.length === 0) {
    console.log('Nothing to clean up');
    return;
  }

  const saleIds = sales.map(s => s.id);

  // Delete sale_items first (FK constraint)
  const { error: itemErr } = await supabase
    .from('sale_items')
    .delete()
    .in('sale_id', saleIds);

  if (itemErr) {
    console.error('Error deleting sale_items:', itemErr.message);
    return;
  }
  console.log('Deleted sale_items for Feb 2025');

  // Delete sales
  const { error: saleErr } = await supabase
    .from('sales')
    .delete()
    .in('id', saleIds);

  if (saleErr) {
    console.error('Error deleting sales:', saleErr.message);
    return;
  }
  console.log('Deleted sales for Feb 2025');
  console.log('\nCleanup done! Ready to re-import.');
}

main().catch(console.error);
