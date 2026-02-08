const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

// Read .env.local file manually
const envPath = path.join(__dirname, '..', '.env.local');
const envContent = fs.readFileSync(envPath, 'utf-8');
const envVars = {};
envContent.split('\n').forEach(line => {
  const [key, ...valueParts] = line.split('=');
  if (key && valueParts.length) {
    envVars[key.trim()] = valueParts.join('=').trim();
  }
});

const supabaseUrl = envVars.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = envVars.SUPABASE_SERVICE_ROLE_KEY || envVars.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('Missing Supabase credentials. Check .env.local file.');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Haida Muslimah Salon - Complete Service List (39 services)
const services = [
  // ============ HAIRCUT ============
  { name: "Hair Cut (Adult)", category: "Haircut", price: 30, member_price: 27, duration_minutes: 30, commission_rate: 10, is_active: true },
  { name: "Hair Cut (Kids under 12)", category: "Haircut", price: 15, member_price: 13, duration_minutes: 20, commission_rate: 10, is_active: true },

  // ============ TREATMENT ============
  { name: "Hair Treatment", category: "Treatment", price: 150, member_price: 135, duration_minutes: 60, commission_rate: 15, is_active: true },
  { name: "Standard Scalp Treatment", category: "Treatment", price: 150, member_price: 135, duration_minutes: 45, commission_rate: 15, is_active: true },
  { name: "Premium Scalp Treatment", category: "Treatment", price: 229, member_price: 206, duration_minutes: 60, commission_rate: 15, is_active: true },

  // ============ HAIR WASH ============
  { name: "Hair Wash (Short)", category: "Hair Wash", price: 40, member_price: 36, duration_minutes: 20, commission_rate: 10, is_active: true },
  { name: "Hair Wash (Medium)", category: "Hair Wash", price: 45, member_price: 40, duration_minutes: 25, commission_rate: 10, is_active: true },
  { name: "Hair Wash (Long)", category: "Hair Wash", price: 50, member_price: 45, duration_minutes: 30, commission_rate: 10, is_active: true },
  { name: "Hair Wash (Kids)", category: "Hair Wash", price: 30, member_price: 27, duration_minutes: 15, commission_rate: 10, is_active: true },

  // ============ REBONDING KOREA ============
  { name: "Rebonding Korea (Medium)", category: "Rebonding", price: 200, member_price: 180, duration_minutes: 120, commission_rate: 15, is_active: true },
  { name: "Rebonding Korea (Long)", category: "Rebonding", price: 260, member_price: 234, duration_minutes: 150, commission_rate: 15, is_active: true },
  { name: "Rebonding Korea (Extra Long)", category: "Rebonding", price: 340, member_price: 306, duration_minutes: 180, commission_rate: 15, is_active: true },

  // ============ REBONDING JAPAN ============
  { name: "Rebonding Japan (Medium)", category: "Rebonding", price: 280, member_price: 252, duration_minutes: 120, commission_rate: 15, is_active: true },
  { name: "Rebonding Japan (Long)", category: "Rebonding", price: 380, member_price: 342, duration_minutes: 150, commission_rate: 15, is_active: true },
  { name: "Rebonding Japan (Extra Long)", category: "Rebonding", price: 480, member_price: 432, duration_minutes: 180, commission_rate: 15, is_active: true },

  // ============ HAIR COLOR ============
  { name: "Hair Color (Short)", category: "Hair Color", price: 170, member_price: 153, duration_minutes: 90, commission_rate: 15, is_active: true },
  { name: "Hair Color (Medium)", category: "Hair Color", price: 220, member_price: 198, duration_minutes: 120, commission_rate: 15, is_active: true },
  { name: "Hair Color (Long)", category: "Hair Color", price: 280, member_price: 252, duration_minutes: 150, commission_rate: 15, is_active: true },
  { name: "Hair Color (Extra Long)", category: "Hair Color", price: 350, member_price: 315, duration_minutes: 180, commission_rate: 15, is_active: true },

  // ============ HENNA ============
  { name: "Henna (Short)", category: "Henna", price: 60, member_price: 54, duration_minutes: 60, commission_rate: 12, is_active: true },
  { name: "Henna (Medium)", category: "Henna", price: 70, member_price: 63, duration_minutes: 75, commission_rate: 12, is_active: true },
  { name: "Henna (Long)", category: "Henna", price: 80, member_price: 72, duration_minutes: 90, commission_rate: 12, is_active: true },
  { name: "Henna (Extra Long)", category: "Henna", price: 100, member_price: 90, duration_minutes: 120, commission_rate: 12, is_active: true },

  // ============ BLEACHING ============
  { name: "Bleaching (Short)", category: "Bleaching", price: 100, member_price: 90, duration_minutes: 60, commission_rate: 15, is_active: true },
  { name: "Bleaching (Medium)", category: "Bleaching", price: 150, member_price: 135, duration_minutes: 90, commission_rate: 15, is_active: true },
  { name: "Bleaching (Long)", category: "Bleaching", price: 200, member_price: 180, duration_minutes: 120, commission_rate: 15, is_active: true },
  { name: "Bleaching (Extra Long)", category: "Bleaching", price: 250, member_price: 225, duration_minutes: 150, commission_rate: 15, is_active: true },

  // ============ HIGHLIGHT ============
  { name: "Highlight (Short)", category: "Highlight", price: 150, member_price: 135, duration_minutes: 90, commission_rate: 15, is_active: true },
  { name: "Highlight (Medium)", category: "Highlight", price: 200, member_price: 180, duration_minutes: 120, commission_rate: 15, is_active: true },
  { name: "Highlight (Long)", category: "Highlight", price: 250, member_price: 225, duration_minutes: 150, commission_rate: 15, is_active: true },
  { name: "Highlight (Extra Long)", category: "Highlight", price: 300, member_price: 270, duration_minutes: 180, commission_rate: 15, is_active: true },

  // ============ BODY MASSAGE ============
  { name: "Full Body Massage (45 min)", category: "Massage", price: 90, member_price: 81, duration_minutes: 45, commission_rate: 12, is_active: true },
  { name: "Full Body Massage (1 hour)", category: "Massage", price: 110, member_price: 99, duration_minutes: 60, commission_rate: 12, is_active: true },
  { name: "Back Body Massage (30 min)", category: "Massage", price: 69, member_price: 62, duration_minutes: 30, commission_rate: 12, is_active: true },
  { name: "Foot Massage (30 min)", category: "Massage", price: 45, member_price: 40, duration_minutes: 30, commission_rate: 12, is_active: true },

  // ============ BODY TREATMENT ============
  { name: "Full Body Scrub", category: "Body Treatment", price: 80, member_price: 72, duration_minutes: 45, commission_rate: 12, is_active: true },
  { name: "Milk Bath", category: "Body Treatment", price: 100, member_price: 90, duration_minutes: 45, commission_rate: 12, is_active: true },
  { name: "Flower Bath", category: "Body Treatment", price: 130, member_price: 117, duration_minutes: 60, commission_rate: 12, is_active: true },
  { name: "Eyelash Perming", category: "Body Treatment", price: 59, member_price: 53, duration_minutes: 45, commission_rate: 10, is_active: true }
];

