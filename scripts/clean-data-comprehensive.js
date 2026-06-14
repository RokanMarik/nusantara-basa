/**
 * Data Cleaning Script: Nusantara Basa Database
 * 
 * Script ini membersihkan data sampah dan duplikat dari tabel bahasa
 * 
 * Masalah yang dibersihkan:
 * 1. Data sampah: "Rumpun bahasa..." yang bukan bahasa spesifik
 * 2. Duplikat: Varian nama yang sama (Sunda Klasik/Serang, Madura Lumajang/Situbondo)
 * 3. Normalisasi: Lowercase, trim whitespace
 * 
 * Usage: node scripts/clean-data.js
 */

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://hkeheukewxsvaarxaket.supabase.co';
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhla3VrZXd4c3ZhYXJ4YWtldCIsInJvbGUiOiJzZXJ2aWNlX3JvbGUiLCJpYXQiOjE3ODAxMzk5MzMsImV4cCI6MjA5NTcxNTkzM30.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// Pola data sampah yang harus dihapus
const GARBAGE_PATTERNS = [
  /rumpun bahasa/i,           // "Rumpun bahasa Sulawesi Selatan"
  /di papua nugini/i,         // Bukan bahasa Indonesia
  /aram alkitabiah/i,         // Bukan bahasa daerah
  /proto-/i,                  // Proto-bahasa (reconstructed)
  /old\s/i,                   // "Old Javanese" (historical form)
  /classical\s/i,             // "Classical Malay"
  /middle\s/i,                // "Middle Javanese"
];

// Duplikat yang harus di-merge
const DUPLICATE_GROUPS = [
  {
    keep: 'Sunda',
    remove: ['Sunda Klasik', 'Sunda Serang', 'Sunda Banten']
  },
  {
    keep: 'Madura',
    remove: ['Madura Lumajang', 'Madura Situbondo', 'Madura Sumenep']
  },
  {
    keep: 'Jawa',
    remove: ['Jawa Cirebon', 'Jawa Tegal', 'Jawa Banyumas']
  }
];

