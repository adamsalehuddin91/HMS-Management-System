/**
 * HMS Salon - Push Sales to Supabase via API
 * Uses service_role key to bypass RLS
 * Skips Jan 2025 (already imported)
 */

const { createClient } = require('@supabase/supabase-js');
const XLSX = require('xlsx');
const path = require('path');

const SUPABASE_URL = 'https://vntytlgvjdfqltntngks.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZudHl0bGd2amRmcWx0bnRuZ2tzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MDA0MjYwMCwiZXhwIjoyMDg1NjE4NjAwfQ.4sx_XQvE_JXpcR3YQHKbGNUhnnw6RZN2IFt_xkcSMZU';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

const baseDir = 'E:/Project-AI-MemoryCore-main/ProjectBrief/haidamuslimahsalon_dashboard_overview/HMSolddatabase';

// Files to process (skip Jan 2025 - already done)
const receiptFiles = [
  { file: 'Receipt Feb2025.xlsx', label: 'Feb 2025' },
  { file: 'Receipt March2025.xlsx', label: 'Mar 2025' },
  { file: 'Receipt April2025.xlsx', label: 'Apr 2025' },
  { file: 'Receipt May2025.xlsx', label: 'May 2025' },
  { file: 'Receipt June2025.xlsx', label: 'Jun 2025' },
  { file: 'Receipt July2025.xlsx', label: 'Jul 2025' },
  { file: 'Receipt Aug2025.xlsx', label: 'Aug 2025' },
  { file: 'Receipt Sept2025.xlsx', label: 'Sep 2025' },
  { file: 'Receipt Oct2025.xlsx', label: 'Oct 2025' },
  { file: 'Receipt Nov2025.xlsx', label: 'Nov 2025' },
  { file: 'Receipt Dec2025.xlsx', label: 'Dec 2025' },
  { file: 'Receipt Jan2026.xlsx', label: 'Jan 2026' },
];

function normalizePhone(num) {
  if (!num) return '';
  let p = String(num).replace(/[\s\-()]/g, '').trim();
  if (!p.startsWith('+')) p = '+60' + p;
  return p;
}

function parseDate(dateStr) {
  if (!dateStr) return null;
  try {
    const d = new Date(dateStr);
    if (isNaN(d.getTime())) return null;
    return d.toISOString();
  } catch {
    return null;
  }
}

function mapPayment(mode) {
  if (!mode) return 'cash';
  const m = mode.trim().toLowerCase();
  if (m.includes('cash')) return 'cash';
  if (m.includes('credit')) return 'card';
  if (m.includes('debit')) return 'card';
  if (m.includes('qr')) return 'qr';
  if (m.includes('online') || m.includes('transfer')) return 'transfer';
  return 'cash';
}

function parseEntryName(entry) {
  if (!entry) return { name: '', qty: 1, unitPrice: 0 };
  const match = entry.match(/^(.+?)\s*\((\d+)\s*X\s*([\d.]+)\)$/i);
  if (match) {
    return {
      name: match[1].trim(),
      qty: parseInt(match[2]) || 1,
      unitPrice: parseFloat(match[3]) || 0,
    };
  }
  return { name: entry.trim(), qty: 1, unitPrice: 0 };
}

