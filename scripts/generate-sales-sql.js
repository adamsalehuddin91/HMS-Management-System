/**
 * HMS Salon - Sales/Receipt Import from Zobaze
 * Split into MONTHLY files for Supabase SQL Editor size limits
 * NO commission records
 */

const XLSX = require('xlsx');
const path = require('path');
const fs = require('fs');

const baseDir = 'E:/Project-AI-MemoryCore-main/ProjectBrief/haidamuslimahsalon_dashboard_overview/HMSolddatabase';
const outputDir = path.join(__dirname, 'sales-import');

// Create output directory
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

const receiptFiles = [
  { file: 'Receipt Jan2025.xlsx', label: '01-jan-2025' },
  { file: 'Receipt Feb2025.xlsx', label: '02-feb-2025' },
  { file: 'Receipt March2025.xlsx', label: '03-mar-2025' },
  { file: 'Receipt April2025.xlsx', label: '04-apr-2025' },
  { file: 'Receipt May2025.xlsx', label: '05-may-2025' },
  { file: 'Receipt June2025.xlsx', label: '06-jun-2025' },
  { file: 'Receipt July2025.xlsx', label: '07-jul-2025' },
  { file: 'Receipt Aug2025.xlsx', label: '08-aug-2025' },
  { file: 'Receipt Sept2025.xlsx', label: '09-sep-2025' },
  { file: 'Receipt Oct2025.xlsx', label: '10-oct-2025' },
  { file: 'Receipt Nov2025.xlsx', label: '11-nov-2025' },
  { file: 'Receipt Dec2025.xlsx', label: '12-dec-2025' },
  { file: 'Receipt Jan2026.xlsx', label: '13-jan-2026' },
];

function esc(str) {
  if (!str) return '';
  return String(str).replace(/'/g, "''").trim();
}

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

// =============================================
// Process each month as separate SQL file
// =============================================
console.log('=== SALES IMPORT - SPLIT BY MONTH ===\n');

let grandTotalReceipts = 0;
let grandTotalItems = 0;
let grandTotalRevenue = 0;

receiptFiles.forEach(({ file, label }) => {
  const wb = XLSX.readFile(path.join(baseDir, file));
  const receipts = XLSX.utils.sheet_to_json(wb.Sheets['receipts']);
  const rawItems = XLSX.utils.sheet_to_json(wb.Sheets['receiptsWithItems']);

  // Parse items grouped by receiptId
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

  const totalItems = Array.from(itemsByReceipt.values()).reduce((sum, arr) => sum + arr.length, 0);
  const totalRevenue = receipts.reduce((sum, r) => sum + (r.Total || 0), 0);

  // Generate SQL for this month - split into batches of 50 receipts per DO block
  const sql = [];
  const BATCH = 50;

  sql.push(`-- ============================================`);
  sql.push(`-- HMS Salon - Sales Import: ${label.toUpperCase()}`);
  sql.push(`-- Receipts: ${receipts.length} | Items: ${totalItems} | Revenue: RM ${totalRevenue.toLocaleString()}`);
  sql.push(`-- Generated: ${new Date().toISOString().split('T')[0]}`);
  sql.push(`-- ============================================`);
  sql.push('');
  sql.push('-- Run AFTER import-zobaze-data.sql (customers must exist)');
  sql.push('');

  for (let i = 0; i < receipts.length; i += BATCH) {
    const batch = receipts.slice(i, i + BATCH);

    sql.push(`-- Batch ${Math.floor(i / BATCH) + 1}/${Math.ceil(receipts.length / BATCH)}`);
    sql.push('DO $$');
    sql.push('DECLARE');
    sql.push('  v_sale_id UUID;');
    sql.push('  v_customer_id UUID;');
    sql.push('BEGIN');

    batch.forEach(r => {
      const date = parseDate(r.Date) || new Date().toISOString();
      const phone = normalizePhone(r.CustomerNumber);
      const items = itemsByReceipt.get(r.ReceiptId) || [];
      const payment = mapPayment(r.PaymentMode);

      sql.push('');
      sql.push(`  -- ${r.ReceiptId} | ${(r.CustomerName || '').trim()} | RM${r.Total}`);
      sql.push(`  v_customer_id := NULL;`);

      if (phone && phone.length >= 8) {
        sql.push(`  SELECT id INTO v_customer_id FROM customers WHERE phone = '${esc(phone)}' LIMIT 1;`);
      }

      sql.push(`  INSERT INTO sales (customer_id, subtotal, discount_amount, total, payment_method, status, notes, created_at, updated_at)`);
      sql.push(`  VALUES (v_customer_id, ${r.Subtotal || 0}, ${r.Discount || 0}, ${r.Total || 0}, '${payment}', 'completed', 'Zobaze ${esc(r.ReceiptId)}', '${date}', '${date}')`);
      sql.push(`  RETURNING id INTO v_sale_id;`);

      if (items.length > 0) {
        sql.push(`  INSERT INTO sale_items (sale_id, item_type, item_id, item_name, quantity, price, unit_price, total, created_at) VALUES`);

        const itemSql = items.map(item => {
          const total = item.entryAmount || (item.qty * item.unitPrice);
          return `    (v_sale_id, 'service', COALESCE((SELECT id FROM services WHERE name = '${esc(item.itemName)}' LIMIT 1), (SELECT id FROM products WHERE name = '${esc(item.itemName)}' LIMIT 1), gen_random_uuid()), '${esc(item.itemName)}', ${item.qty}, ${item.unitPrice}, ${item.unitPrice}, ${total}, '${date}')`;
        });

        sql.push(itemSql.join(',\n') + ';');
      }
    });

    sql.push('');
    sql.push('END $$;');
    sql.push('');
  }

  // Write monthly file
  const outputFile = path.join(outputDir, `sales-${label}.sql`);
  const output = sql.join('\n');
  fs.writeFileSync(outputFile, output, 'utf8');

  const sizeKB = (output.length / 1024).toFixed(0);
  console.log(`${label.padEnd(14)} | ${String(receipts.length).padStart(4)} receipts | ${String(totalItems).padStart(4)} items | RM ${String(totalRevenue.toLocaleString()).padStart(7)} | ${sizeKB} KB`);

  grandTotalReceipts += receipts.length;
  grandTotalItems += totalItems;
  grandTotalRevenue += totalRevenue;
});

console.log('─'.repeat(70));
console.log(`${'TOTAL'.padEnd(14)} | ${String(grandTotalReceipts).padStart(4)} receipts | ${String(grandTotalItems).padStart(4)} items | RM ${grandTotalRevenue.toLocaleString()}`);
console.log(`\nOutput folder: ${outputDir}`);
console.log('Files: 13 monthly SQL files');

// Delete the old single large file if it exists
const oldFile = path.join(__dirname, 'import-sales-data.sql');
if (fs.existsSync(oldFile)) {
  fs.unlinkSync(oldFile);
  console.log('\nRemoved old import-sales-data.sql (too large)');
}