async function seedServices() {
  console.log('Starting to seed services...');
  console.log(`Total services to insert: ${services.length}`);

  // First, check if services table exists and clear existing data
  const { data: existing, error: fetchError } = await supabase
    .from('services')
    .select('id')
    .limit(1);

  if (fetchError) {
    console.error('Error checking services table:', fetchError.message);
    console.log('Make sure the services table exists in your Supabase database.');
    process.exit(1);
  }

  // Delete existing services (optional - comment out if you want to keep existing)
  console.log('Clearing existing services...');
  const { error: deleteError } = await supabase
    .from('services')
    .delete()
    .neq('id', '00000000-0000-0000-0000-000000000000'); // Delete all

  if (deleteError) {
    console.error('Error clearing services:', deleteError.message);
  }

  // Insert new services
  console.log('Inserting new services...');
  const { data, error } = await supabase
    .from('services')
    .insert(services)
    .select();

  if (error) {
    console.error('Error inserting services:', error.message);
    process.exit(1);
  }

  console.log(`\nSuccessfully inserted ${data.length} services!`);

  // Group by category for summary
  const categories = {};
  data.forEach(s => {
    if (!categories[s.category]) categories[s.category] = [];
    categories[s.category].push(s.name);
  });

  console.log('\n--- Services by Category ---');
  Object.keys(categories).forEach(cat => {
    console.log(`\n${cat}: ${categories[cat].length} services`);
    categories[cat].forEach(name => console.log(`  - ${name}`));
  });

  console.log('\nSeeding completed!');
}

seedServices().catch(console.error);
