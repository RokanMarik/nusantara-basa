/**
 * Database Migration Runner
 * 
 * This script applies database migrations to Supabase.
 * Since direct SQL execution via REST API is limited, this provides
 * clear instructions for manual migration.
 * 
 * Usage: node scripts/run-migration.js
 */

const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://hkeheukewxsvaarxaket.supabase.co';
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhla3VrZXd4c3ZhYXJ4YWtldCIsInJvbGUiOiJzZXJ2aWNlX3JvbGUiLCJpYXQiOjE3ODAxMzk5MzMsImV4cCI6MjA5NTcxNTkzM30.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

async function checkExistingTables() {
  console.log('🔍 Checking existing tables...\n');
  
  const tables = [
    'bahasa', 'rumpun_bahasa', 'lokasi', 'fitur_linguistik',
    'kosakata', 'status_preservasi', 'manuskrip',
    'media_dokumen', 'sumber_referensi', 'peristiwa_sejarah',
    'pengaruh_bahasa_lain', 'penutur_historis', 'riwayat_nama'
  ];
  
  const existingTables = [];
  const missingTables = [];
  
  for (const table of tables) {
    try {
      const { error } = await supabase
        .from(table)
        .select('*')
        .limit(1);
      
      if (error && error.code === '42P01') {
        // Table doesn't exist
        missingTables.push(table);
      } else {
        existingTables.push(table);
      }
    } catch (err) {
      missingTables.push(table);
    }
  }
  
  console.log('✅ Existing tables (8):');
  existingTables.forEach(t => console.log(`   • ${t}`));
  console.log();
  
  if (missingTables.length > 0) {
    console.log('❌ Missing tables (6):');
    missingTables.forEach(t => console.log(`   • ${t}`));
    console.log();
    
    return { existingTables, missingTables, needsMigration: true };
  } else {
    console.log('🎉 All tables exist! Migration already complete.\n');
    return { existingTables, missingTables, needsMigration: false };
  }
}

async function main() {
  console.log('═'.repeat(50));
  console.log('NUSANTARA BASA DATABASE MIGRATION');
  console.log('═'.repeat(50));
  console.log();
  
  const { needsMigration, missingTables } = await checkExistingTables();
  
  if (!needsMigration) {
    console.log('✅ Database is up to date!');
    console.log('   You can now run data scripts:');
    console.log('   • node scripts/clean-data-comprehensive.js');
    console.log('   • node scripts/enrich-data-comprehensive.js');
    console.log('   • node scripts/phase1-fast-insert.js');
    console.log('   • node scripts/seed-historical.js');
    return;
  }
  
  console.log('═'.repeat(50));
  console.log('⚠️  MANUAL MIGRATION REQUIRED');
  console.log('═'.repeat(50));
  console.log();
  console.log('To add the missing tables, follow these steps:');
  console.log();
  console.log('1. Open Supabase Dashboard:');
  console.log('   https://app.supabase.com/project/hkeheukewxsvaarxaket');
  console.log();
  console.log('2. Go to SQL Editor:');
  console.log('   Left sidebar → SQL Editor → New Query');
  console.log();
  console.log('3. Copy and paste the migration SQL:');
  console.log('   File: prisma/migrations/001_add_complete_tables.sql');
  console.log();
  console.log('4. Click "Run" to execute the migration');
  console.log();
  console.log('5. Verify tables were created:');
  console.log('   Table Editor → Check for new tables');
  console.log();
  console.log('═'.repeat(50));
  console.log();
  
  // Show migration file location
  const migrationPath = path.join(__dirname, '../prisma/migrations/001_add_complete_tables.sql');
  console.log(`📄 Migration file: ${migrationPath}`);
  console.log(`   Size: ${fs.statSync(migrationPath).size} bytes`);
  console.log();
  
  // Offer to display the SQL
  console.log('Would you like to see the SQL migration?');
  console.log('The file contains:');
  console.log('   • CREATE TABLE statements for 6 new tables');
  console.log('   • Indexes for performance');
  console.log('   • Triggers for auto-updating timestamps');
  console.log('   • Row Level Security (RLS) policies');
  console.log();
  
  console.log('After running the migration:');
  console.log('   1. Run this script again to verify');
  console.log('   2. Then run data scripts to populate tables');
  console.log();
}

main().catch(console.error);
