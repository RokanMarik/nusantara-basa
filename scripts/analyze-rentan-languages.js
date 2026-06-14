// Load environment variables manually
const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');
const envPath = path.join(__dirname, '..', '.env');
const envContent = fs.readFileSync(envPath, 'utf-8');
envContent.split('\n').forEach(line => {
  if (line.startsWith('#') || !line.trim()) return;
  const [key, ...valueParts] = line.split('=');
  if (key && valueParts.length > 0) {
    process.env[key.trim()] = valueParts.join('=').trim();
  }
});

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

async function analyzeRentanLanguages() {
  console.log('🔍 Menganalisis bahasa dengan status "Rentan"...\n');

  // Ambil semua bahasa dengan status Rentan
  const { data: rentanLanguages, error } = await supabase
    .from('bahasa')
    .select('id, nama_bahasa, status_vitalitas, jumlah_penutur, wilayah')
    .eq('status_vitalitas', 'Rentan')
    .order('jumlah_penutur', { ascending: false });

  if (error) {
    console.error('❌ Error:', error);
    return;
  }

  console.log(`📊 Total bahasa dengan status "Rentan": ${rentanLanguages.length}\n`);

  // Klasifikasikan berdasarkan jumlah penutur
  const categories = {
    shouldAman: [], // > 1 juta penutur
    maybeAman: [],  // 500k - 1 juta penutur
    stayRentan: [], // < 500k penutur atau tidak ada data
    noData: []      // tidak ada jumlah_penutur
  };

  rentanLanguages.forEach(lang => {
    const speakers = lang.jumlah_penutur;
    
    if (!speakers || speakers === 0) {
      categories.noData.push(lang);
    } else if (speakers >= 1000000) {
      categories.shouldAman.push({ ...lang, speakers });
    } else if (speakers >= 500000) {
      categories.maybeAman.push({ ...lang, speakers });
    } else {
      categories.stayRentan.push({ ...lang, speakers });
    }
  });

  console.log('═══ HASIL ANALISIS ═══\n');

  console.log('✅ SEHARUSNYA "AMAN" (> 1 juta penutur):');
  console.log(`   Total: ${categories.shouldAman.length} bahasa\n`);
  categories.shouldAman.forEach(lang => {
    console.log(`   - ${lang.nama_bahasa}: ${lang.speakers.toLocaleString()} penutur`);
  });

  console.log('\n⚠️  MUNGKIN "AMAN" (500k - 1 juta penutur):');
  console.log(`   Total: ${categories.maybeAman.length} bahasa\n`);
  categories.maybeAman.forEach(lang => {
    console.log(`   - ${lang.nama_bahasa}: ${lang.speakers.toLocaleString()} penutur`);
  });

  console.log('\n📉 TETAP "RENTAN" (< 500k penutur):');
  console.log(`   Total: ${categories.stayRentan.length} bahasa\n`);
  categories.stayRentan.slice(0, 10).forEach(lang => {
    console.log(`   - ${lang.nama_bahasa}: ${lang.speakers.toLocaleString()} penutur`);
  });
  if (categories.stayRentan.length > 10) {
    console.log(`   ... dan ${categories.stayRentan.length - 10} bahasa lainnya`);
  }

  console.log('\n❓ TIDAK ADA DATA PENUTUR:');
  console.log(`   Total: ${categories.noData.length} bahasa\n`);
  categories.noData.slice(0, 10).forEach(lang => {
    console.log(`   - ${lang.nama_bahasa}`);
  });
  if (categories.noData.length > 10) {
    console.log(`   ... dan ${categories.noData.length - 10} bahasa lainnya`);
  }

  // Generate SQL untuk update
  console.log('\n═══ SQL UPDATE STATEMENTS ═══\n');
  
  if (categories.shouldAman.length > 0) {
    console.log('-- Update ke "Aman" (> 1 juta penutur):');
    categories.shouldAman.forEach(lang => {
      console.log(`UPDATE bahasa SET status_vitalitas = 'Aman' WHERE id = '${lang.id}';`);
    });
  }

  if (categories.maybeAman.length > 0) {
    console.log('\n-- Update ke "Aman" (500k - 1 juta penutur):');
    categories.maybeAman.forEach(lang => {
      console.log(`UPDATE bahasa SET status_vitalitas = 'Aman' WHERE id = '${lang.id}';`);
    });
  }

  // Return summary
  return {
    total: rentanLanguages.length,
    shouldAman: categories.shouldAman.length,
    maybeAman: categories.maybeAman.length,
    stayRentan: categories.stayRentan.length,
    noData: categories.noData.length
  };
}

analyzeRentanLanguages()
  .then(summary => {
    if (summary) {
      console.log('\n═══ RINGKASAN ═══');
      console.log(`Total bahasa "Rentan": ${summary.total}`);
      console.log(`Seharusnya "Aman": ${summary.shouldAman}`);
      console.log(`Mungkin "Aman": ${summary.maybeAman}`);
      console.log(`Tetap "Rentan": ${summary.stayRentan}`);
      console.log(`Tidak ada data: ${summary.noData}`);
    }
  })
  .catch(console.error);
