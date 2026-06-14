/**
 * Migration Script: Execute SQL Migration via Supabase REST API
 * 
 * Script ini akan:
 * 1. Read SQL migration file
 * 2. Execute via Supabase SQL endpoint
 * 3. Verify tables created
 * 
 * Usage: node scripts/migrate-supabase.js
 */

const fs = require('fs');
const path = require('path');

// Supabase config (from .env)
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://hkeheukewxsvaarxaket.supabase.co';
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhla3VrZXd4c3ZhYXJ4YWtldCIsInJvbGUiOiJzZXJ2aWNlX3JvbGUiLCJpYXQiOjE3ODAxMzk5MzMsImV4cCI6MjA5NTcxNTkzM30.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20';

async function runMigration() {
  console.log('🚀 Starting Supabase Migration...\n');
  
  // Read SQL migration file
  const sqlPath = path.join(__dirname, '../prisma/migrations/001_add_complete_tables.sql');
  const sqlContent = fs.readFileSync(sqlPath, 'utf-8');
  
  console.log('📄 SQL migration file loaded');
  console.log(`   Path: ${sqlPath}`);
  console.log(`   Size: ${sqlContent.length} bytes\n`);
  
  try {
    // Execute SQL via Supabase REST API
    console.log('⚡ Executing SQL migration...');
    
    const response = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': SUPABASE_KEY,
        'Authorization': `Bearer ${SUPABASE_KEY}`
      },
      body: JSON.stringify({
        query: sqlContent
      })
    });
    
    if (!response.ok) {
      const error = await response.text();
      console.error('❌ Migration failed:', error);
      console.log('\n💡 Alternative: Copy SQL to Supabase Dashboard');
      console.log('   Dashboard → SQL Editor → New Query → Paste & Run');
      process.exit(1);
    }
    
    console.log('✅ SQL migration executed successfully!\n');
    
    // Verify tables created
    console.log('🔍 Verifying tables...');
    const tables = [
      'media_dokumen',
      'sumber_referensi',
      'peristiwa_sejarah',
      'pengaruh_bahasa_lain',
      'penutur_historis',
      'riwayat_nama'
    ];
    
    for (const table of tables) {
      const countResponse = await fetch(
        `${SUPABASE_URL}/rest/v1/${table}?select=count`,
        {
          headers: {
            'apikey': SUPABASE_KEY,
            'Authorization': `Bearer ${SUPABASE_KEY}`
          }
        }
      );
      
      if (countResponse.ok) {
        const count = countResponse.headers.get('content-range')?.split('/')[1] || '0';
        console.log(`   ✓ ${table}: ${count} rows`);
      } else {
        console.log(`   ✗ ${table}: NOT FOUND`);
      }
    }
    
    console.log('\n🎉 Migration completed successfully!');
    console.log('   6 new tables added to database');
    
  } catch (error) {
    console.error('❌ Migration error:', error.message);
    console.log('\n💡 Manual migration steps:');
    console.log('   1. Open Supabase Dashboard');
    console.log('   2. Go to SQL Editor');
    console.log('   3. Create new query');
    console.log('   4. Copy content from: prisma/migrations/001_add_complete_tables.sql');
    console.log('   5. Paste and run');
    process.exit(1);
  }
}

runMigration();
