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
const supabaseKey = envVars.NEXT_PUBLIC_SUPABASE_ANON_KEY;

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkSchema() {
  // Try to fetch one row to see the structure
  const { data, error } = await supabase
    .from('services')
    .select('*')
    .limit(1);

  if (error) {
    console.log('Error:', error.message);
  } else {
    console.log('Sample data:', data);
    if (data && data.length > 0) {
      console.log('\nColumns found:', Object.keys(data[0]));
    } else {
      console.log('Table is empty. Trying to insert a test row...');

      // Try minimal insert to see what columns are required
      const { data: insertData, error: insertError } = await supabase
        .from('services')
        .insert({ name: 'Test', price: 10 })
        .select();

      if (insertError) {
        console.log('Insert error:', insertError.message);
      } else {
        console.log('Inserted:', insertData);
        console.log('Columns:', Object.keys(insertData[0]));

        // Delete test row
        await supabase.from('services').delete().eq('name', 'Test');
      }
    }
  }
}

checkSchema();