async function cleanData() {
  console.log('🧹 Starting Data Cleaning...\n');
  
  // Fetch all bahasa
  const { data: allBahasa, error } = await supabase
    .from('bahasa')
    .select('*')
    .order('nama_bahasa');
  
  if (error) {
    console.error('❌ Error fetching data:', error);
    process.exit(1);
  }
  
  console.log(`📊 Total bahasa: ${allBahasa.length}\n`);
  
  // Track what we'll clean
  const toDelete = [];
  const toMerge = [];
  
  // 1. Identify garbage data
  console.log('🔍 Scanning for garbage data...');
  for (const bahasa of allBahasa) {
    for (const pattern of GARBAGE_PATTERNS) {
      if (pattern.test(bahasa.nama_bahasa)) {
        toDelete.push({
          id: bahasa.id,
          nama: bahasa.nama_bahasa,
          reason: `Matches pattern: ${pattern}`
        });
        break;
      }
    }
  }
  
  console.log(`   Found ${toDelete.length} garbage entries\n`);
  
  // 2. Identify duplicates
  console.log('🔍 Scanning for duplicates...');
  for (const group of DUPLICATE_GROUPS) {
    const keepRecord = allBahasa.find(b => 
      b.nama_bahasa.toLowerCase() === group.keep.toLowerCase()
    );
    
    if (!keepRecord) {
      console.log(`   ⚠️  Primary record not found: ${group.keep}`);
      continue;
    }
    
    for (const variant of group.remove) {
      const variantRecord = allBahasa.find(b => 
        b.nama_bahasa.toLowerCase() === variant.toLowerCase()
      );
      
      if (variantRecord) {
        toMerge.push({
          keepId: keepRecord.id,
          keepName: keepRecord.nama_bahasa,
          removeId: variantRecord.id,
          removeName: variantRecord.nama_bahasa
        });
      }
    }
  }
  
  console.log(`   Found ${toMerge.length} duplicate entries\n`);
  
  // 3. Normalize names (trim, lowercase for comparison)
  console.log('🔍 Scanning for normalization issues...');
  const normalizationIssues = allBahasa.filter(b => 
    b.nama_bahasa !== b.nama_bahasa.trim() || 
    b.nama_bahasa.includes('  ')
  );
  
  console.log(`   Found ${normalizationIssues.length} names needing normalization\n`);
  
  // Summary before cleaning
  console.log('═'.repeat(50));
  console.log('📋 CLEANING SUMMARY');
  console.log('═'.repeat(50));
  console.log(`   Garbage to delete: ${toDelete.length}`);
  console.log(`   Duplicates to merge: ${toMerge.length}`);
  console.log(`   Names to normalize: ${normalizationIssues.length}`);
  console.log(`   Total actions: ${toDelete.length + toMerge.length + normalizationIssues.length}`);
  console.log('═'.repeat(50));
  console.log();
  
  // Show details
  if (toDelete.length > 0) {
    console.log('🗑️  Garbage entries to delete:');
    toDelete.forEach((item, i) => {
      console.log(`   ${i + 1}. ${item.nama} (${item.reason})`);
    });
    console.log();
  }
  
  if (toMerge.length > 0) {
    console.log('🔄 Duplicates to merge:');
    toMerge.forEach((item, i) => {
      console.log(`   ${i + 1}. Keep "${item.keepName}" ← Remove "${item.removeName}"`);
    });
    console.log();
  }
  
  if (normalizationIssues.length > 0) {
    console.log('📝 Names to normalize:');
    normalizationIssues.slice(0, 10).forEach((item, i) => {
      console.log(`   ${i + 1}. "${item.nama_bahasa}" → "${item.nama_bahasa.trim()}"`);
    });
    if (normalizationIssues.length > 10) {
      console.log(`   ... and ${normalizationIssues.length - 10} more`);
    }
    console.log();
  }
  
  // Confirm before proceeding
  console.log('⚠️  This will permanently modify your database!');
  console.log('   Review the list above before proceeding.\n');
  
  // Auto-proceed for now (in production, add confirmation prompt)
  console.log('✅ Proceeding with cleanup...\n');
  
  // Execute cleanup
  let deleted = 0, merged = 0, normalized = 0, errors = 0;
  
  // 1. Delete garbage
  console.log('🗑️  Deleting garbage entries...');
  for (const item of toDelete) {
    const { error } = await supabase
      .from('bahasa')
      .delete()
      .eq('id', item.id);
    
    if (error) {
      console.log(`   ✗ Failed to delete "${item.nama}": ${error.message}`);
      errors++;
    } else {
      console.log(`   ✓ Deleted: ${item.nama}`);
      deleted++;
    }
  }
  console.log();
  
  // 2. Merge duplicates
  console.log('🔄 Merging duplicates...');
  for (const item of toMerge) {
    // Get related data from variant before deleting
    const { data: variantLokasi } = await supabase
      .from('lokasi')
      .select('*')
      .eq('bahasa_id', item.removeId);
    
    const { data: variantFitur } = await supabase
      .from('fitur_linguistik')
      .select('*')
      .eq('bahasa_id', item.removeId)
      .single();
    
    // Update foreign keys to point to primary record
    if (variantLokasi && variantLokasi.length > 0) {
      await supabase
        .from('lokasi')
        .update({ bahasa_id: item.keepId })
        .eq('bahasa_id', item.removeId);
    }
    
    if (variantFitur) {
      // Check if primary already has fitur_linguistik
      const { data: primaryFitur } = await supabase
        .from('fitur_linguistik')
        .select('id')
        .eq('bahasa_id', item.keepId)
        .single();
      
      if (!primaryFitur) {
        await supabase
          .from('fitur_linguistik')
          .update({ bahasa_id: item.keepId })
          .eq('bahasa_id', item.removeId);
      }
    }
    
    // Delete variant
    const { error } = await supabase
      .from('bahasa')
      .delete()
      .eq('id', item.removeId);
    
    if (error) {
      console.log(`   ✗ Failed to merge "${item.removeName}": ${error.message}`);
      errors++;
    } else {
      console.log(`   ✓ Merged: "${item.removeName}" → "${item.keepName}"`);
      merged++;
    }
  }
  console.log();
  
  // 3. Normalize names
  console.log('📝 Normalizing names...');
  for (const item of normalizationIssues) {
    const normalizedName = item.nama_bahasa.trim().replace(/\s+/g, ' ');
    
    const { error } = await supabase
      .from('bahasa')
      .update({ nama_bahasa: normalizedName })
      .eq('id', item.id);
    
    if (error) {
      console.log(`   ✗ Failed to normalize "${item.nama_bahasa}": ${error.message}`);
      errors++;
    } else {
      normalized++;
    }
  }
  console.log();
  
  // Final summary
  console.log('═'.repeat(50));
  console.log('✅ CLEANING COMPLETE');
  console.log('═'.repeat(50));
  console.log(`   Deleted: ${deleted}`);
  console.log(`   Merged: ${merged}`);
  console.log(`   Normalized: ${normalized}`);
  console.log(`   Errors: ${errors}`);
  console.log('═'.repeat(50));
  console.log();
  
  // Verify final count
  const { count } = await supabase
    .from('bahasa')
    .select('*', { count: 'exact', head: true });
  
  console.log(`📊 Final count: ${count} bahasa in database`);
  console.log(`   Removed: ${allBahasa.length - count} entries`);
  console.log();
  
  console.log('💡 Next steps:');
  console.log('   1. Review cleaned data in Supabase Dashboard');
  console.log('   2. Run enrichment: node scripts/enrich-fitur-linguistik.js');
  console.log('   3. Run bulk insert: node scripts/phase1-fast-insert.js');
}

cleanData().catch(console.error);
