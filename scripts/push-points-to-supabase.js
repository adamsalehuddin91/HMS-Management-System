/**
 * HMS Salon - Push Points Balance to Supabase via API
 * Option B: Last 6 months (Aug 2025 - Jan 2026)
 * Formula: 1 point per RM1 spent = floor(total)
 */

const { createClient } = require('@supabase/supabase-js');
const XLSX = require('xlsx');
const path = require('path');

const SUPABASE_URL = 'https://vntytlgvjdfqltntngks.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZudHl0bGd2amRmcWx0bnRuZ2tzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MDA0MjYwMCwiZXhwIjoyMDg1NjE4NjAwfQ.4sx_XQvE_JXpcR3YQHKbGNUhnnw6RZN2IFt_xkcSMZU';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

const baseDir = 'E:/Project-AI-MemoryCore-main/ProjectBrief/haidamuslimahsalon_dashboard_overview/HMSolddatabase';

const receiptFiles = [
  'Receipt Aug2025.xlsx',
  'Receipt Sept2025.xlsx',
  'Receipt Oct2025.xlsx',
  'Receipt Nov2025.xlsx',
  'Receipt Dec2025.xlsx',
  'Receipt Jan2026.xlsx',
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

async function main() {
  console.log('=== HMS Salon - Push Points to Supabase ===');
  console.log('Option B: Last 6 months (Aug 2025 - Jan 2026)\n');

  // Step 1: Load ALL customers
  console.log('Loading customers...');
  const customerByPhone = new Map();
  let offset = 0;
  const PAGE = 1000;
  while (true) {
    const { data: batch, error } = await supabase
      .from('customers')
      .select('id, phone, points_balance')
      .range(offset, offset + PAGE - 1);
    if (error) { console.error('Error:', error.message); return; }
    batch.forEach(c => { if (c.phone) customerByPhone.set(c.phone, c); });
    if (batch.length < PAGE) break;
    offset += PAGE;
  }
  console.log(`Loaded ${customerByPhone.size} customers\n`);

  // Step 2: Calculate points from last 6 months receipts
  console.log('Calculating points from receipts...\n');
  const pointsByPhone = new Map();

  receiptFiles.forEach(file => {
    const wb = XLSX.readFile(path.join(baseDir, file));
    const receipts = XLSX.utils.sheet_to_json(wb.Sheets['receipts']);

    let monthPoints = 0;
    receipts.forEach(r => {
      const phone = normalizePhone(r.CustomerNumber);
      if (!phone || phone.length < 8) return;

      const points = Math.floor(r.Total || 0);
      if (points <= 0) return;

      if (!pointsByPhone.has(phone)) {
        pointsByPhone.set(phone, { totalPoints: 0, totalSpent: 0, txCount: 0, lastDate: null });
      }
      const entry = pointsByPhone.get(phone);
      entry.totalPoints += points;
      entry.totalSpent += (r.Total || 0);
      entry.txCount++;
      entry.lastDate = parseDate(r.Date) || entry.lastDate;
      monthPoints += points;
    });

    console.log(`${file.padEnd(28)} | ${receipts.length} receipts | ${monthPoints.toLocaleString()} points`);
  });

  console.log(`\nCustomers with points: ${pointsByPhone.size}`);
  const totalPoints = Array.from(pointsByPhone.values()).reduce((s, e) => s + e.totalPoints, 0);
  console.log(`Total points to distribute: ${totalPoints.toLocaleString()}\n`);

  // Step 3: Update customer points_balance + total_spent
  console.log('Updating customer balances...');
  let updated = 0;
  let notFound = 0;
  let errors = 0;

  for (const [phone, entry] of pointsByPhone) {
    const customer = customerByPhone.get(phone);
    if (!customer) {
      notFound++;
      continue;
    }

    // Update points_balance and total_spent
    const { error: updateErr } = await supabase
      .from('customers')
      .update({
        points_balance: entry.totalPoints,
        total_spent: entry.totalSpent,
      })
      .eq('id', customer.id);

    if (updateErr) {
      console.error(`  ERROR ${phone}: ${updateErr.message}`);
      errors++;
      continue;
    }

    // Insert points_transaction audit record
    const { error: txErr } = await supabase
      .from('points_transactions')
      .insert({
        customer_id: customer.id,
        type: 'earned',
        points: entry.totalPoints,
        balance_after: entry.totalPoints,
        reason: `Migration from Zobaze (${entry.txCount} transactions, Aug 2025-Jan 2026)`,
        created_at: entry.lastDate || new Date().toISOString(),
      });

    if (txErr) {
      console.error(`  ERROR tx ${phone}: ${txErr.message}`);
      errors++;
      continue;
    }

    updated++;
  }

  console.log(`\n=== RESULTS ===`);
  console.log(`Updated: ${updated} customers`);
  console.log(`Not found: ${notFound} (phone not in customer table)`);
  console.log(`Errors: ${errors}`);
  console.log(`Total points distributed: ${totalPoints.toLocaleString()}`);

  // Verify top 10
  console.log('\nTop 10 customers by points:');
  const { data: top } = await supabase
    .from('customers')
    .select('name, phone, points_balance, total_spent')
    .order('points_balance', { ascending: false })
    .limit(10);

  if (top) {
    top.forEach(c => {
      console.log(`  ${(c.name || '').padEnd(35)} | ${String(c.points_balance).padStart(5)} pts | RM ${c.total_spent}`);
    });
  }

  console.log('\nDone!');
}

main().catch(console.error);
