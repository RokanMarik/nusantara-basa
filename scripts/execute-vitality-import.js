const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env' });

console.log('=== EXECUTING VITALITY IMPORT TO SUPABASE ===\n');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Missing Supabase credentials in .env');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Load SQL statements
const fs = require('fs');
const sqlContent = fs.readFileSync('data/import-vitality-statistik-2023.sql', 'utf-8');

// Split into individual statements and filter out empty ones
const statements = sqlContent
  .split(';')
  .map(s => s.trim())
  .filter(s => s.length > 5 && !s.startsWith('--'));

console.log(`Found ${statements.length} UPDATE statements to execute\n`);
console.log('Executing...\n');

let successCount = 0;
let errorCount = 0;
const errors = [];

async function executeSequentially() {
  for (let i = 0; i < statements.length; i++) {
    const statement = statements[i];
    const lineNumber = i + 1;
    
    try {
      const result = await supabase.rpc('execute_sql', { sql_query: statement });
      
      // Check if update was successful (check affected rows if possible)
      successCount++;
      process.stdout.write(`✅ ${lineNumber}/${statements.length}\r`);
      
      // Log first few for verification
      if (lineNumber <= 3) {
        console.log(`\nStatement ${lineNumber}: ${statement.substring(0, 100)}...`);
      }
    } catch (err) {
      errorCount++;
      errors.push({
        line: lineNumber,
        sql: statement.substring(0, 100),
        error: err.message
      });
      console.error(`❌ Statement ${lineNumber} failed:`, err.message);
    }
  }
  
  console.log('\n' + '='.repeat(60));
  console.log('IMPORT RESULTS');
  console.log('='.repeat(60));
  console.log(`✅ Successfully updated: ${successCount} records`);
  console.log(`❌ Failed: ${errorCount} records`);
  
  if (errors.length > 0) {
    console.log('\n❌ Errors encountered:');
    errors.slice(0, 5).forEach(err => {
      console.log(`  Line ${err.line}: ${err.sql}...`);
      console.log(`     Error: ${err.error}`);
    });
  }
  
  console.log('='.repeat(60));
  
  // Verify results
  console.log('\n🔍 Verifying imports by checking updated records...');
  
  try {
    const { data, error } = await supabase
      .from('bahasa')
      .select('id, nama_bahasa, status_vitalitas, catatan, diperbarui_pada')
      .is('status_vitalitas', null)
      .limit(5);
    
    if (error) {
      console.error('Error during verification:', error.message);
    } else {
      console.log(`Found ${data ? data.length : 0} languages WITHOUT status_vitalitas (checking...)`);
      
      const { data: withStatus, error: statusError } = await supabase
        .from('bahasa')
        .select('nama_bahasa, status_vitalitas')
        .not('status_vitalitas', 'is', null)
        .limit(20);
      
      if (statusError) {
        console.error('Error:', statusError.message);
      } else {
        console.log('\n✅ Sample of languages WITH status_vitalitas:');
        withStatus.forEach(l => {
          console.log(`   • ${l.nama_bahasa.padEnd(40)} → ${l.status_vitalitas}`);
        });
        
        const totalWithStatus = await supabase
          .from('bahasa')
          .select('*', { count: 'exact', head: true })
          .not('status_vitalitas', 'is', null);
          
        const count = totalWithStatus.data;
        const total = await supabase.from('bahasa').select('*', { count: 'exact', head: true });
        
        if (typeof count !== 'number' && typeof total.data === 'number') {
          console.log(`\n📊 Summary:`);
          console.log(`   Languages with status_vitalitas: ${count}`);
          console.log(`   Total languages in database: ${total.data}`);
          console.log(`   Coverage: ${((count / total.data) * 100).toFixed(1)}%`);
        }
      }
    }
  } catch (err) {
    console.error('Verification error:', err.message);
  }
  
  console.log('\n🎉 Import complete!');
}

executeSequentially().catch(console.error);
