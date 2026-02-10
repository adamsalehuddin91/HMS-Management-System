/**
 * HMS Salon - Zobaze Data Import SQL Generator
 *
 * Reads Zobaze Excel exports and generates SQL for Supabase import.
 * - Customers: 5,216 unique (deduplicated by phone)
 * - Services: 63 items (non-Produk categories)
 * - Products: 17 items (Produk category)
 */

const XLSX = require('xlsx');
const path = require('path');
const fs = require('fs');

const baseDir = 'E:/Project-AI-MemoryCore-main/ProjectBrief/haidamuslimahsalon_dashboard_overview/HMSolddatabase';
const outputFile = path.join(__dirname, 'import-zobaze-data.sql');

// Helper: escape single quotes for SQL
function esc(str) {
  if (!str) return '';
  return String(str).replace(/'/g, "''").trim();
}

// Helper: parse Zobaze date format "May 17, 2024 4:53 PM" to ISO
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

// Helper: normalize phone (remove spaces, ensure +60 prefix)
function normalizePhone(phone) {
  if (!phone) return '';
  let p = phone.replace(/[\s\-()]/g, '').trim();
  // Ensure consistent format
  return p;
}

let sql = [];

sql.push('-- ============================================');
sql.push('-- HMS Salon - Zobaze Data Import');
sql.push('-- Generated: ' + new Date().toISOString().split('T')[0]);
sql.push('-- Source: Zobaze POS Excel Exports');
sql.push('-- ============================================');
sql.push('');
sql.push('-- IMPORTANT: Run this in Supabase SQL Editor');
sql.push('-- This script uses ON CONFLICT to avoid duplicates');
sql.push('');

// =============================================
// SECTION 1: SERVICES (63 items)
// =============================================
console.log('Processing inventory...');
const iwb = XLSX.readFile(path.join(baseDir, 'inventory 09022026.xlsx'));
const inventory = XLSX.utils.sheet_to_json(iwb.Sheets['inventory']);

const services = inventory.filter(r => r.CATEGORY !== 'Produk');
const products = inventory.filter(r => r.CATEGORY === 'Produk');

sql.push('-- ============================================');
sql.push('-- STEP 1: Clear existing seed data (optional)');
sql.push('-- Only run this if starting fresh!');
sql.push('-- ============================================');
sql.push('');
sql.push('-- UNCOMMENT BELOW TO CLEAR EXISTING DATA:');
sql.push('-- DELETE FROM sale_items;');
sql.push('-- DELETE FROM commissions;');
sql.push('-- DELETE FROM points_transactions;');
sql.push('-- DELETE FROM sales;');
sql.push('-- DELETE FROM bookings;');
sql.push('-- DELETE FROM services;');
sql.push('-- DELETE FROM products;');
sql.push('-- DELETE FROM customers;');
sql.push('');

sql.push('-- ============================================');
sql.push('-- STEP 2: IMPORT SERVICES (' + services.length + ' items)');
sql.push('-- ============================================');
sql.push('');

// Map Zobaze categories to HMS categories
const categoryMap = {
  'All Item': 'Other',
  'Bleaching': 'Bleaching',
  'Color': 'Color',
  'Haircut': 'Haircut',
  'Package Promotions': 'Package',
  'Rebonding/relaxing': 'Rebonding',
  'Spa': 'Spa',
  'Treatment': 'Treatment',
  'Wash': 'Wash'
};

// Default duration estimates by category
const durationMap = {
  'Other': 30,
  'Bleaching': 120,
  'Color': 90,
  'Haircut': 45,
  'Package': 150,
  'Rebonding': 180,
  'Spa': 60,
  'Treatment': 60,
  'Wash': 30
};

// Default commission rates by category
const commissionMap = {
  'Other': 10,
  'Bleaching': 12,
  'Color': 12,
  'Haircut': 15,
  'Package': 10,
  'Rebonding': 12,
  'Spa': 12,
  'Treatment': 12,
  'Wash': 10
};

sql.push('INSERT INTO services (name, category, price, member_price, duration, duration_minutes, commission_rate, is_active)');
sql.push('VALUES');

const svcValues = services.map(r => {
  const cat = categoryMap[r.CATEGORY] || r.CATEGORY;
  const price = r.PRICE || 0;
  const memberPrice = Math.round(price * 0.9); // 10% member discount default
  const duration = durationMap[cat] || 60;
  const commission = commissionMap[cat] || 10;
  return `  ('${esc(r.ITEM_NAME)}', '${esc(cat)}', ${price}, ${memberPrice}, ${duration}, ${duration}, ${commission}, true)`;
});

sql.push(svcValues.join(',\n'));
sql.push('ON CONFLICT DO NOTHING;');
sql.push('');

// =============================================
// SECTION 2: PRODUCTS (17 items)
// =============================================
sql.push('-- ============================================');
sql.push('-- STEP 3: IMPORT PRODUCTS (' + products.length + ' items)');
sql.push('-- ============================================');
sql.push('');

sql.push('INSERT INTO products (name, brand, category, cost_price, sell_price, stock_quantity, low_stock_threshold, is_active)');
sql.push('VALUES');

const prodValues = products.map(r => {
  const costPrice = r.COST_PRICE || 0;
  const sellPrice = r.PRICE || 0;
  const stock = r.STOCK || 0;
  // Try to extract brand from name
  let brand = 'HMS Salon';
  const name = r.ITEM_NAME || '';
  if (name.includes('Gold 9') || name.includes('Gold9')) brand = 'Gold 9';
  else if (name.includes('Nexxen')) brand = 'Nexxen';
  else if (name.includes('Q10')) brand = 'Q10';
  else if (name.includes('GN ')) brand = 'Gold 9';
  else if (name.includes('G9 ')) brand = 'Gold 9';
  else if (name.includes('ICE SPA')) brand = 'Gold 9';

  return `  ('${esc(name)}', '${esc(brand)}', 'Hair Care', ${costPrice}, ${sellPrice}, ${stock}, 5, true)`;
});

sql.push(prodValues.join(',\n'));
sql.push('ON CONFLICT DO NOTHING;');
sql.push('');

// =============================================
// SECTION 3: CUSTOMERS (5,216 unique)
// =============================================
console.log('Processing customers...');
const cwb = XLSX.readFile(path.join(baseDir, 'data Customer.xlsx'));
const rawCustomers = XLSX.utils.sheet_to_json(cwb.Sheets['customers']);

// Clean & deduplicate by phone
const customerMap = new Map();
rawCustomers.forEach(r => {
  const phone = normalizePhone(r.Phone);
  if (!phone || phone.length < 8) return; // Skip invalid phones like "+601"

  // Fix: If Email has no @ sign, it's actually a name (Zobaze quirk)
  let name = (r.Name || '').trim();
  let email = (r.Email || '').trim();

  if (email && !email.includes('@')) {
    // Email field contains a name, not an email
    if (!name) name = email;
    email = '';
  }

  // Skip junk names (pure numbers, single chars)
  if (/^\d+$/.test(name)) name = '';

  // Skip if no usable name
  if (!name) return;

  // Store cleaned data back
  r._cleanName = name;
  r._cleanEmail = email;
  r._cleanPhone = phone;

  const existing = customerMap.get(phone);
  if (!existing || (r.NumberOfOrders || 0) > (existing.NumberOfOrders || 0)) {
    customerMap.set(phone, r);
  }
});

const uniqueCustomers = Array.from(customerMap.values());
console.log('Unique customers:', uniqueCustomers.length);

sql.push('-- ============================================');
sql.push('-- STEP 4: IMPORT CUSTOMERS (' + uniqueCustomers.length + ' unique)');
sql.push('-- ============================================');
sql.push('-- Note: Batch insert in groups of 500 for Supabase limits');
sql.push('');

// Batch insert customers (Supabase has row limits per statement)
const BATCH_SIZE = 500;
for (let i = 0; i < uniqueCustomers.length; i += BATCH_SIZE) {
  const batch = uniqueCustomers.slice(i, i + BATCH_SIZE);
  const batchNum = Math.floor(i / BATCH_SIZE) + 1;
  const totalBatches = Math.ceil(uniqueCustomers.length / BATCH_SIZE);

  sql.push(`-- Batch ${batchNum}/${totalBatches} (rows ${i + 1}-${Math.min(i + BATCH_SIZE, uniqueCustomers.length)})`);
  sql.push('INSERT INTO customers (name, phone, email, tier, points_balance, total_spent, visit_count, is_member, created_at, updated_at)');
  sql.push('VALUES');

  const custValues = batch.map(r => {
    const name = esc(r._cleanName || r.Name || 'Customer');
    const phone = esc(r._cleanPhone || normalizePhone(r.Phone));
    const email = r._cleanEmail ? esc(r._cleanEmail) : '';
    const visits = r.NumberOfOrders || 0;

    // Auto-tier based on visit count
    let tier = 'Normal';
    if (visits >= 20) tier = 'VIP';
    else if (visits >= 5) tier = 'Member';

    const isMember = tier !== 'Normal';
    const createdAt = parseDate(r.AddedDate) || new Date().toISOString();
    const updatedAt = parseDate(r.LastVisited) || createdAt;

    return `  ('${name}', '${phone}', '${email}', '${tier}', 0, 0, ${visits}, ${isMember}, '${createdAt}', '${updatedAt}')`;
  });

  sql.push(custValues.join(',\n'));
  sql.push('ON CONFLICT DO NOTHING;');
  sql.push('');
}

// =============================================
// SECTION 4: SUMMARY
// =============================================
sql.push('-- ============================================');
sql.push('-- STEP 5: VERIFY IMPORT');
sql.push('-- ============================================');
sql.push('');
sql.push("SELECT 'services' as table_name, COUNT(*) as row_count FROM services");
sql.push('UNION ALL');
sql.push("SELECT 'products', COUNT(*) FROM products");
sql.push('UNION ALL');
sql.push("SELECT 'customers', COUNT(*) FROM customers;");

// Write file
const output = sql.join('\n');
fs.writeFileSync(outputFile, output, 'utf8');

console.log('\n=== IMPORT SQL GENERATED ===');
console.log('Output:', outputFile);
console.log('Services:', services.length);
console.log('Products:', products.length);
console.log('Customers:', uniqueCustomers.length);
console.log('File size:', (output.length / 1024).toFixed(1) + ' KB');

// Auto-tier summary
const tiers = { Normal: 0, Member: 0, VIP: 0 };
uniqueCustomers.forEach(r => {
  const visits = r.NumberOfOrders || 0;
  if (visits >= 20) tiers.VIP++;
  else if (visits >= 5) tiers.Member++;
  else tiers.Normal++;
});
console.log('\nCustomer tiers (auto-assigned):');
console.log('  Normal (0-4 visits):', tiers.Normal);
console.log('  Member (5-19 visits):', tiers.Member);
console.log('  VIP (20+ visits):', tiers.VIP);
