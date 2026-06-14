/**
 * Historical Module Seed Script: Nusantara Basa Database
 * 
 * Menambahkan data historis untuk bahasa-bahasa utama:
 * 1. Peristiwa sejarah (kolonisasi, migrasi, islamisasi)
 * 2. Pengaruh bahasa lain (Sansekerta, Arab, Belanda, Inggris)
 * 3. Penutur historis (data sensus dari tahun-tahun lama)
 * 4. Riwayat nama (perubahan nama bahasa sepanjang sejarah)
 * 
 * Usage: node scripts/seed-historical.js
 */

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://hkeheukewxsvaarxaket.supabase.co';
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhla3VrZXd4c3ZhYXJ4YWtldCIsInJvbGUiOiJzZXJ2aWNlX3JvbGUiLCJpYXQiOjE3ODAxMzk5MzMsImV4cCI6MjA5NTcxNTkzM30.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20';

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// Sample historical data untuk bahasa-bahasa utama
const HISTORICAL_DATA = {
  'Jawa': {
    peristiwaSejarah: [
      {
        tahunMulai: 800,
        tahunSelesai: 1500,
        jenisPeristiwa: 'Perkembangan kerajaan Hindu-Buddha',
        eraHistoris: 'Hindu-Buddha',
        dampakPadaBahasa: 'Masuknya kosakata Sansekerta, perkembangan aksara Kawi',
        wilayahTerdampak: 'Jawa Tengah, Jawa Timur',
        sumberSejarah: 'Prasasti, naskah kuno'
      },
      {
        tahunMulai: 1400,
        tahunSelesai: 1600,
        jenisPeristiwa: 'Islamisasi Jawa',
        eraHistoris: 'Islam',
        dampakPadaBahasa: 'Masuknya kosakata Arab, pengaruh Persia',
        wilayahTerdampak: 'Pesisir utara Jawa',
        sumberSejarah: 'Babad, hikayat'
      },
      {
        tahunMulai: 1600,
        tahunSelesai: 1945,
        jenisPeristiwa: 'Kolonisasi Belanda',
        eraHistoris: 'Kolonial',
        dampakPadaBahasa: 'Masuknya kosakata Belanda, pengaruh struktur kalimat',
        wilayahTerdampak: 'Seluruh Jawa',
        sumberSejarah: 'Dokumen kolonial'
      }
    ],
    pengaruhBahasaLain: [
      {
        bahasaAsal: 'Sansekerta',
        periodePengaruh: '800-1500 M',
        jenisPengaruh: 'kosakata, aksara',
        contohKosakata: JSON.stringify([
          { kata: 'raja', arti: 'king', periode: 800 },
          { kata: 'negara', arti: 'country', periode: 900 },
          { kata: 'bahasa', arti: 'language', periode: 800 }
        ]),
        estimasiSerapan: 25,
        jalurMasuk: 'Agama Hindu-Buddha'
      },
      {
        bahasaAsal: 'Arab',
        periodePengaruh: '1400-sekarang',
        jenisPengaruh: 'kosakata',
        contohKosakata: JSON.stringify([
          { kata: 'kitab', arti: 'book', periode: 1400 },
          { kata: 'masjid', arti: 'mosque', periode: 1400 },
          { kata: 'waktu', arti: 'time', periode: 1500 }
        ]),
        estimasiSerapan: 10,
        jalurMasuk: 'Agama Islam'
      },
      {
        bahasaAsal: 'Belanda',
        periodePengaruh: '1600-1945',
        jenisPengaruh: 'kosakata, tata bahasa',
        contohKosakata: JSON.stringify([
          { kata: 'kantor', arti: 'office', periode: 1700 },
          { kata: 'sekolah', arti: 'school', periode: 1800 },
          { kata: 'mobil', arti: 'car', periode: 1900 }
        ]),
        estimasiSerapan: 15,
        jalurMasuk: 'Kolonisasi'
      }
    ],
    penuturHistoris: [
      { tahunSensus: 1930, jumlahPenutur: 25000000, metodePencacahan: 'Sensus Belanda', sumberData: 'Volkstelling 1930' },
      { tahunSensus: 1961, jumlahPenutur: 45000000, metodePencacahan: 'Sensus nasional', sumberData: 'BPS 1961' },
      { tahunSensus: 1980, jumlahPenutur: 65000000, metodePencacahan: 'Sensus nasional', sumberData: 'BPS 1980' },
      { tahunSensus: 2000, jumlahPenutur: 80000000, metodePencacahan: 'Sensus nasional', sumberData: 'BPS 2000' },
      { tahunSensus: 2020, jumlahPenutur: 98000000, metodePencacahan: 'Sensus nasional', sumberData: 'BPS 2020' }
    ],
    riwayatNama: [
      {
        namaLama: 'Basa Jawi',
        periodeDigunakan: '800-1945',
        digunakanOleh: 'Masyarakat Jawa',
        aksaraAsli: 'Hanacaraka, Kawi',
        alasanPerubahan: 'Standardisasi bahasa nasional'
      },
      {
        namaLama: 'Javanese',
        periodeDigunakan: '1800-1945',
        digunakanOleh: 'Pemerintah kolonial Belanda',
        aksaraAsli: 'Latin',
        alasanPerubahan: 'Dokumentasi kolonial'
      }
    ]
  },
  
  'Sunda': {
    peristiwaSejarah: [
      {
        tahunMulai: 700,
        tahunSelesai: 1500,
        jenisPeristiwa: 'Kerajaan Sunda',
        eraHistoris: 'Hindu-Buddha',
        dampakPadaBahasa: 'Perkembangan aksara Sunda kuno',
        wilayahTerdampak: 'Jawa Barat',
        sumberSejarah: 'Prasasti Kawali'
      },
      {
        tahunMulai: 1500,
        tahunSelesai: 1600,
        jenisPeristiwa: 'Islamisasi',
        eraHistoris: 'Islam',
        dampakPadaBahasa: 'Pengaruh Arab dan Melayu',
        wilayahTerdampak: 'Jawa Barat',
        sumberSejarah: 'Naskah kuno'
      }
    ],
    pengaruhBahasaLain: [
      {
        bahasaAsal: 'Sansekerta',
        periodePengaruh: '700-1500 M',
        jenisPengaruh: 'kosakata',
        contohKosakata: JSON.stringify([
          { kata: 'guru', arti: 'teacher', periode: 800 },
          { kata: 'dewa', arti: 'god', periode: 700 }
        ]),
        estimasiSerapan: 20,
        jalurMasuk: 'Agama Hindu'
      }
    ],
    penuturHistoris: [
      { tahunSensus: 1930, jumlahPenutur: 8000000, metodePencacahan: 'Sensus Belanda', sumberData: 'Volkstelling 1930' },
      { tahunSensus: 2020, jumlahPenutur: 42000000, metodePencacahan: 'Sensus nasional', sumberData: 'BPS 2020' }
    ],
    riwayatNama: [
      {
        namaLama: 'Basa Sunda',
        periodeDigunakan: '700-sekarang',
        digunakanOleh: 'Masyarakat Sunda',
        aksaraAsli: 'Sunda kuno, Latin',
        alasanPerubahan: null
      }
    ]
  },
  
  'Melayu': {
    peristiwaSejarah: [
      {
        tahunMulai: 700,
        tahunSelesai: 1400,
        jenisPeristiwa: 'Kerajaan Sriwijaya',
        eraHistoris: 'Hindu-Buddha',
        dampakPadaBahasa: 'Melayu sebagai lingua franca',
        wilayahTerdampak: 'Sumatera, Semenanjung Malaya',
        sumberSejarah: 'Prasasti Kedukan Bukit'
      },
      {
        tahunMulai: 1400,
        tahunSelesai: 1900,
        jenisPeristiwa: 'Perdagangan internasional',
        eraHistoris: 'Islam',
        dampakPadaBahasa: 'Pengaruh Arab, Persia, India',
        wilayahTerdampak: 'Selat Malaka',
        sumberSejarah: 'Catatan pedagang'
      },
      {
        tahunMulai: 1928,
        tahunSelesai: 1945,
        jenisPeristiwa: 'Sumpah Pemuda',
        eraHistoris: 'Modern',
        dampakPadaBahasa: 'Melayu menjadi Bahasa Indonesia',
        wilayahTerdampak: 'Seluruh Indonesia',
        sumberSejarah: 'Dokumen sejarah'
      }
    ],
    pengaruhBahasaLain: [
      {
        bahasaAsal: 'Sansekerta',
        periodePengaruh: '700-1400 M',
        jenisPengaruh: 'kosakata',
        contohKosakata: JSON.stringify([
          { kata: 'raja', arti: 'king', periode: 700 },
          { kata: 'negara', arti: 'state', periode: 800 }
        ]),
        estimasiSerapan: 30,
        jalurMasuk: 'Agama Hindu-Buddha'
      },
      {
        bahasaAsal: 'Arab',
        periodePengaruh: '1400-sekarang',
        jenisPengaruh: 'kosakata',
        contohKosakata: JSON.stringify([
          { kata: 'kabar', arti: 'news', periode: 1400 },
          { kata: 'selamat', arti: 'safe', periode: 1400 }
        ]),
        estimasiSerapan: 25,
        jalurMasuk: 'Agama Islam'
      }
    ],
    penuturHistoris: [
      { tahunSensus: 1930, jumlahPenutur: 10000000, metodePencacahan: 'Sensus Belanda', sumberData: 'Volkstelling 1930' },
      { tahunSensus: 2020, jumlahPenutur: 77000000, metodePencacahan: 'Sensus nasional', sumberData: 'BPS 2020' }
    ],
    riwayatNama: [
      {
        namaLama: 'Bahasa Melayu Pasar',
        periodeDigunakan: '1400-1928',
        digunakanOleh: 'Pedagang',
        aksaraAsli: 'Jawi',
        alasanPerubahan: 'Standardisasi untuk bahasa nasional'
      },
      {
        namaLama: 'Bahasa Indonesia',
        periodeDigunakan: '1928-sekarang',
        digunakanOleh: 'Seluruh Indonesia',
        aksaraAsli: 'Latin',
        alasanPerubahan: 'Sumpah Pemuda 1928'
      }
    ]
  }
};