async function main() {
  console.log('=== HMS Salon - Push Sales to Supabase ===\n');

  // Step 1: Load ALL customers (paginate past 1000 limit)
  console.log('Loading customer lookup...');
  const customerByPhone = new Map();
  let offset = 0;
  const PAGE = 1000;
  while (true) {
    const { data: batch, error: custErr } = await supabase
      .from('customers')
      .select('id, phone')
      .range(offset, offset + PAGE - 1);

    if (custErr) {
      console.error('Failed to load customers:', custErr.message);
      return;
    }
    batch.forEach(c => {
      if (c.phone) customerByPhone.set(c.phone, c.id);
    });
    if (batch.length < PAGE) break;
    offset += PAGE;
  }
  console.log(`Loaded ${customerByPhone.size} customers\n`);

  // Step 2: Load ALL services + products
  console.log('Loading service lookup...');
  const { data: services } = await supabase.from('services').select('id, name').limit(500);
  const { data: products } = await supabase.from('products').select('id, name').limit(500);

  const itemLookup = new Map();
  (services || []).forEach(s => itemLookup.set(s.name, s.id));
  (products || []).forEach(p => itemLookup.set(p.name, p.id));
  console.log(`Loaded ${itemLookup.size} services/products\n`);

  // Step 3: Process each month
  let grandTotal = { receipts: 0, items: 0, errors: 0, revenue: 0 };

  for (const { file, label } of receiptFiles) {
    const wb = XLSX.readFile(path.join(baseDir, file));
    const receipts = XLSX.utils.sheet_to_json(wb.Sheets['receipts']);
    const rawItems = XLSX.utils.sheet_to_json(wb.Sheets['receiptsWithItems']);

    // Group items by receiptId
    const itemsByReceipt = new Map();
    let currentReceiptId = null;
    rawItems.forEach(r => {
      if (r.ReceiptId) currentReceiptId = r.ReceiptId;
      if (r.EntryType === 'Item' && r.EntryName) {
        const parsed = parseEntryName(r.EntryName);
        if (!itemsByReceipt.has(currentReceiptId)) {
          itemsByReceipt.set(currentReceiptId, []);
        }
        itemsByReceipt.get(currentReceiptId).push({
          entryAmount: r.EntryAmount || 0,
          itemName: parsed.name,
          qty: parsed.qty,
          unitPrice: parsed.unitPrice,
        });
      }
    });

    let monthReceipts = 0;
    let monthItems = 0;
    let monthErrors = 0;
    let monthRevenue = 0;

    // Process each receipt
    for (const r of receipts) {
      const phone = normalizePhone(r.CustomerNumber);
      const customerId = customerByPhone.get(phone) || null;
      const date = parseDate(r.Date) || new Date().toISOString();
      const payment = mapPayment(r.PaymentMode);

      // Insert sale
      const { data: sale, error: saleErr } = await supabase
        .from('sales')
        .insert({
          customer_id: customerId,
          subtotal: r.Subtotal || 0,
          discount_amount: r.Discount || 0,
          total: r.Total || 0,
          payment_method: payment,
          status: 'completed',
          notes: `Zobaze ${r.ReceiptId}`,
          created_at: date,
          updated_at: date,
        })
        .select('id')
        .single();

      if (saleErr) {
        console.error(`  ERROR ${r.ReceiptId}: ${saleErr.message}`);
        monthErrors++;
        continue;
      }

      monthReceipts++;
      monthRevenue += (r.Total || 0);

      // Insert sale items
      const items = itemsByReceipt.get(r.ReceiptId) || [];
      if (items.length > 0) {
        const saleItems = items.map(item => {
          const total = item.entryAmount || (item.qty * item.unitPrice);
          const itemId = itemLookup.get(item.itemName) || null;

          return {
            sale_id: sale.id,
            item_type: 'service',
            item_id: itemId || '00000000-0000-0000-0000-000000000000',
            item_name: item.itemName,
            quantity: item.qty,
            price: item.unitPrice,
            unit_price: item.unitPrice,
            total: total,
            created_at: date,
          };
        });

        const { error: itemErr } = await supabase
          .from('sale_items')
          .insert(saleItems);

        if (itemErr) {
          console.error(`  ERROR items ${r.ReceiptId}: ${itemErr.message}`);
          monthErrors++;
        } else {
          monthItems += saleItems.length;
        }
      }
    }

    console.log(`${label.padEnd(10)} | ${String(monthReceipts).padStart(4)} sales | ${String(monthItems).padStart(4)} items | RM ${monthRevenue.toLocaleString().padStart(7)} | errors: ${monthErrors}`);

    grandTotal.receipts += monthReceipts;
    grandTotal.items += monthItems;
    grandTotal.errors += monthErrors;
    grandTotal.revenue += monthRevenue;
  }

  console.log('─'.repeat(65));
  console.log(`TOTAL      | ${String(grandTotal.receipts).padStart(4)} sales | ${String(grandTotal.items).padStart(4)} items | RM ${grandTotal.revenue.toLocaleString()} | errors: ${grandTotal.errors}`);
  console.log('\nDone!');
}

main().catch(console.error);
