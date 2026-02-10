const XLSX = require('xlsx');
const path = require('path');

const baseDir = 'E:/Project-AI-MemoryCore-main/ProjectBrief/haidamuslimahsalon_dashboard_overview/HMSolddatabase';

// === ANALYZE CUSTOMERS ===
console.log('=== CUSTOMER DATA QUALITY ===\n');
const cwb = XLSX.readFile(path.join(baseDir, 'data Customer.xlsx'));
const customers = XLSX.utils.sheet_to_json(cwb.Sheets['customers']);

const phones = {};
let noName = 0;
let noPhone = 0;

customers.forEach(r => {
  const phone = (r.Phone || '').trim();
  if (!phone) { noPhone++; return; }
  phones[phone] = (phones[phone] || 0) + 1;
  if (!r.Name || !r.Name.trim()) noName++;
});

const dupPhones = Object.entries(phones).filter(([k, v]) => v > 1);
console.log('Total rows:', customers.length);
console.log('No name:', noName);
console.log('No phone:', noPhone);
console.log('Duplicate phones:', dupPhones.length);
console.log('\nTop dupes:');
dupPhones.sort((a, b) => b[1] - a[1]).slice(0, 10).forEach(([phone, count]) => {
  const names = customers.filter(r => (r.Phone || '').trim() === phone).map(r => r.Name || '(no name)');
  console.log('  ', phone, 'x' + count, '-', names.join(', '));
});

// Unique customers by phone
const uniquePhones = Object.keys(phones).length;
console.log('\nUnique customers by phone:', uniquePhones);
console.log('Will import (unique phone + has name):', customers.filter(r => r.Name && r.Name.trim() && r.Phone && r.Phone.trim()).length);

// === ANALYZE INVENTORY ===
console.log('\n\n=== INVENTORY DATA ===\n');
const iwb = XLSX.readFile(path.join(baseDir, 'inventory 09022026.xlsx'));
const inventory = XLSX.utils.sheet_to_json(iwb.Sheets['inventory']);

const services = inventory.filter(r => r.CATEGORY !== 'Produk');
const products = inventory.filter(r => r.CATEGORY === 'Produk');

console.log('Total items:', inventory.length);
console.log('Services (non-Produk):', services.length);
console.log('Products (Produk):', products.length);
console.log('\nService categories:');
const svcCats = {};
services.forEach(r => { svcCats[r.CATEGORY] = (svcCats[r.CATEGORY] || 0) + 1; });
Object.entries(svcCats).forEach(([cat, count]) => console.log('  ', cat, ':', count));
console.log('\nProducts with stock > 0:');
products.filter(r => r.STOCK > 0).forEach(r => console.log('  ', r.ITEM_NAME, '| stock:', r.STOCK, '| price:', r.PRICE));