async function seedHistorical() {
  console.log('📚 Starting Historical Module Seed...\n');
  
  let totalPeristiwa = 0, totalPengaruh = 0, totalPenutur = 0, totalRiwayat = 0;
  let errors = 0;
  
  for (const [namaBahasa, data] of Object.entries(HISTORICAL_DATA)) {
    console.log(`🔍 Processing: ${namaBahasa}`);
    
    // Get bahasa ID
    const { data: bahasa, error: fetchError } = await supabase
      .from('bahasa')
      .select('id')
      .eq('nama_bahasa', namaBahasa)
      .single();
    
    if (fetchError || !bahasa) {
      console.log(`   ⚠️  Language not found: ${namaBahasa}\n`);
      continue;
    }
    
    const bahasaId = bahasa.id;
    
    // 1. Insert peristiwa sejarah
    if (data.peristiwaSejarah) {
      console.log(`   📜 Adding ${data.peristiwaSejarah.length} historical events...`);
      for (const peristiwa of data.peristiwaSejarah) {
        const { error } = await supabase
          .from('peristiwa_sejarah')
          .insert({
            bahasa_id: bahasaId,
            ...peristiwa
          });
        
        if (error) {
          console.log(`      ✗ Failed: ${peristiwa.jenisPeristiwa}`);
          errors++;
        } else {
          totalPeristiwa++;
        }
      }
    }
    
    // 2. Insert pengaruh bahasa lain
    if (data.pengaruhBahasaLain) {
      console.log(`   🌐 Adding ${data.pengaruhBahasaLain.length} language influences...`);
      for (const pengaruh of data.pengaruhBahasaLain) {
        const { error } = await supabase
          .from('pengaruh_bahasa_lain')
          .insert({
            bahasa_id: bahasaId,
            ...pengaruh
          });
        
        if (error) {
          console.log(`      ✗ Failed: ${pengaruh.bahasaAsal}`);
          errors++;
        } else {
          totalPengaruh++;
        }
      }
    }
    
    // 3. Insert penutur historis
    if (data.penuturHistoris) {
      console.log(`   👥 Adding ${data.penuturHistoris.length} historical speaker data...`);
      for (const penutur of data.penuturHistoris) {
        const { error } = await supabase
          .from('penutur_historis')
          .insert({
            bahasa_id: bahasaId,
            ...penutur
          });
        
        if (error) {
          console.log(`      ✗ Failed: ${penutur.tahunSensus}`);
          errors++;
        } else {
          totalPenutur++;
        }
      }
    }
    
    // 4. Insert riwayat nama
    if (data.riwayatNama) {
      console.log(`   📝 Adding ${data.riwayatNama.length} name history records...`);
      for (const riwayat of data.riwayatNama) {
        const { error } = await supabase
          .from('riwayat_nama')
          .insert({
            bahasa_id: bahasaId,
            ...riwayat
          });
        
        if (error) {
          console.log(`      ✗ Failed: ${riwayat.namaLama}`);
          errors++;
        } else {
          totalRiwayat++;
        }
      }
    }
    
    console.log(`   ✓ Completed\n`);
  }
  
  // Final summary
  console.log('═'.repeat(50));
  console.log('✅ HISTORICAL SEED COMPLETE');
  console.log('═'.repeat(50));
  console.log(`   Historical events: ${totalPeristiwa}`);
  console.log(`   Language influences: ${totalPengaruh}`);
  console.log(`   Historical speakers: ${totalPenutur}`);
  console.log(`   Name history: ${totalRiwayat}`);
  console.log(`   Errors: ${errors}`);
  console.log('═'.repeat(50));
  console.log();
  
  console.log('💡 Historical data added for:');
  Object.keys(HISTORICAL_DATA).forEach(name => console.log(`   • ${name}`));
  console.log();
  console.log('Next: Review data in Supabase Dashboard');
}

seedHistorical().catch(console.error);
