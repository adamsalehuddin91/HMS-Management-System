/**
 * HMS Salon - Points Backfill from Zobaze Receipts
 * Option B: Last 6 months only (Aug 2025 - Jan 2026)
 *
 * Formula: 1 point per RM1 spent = floor(receipt.Total)
 * Respects 6-month expiry rule
 */

const XLSX = require('xlsx');
const path = require('path');
const fs = require('fs');

const baseDir = 'E:/Project-AI-MemoryCore-main/ProjectBrief/haidamuslimahsalon_dashboard_overview/HMSolddatabase';
const outputFile = path.join(__dirname, 'import-points-data.sql');

// Last 6 months of receipts
const receiptFiles = [
  'Receipt Aug2025.xlsx',
  'Receipt Sept2025.xlsx',
  'Receipt Oct2025.xlsx',
  'Receipt Nov2025.xlsx',
  'Receipt Dec2025.xlsx',
  'Receipt Jan2026.xlsx',
];

// Helper: normalize phone
function normalizePhone(phone) {
  if (!phone) return '';
  return String(phone).replace(/[\s\-()]/g, '').trim();
}

// Helper: escape SQL
function esc(str) {
  if (!str) return '';
  return String(str).replace(/'/g, "''").trim();
}

// Helper: parse Zobaze date
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

// =============================================
// Step 1: Load all receipts from 6-month window
// =============================================
console.log('=== POINTS BACKFILL (Option B: Last 6 Months) ===\n');

const allReceipts = [];

receiptFiles.forEach(file => {
  const wb = XLSX.readFile(path.join(baseDir, file));
  const receipts = XLSX.utils.sheet_to_json(wb.Sheets['receipts']);
  console.log(`${file.padEnd(28)} | ${receipts.length} receipts`);
  receipts.forEach(r => {
    allReceipts.push({
      date: r.Date,
      receiptId: r.ReceiptId,
      customerName: (r.CustomerName || '').trim(),
      customerPhone: normalizePhone('+60' + r.CustomerNumber),
      total: r.Total || 0,
      subtotal: r.Subtotal || 0,
      discount: r.Discount || 0,
      paymentMode: r.PaymentMode,
    });
  });
});

console.log(`\nTotal receipts (6 months): ${allReceipts.length}`);

// =============================================
// Step 2: Aggregate points per customer (by phone)
// =============================================
const customerPoints = new Map();

allReceipts.forEach(r => {
  const phone = r.customerPhone;
  if (!phone || phone.length < 8) return;

  const points = Math.floor(r.total);
  if (points <= 0) return;

  if (!customerPoints.has(phone)) {
    customerPoints.set(phone, {
      name: r.customerName,
      phone: phone,
      totalPoints: 0,
      totalSpent: 0,
      transactions: [],
    });
  }

  const cust = customerPoints.get(phone);
  cust.totalPoints += points;
  cust.totalSpent += r.total;
  // Keep latest name if available
  if (r.customerName && r.customerName.length > (cust.name || '').length) {
    cust.name = r.customerName;
  }
  cust.transactions.push({
    date: r.date,
    receiptId: r.receiptId,
    total: r.total,
    points: points,
  });
});

console.log(`Customers with points: ${customerPoints.size}`);

// Stats
let totalPoints = 0;
let totalSpent = 0;
const pointsBuckets = { '0-50': 0, '51-200': 0, '201-500': 0, '501-1000': 0, '1000+': 0 };

customerPoints.forEach(c => {
  totalPoints += c.totalPoints;
  totalSpent += c.totalSpent;
  if (c.totalPoints <= 50) pointsBuckets['0-50']++;
  else if (c.totalPoints <= 200) pointsBuckets['51-200']++;
  else if (c.totalPoints <= 500) pointsBuckets['201-500']++;
  else if (c.totalPoints <= 1000) pointsBuckets['501-1000']++;
  else pointsBuckets['1000+']++;
});

console.log(`Total points to award: ${totalPoints.toLocaleString()}`);
console.log(`Total spent (6 months): RM ${totalSpent.toLocaleString()}`);
console.log('\nPoints distribution:');
Object.entries(pointsBuckets).forEach(([range, count]) => {
  console.log(`  ${range.padEnd(10)} : ${count} customers`);
});

// Top 10 customers
const topCustomers = Array.from(customerPoints.values())
  .sort((a, b) => b.totalPoints - a.totalPoints)
  .slice(0, 10);

console.log('\nTop 10 customers by points:');
topCustomers.forEach(c => {
  console.log(`  ${c.name.padEnd(35)} | ${c.totalPoints} pts | RM ${c.totalSpent.toFixed(0)} | ${c.transactions.length} visits`);
});

// =============================================
// Step 3: Generate SQL
// =============================================
const sql = [];

sql.push('-- ============================================');
sql.push('-- HMS Salon - Points Backfill (Option B)');
sql.push('-- Period: Aug 2025 - Jan 2026 (6 months)');
sql.push('-- Generated: ' + new Date().toISOString().split('T')[0]);
sql.push('-- Formula: 1 point per RM1 spent = floor(total)');
sql.push('-- ============================================');
sql.push('');
sql.push('-- IMPORTANT: Run AFTER import-zobaze-data.sql');
sql.push('-- This updates existing customer points_balance');
sql.push('-- and creates points_transaction records');
sql.push('');

// Update customer points_balance and total_spent
sql.push('-- ============================================');
sql.push('-- STEP 1: UPDATE CUSTOMER POINTS BALANCE');
sql.push('-- ============================================');
sql.push('');

const BATCH = 200;
const entries = Array.from(customerPoints.values());

for (let i = 0; i < entries.length; i += BATCH) {
  const batch = entries.slice(i, i + BATCH);
  const batchNum = Math.floor(i / BATCH) + 1;
  const totalBatches = Math.ceil(entries.length / BATCH);

  sql.push(`-- Batch ${batchNum}/${totalBatches}`);

  batch.forEach(c => {
    sql.push(`UPDATE customers SET points_balance = ${c.totalPoints}, total_spent = ${c.totalSpent.toFixed(2)} WHERE phone = '${esc(c.phone)}';`);
  });

  sql.push('');
}

// Insert points_transactions for audit trail
sql.push('-- ============================================');
sql.push('-- STEP 2: INSERT POINTS TRANSACTIONS (audit trail)');
sql.push('-- One "migration" entry per customer');
sql.push('-- ============================================');
sql.push('');

for (let i = 0; i < entries.length; i += BATCH) {
  const batch = entries.slice(i, i + BATCH);
  const batchNum = Math.floor(i / BATCH) + 1;
  const totalBatches = Math.ceil(entries.length / BATCH);

  sql.push(`-- Points transactions batch ${batchNum}/${totalBatches}`);
  sql.push('INSERT INTO points_transactions (customer_id, type, points, balance_after, reason, created_at)');
  sql.push('SELECT c.id, \'earned\', v.points, v.points, v.reason, v.created_at');
  sql.push('FROM (VALUES');

  const txValues = batch.map(c => {
    const lastDate = parseDate(c.transactions[c.transactions.length - 1].date) || new Date().toISOString();
    const reason = `Migration from Zobaze (${c.transactions.length} transactions, Aug 2025-Jan 2026)`;
    return `  ('${esc(c.phone)}', ${c.totalPoints}, '${esc(reason)}', '${lastDate}'::timestamptz)`;
  });

  sql.push(txValues.join(',\n'));
  sql.push(') AS v(phone, points, reason, created_at)');
  sql.push('JOIN customers c ON c.phone = v.phone;');
  sql.push('');
}

// Verify
sql.push('-- ============================================');
sql.push('-- STEP 3: VERIFY POINTS IMPORT');
sql.push('-- ============================================');
sql.push('');
sql.push('-- Check total points distributed');
sql.push('SELECT');
sql.push("  COUNT(*) FILTER (WHERE points_balance > 0) AS customers_with_points,");
sql.push("  SUM(points_balance) AS total_points_distributed,");
sql.push("  ROUND(AVG(points_balance) FILTER (WHERE points_balance > 0)) AS avg_points,");
sql.push("  MAX(points_balance) AS max_points");
sql.push('FROM customers;');
sql.push('');
sql.push('-- Top 10 by points');
sql.push('SELECT name, phone, points_balance, total_spent, tier');
sql.push('FROM customers');
sql.push('ORDER BY points_balance DESC');
sql.push('LIMIT 10;');

// Write
const output = sql.join('\n');
fs.writeFileSync(outputFile, output, 'utf8');

console.log('\n=== SQL GENERATED ===');
console.log('Output:', outputFile);
console.log('File size:', (output.length / 1024).toFixed(1) + ' KB');
console.log('Customer updates:', entries.length);
console.log('Points transactions:', entries.length);
