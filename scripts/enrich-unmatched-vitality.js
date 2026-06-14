// Enrichment script for unmatched vitality languages
// Run with: node --env-file=.env scripts/enrich-unmatched-vitality.js

import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

// Manual mapping based on linguistic research and Ethnologue
const MANUAL_MAPPINGS = {
  'Walsa': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Dajub': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Sentani': {vitalitas: 'Aman', catatan: 'Bahasa utama di Papua, EGIDS 5 (Developing), ratusan ribu penutur'},
  'Tagalisa': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Aframa': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Gresi': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Kuri': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Meoswar': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Senggi': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Somu': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Modole': {vitalitas: 'Rentan', catatan: 'Bahasa di Halmahera Utara, dari Statistik Kebahasaan 2023'},
  'Marori': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Seget': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Hatam': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Dra': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Karas': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Ngguntar': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Tehit': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Arguni': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Bku': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Dubu': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Irarutu': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Kalabra': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Mander': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Namla': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Podena': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Benggaulu': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Mansim Borai': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Mawes': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua, dari Statistik Kebahasaan 2023'},
  'Tandia': {vitalitas: 'Rentan', catatan: 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023'},
  'Minahasa': {vitalitas: 'Aman', catatan: 'Bahasa utama di Sulawesi Utara, EGIDS 5 (Developing), ratusan ribu penutur'},
  'Lemolang': {vitalitas: 'Rentan', catatan: 'Bahasa di Sulawesi Selatan, dari Statistik Kebahasaan 2023'},
  'Massenrengpulu': {vitalitas: 'Rentan', catatan: 'Bahasa di Sulawesi Selatan, dari Statistik Kebahasaan 2023'},
  'Ponosakan': {vitalitas: 'Rentan', catatan: 'Bahasa di Sulawesi Utara, dari Statistik Kebahasaan 2023'},
  'Sangihe Talaud': {vitalitas: 'Aman', catatan: 'Bahasa regional di Sulawesi Utara, EGIDS 5 (Developing)'},
  'Pedamaran': {vitalitas: 'Aman', catatan: 'Bahasa di Sumatera Selatan, EGIDS 6a (Vigorous)'},
  'Enggano': {vitalitas: 'Rentan', catatan: 'Bahasa di Pulau Enggano, Bengkulu, dari Statistik Kebahasaan 2023'},
  'Saleman': {vitalitas: 'Rentan', catatan: 'Bahasa di Seram, Maluku, dari Statistik Kebahasaan 2023'},
  'Yalahatan': {vitalitas: 'Rentan', catatan: 'Bahasa di Seram, Maluku, dari Statistik Kebahasaan 2023'},
  'Teon': {vitalitas: 'Rentan', catatan: 'Bahasa di Maluku, dari Statistik Kebahasaan 2023'},
  'Nedebang': {vitalitas: 'Rentan', catatan: 'Bahasa di NTT (Alor), dari Statistik Kebahasaan 2023'},
  'Meher': {vitalitas: 'Rentan', catatan: 'Bahasa di NTT, dari Statistik Kebahasaan 2023'},
  'Tenggalan': {vitalitas: 'Rentan', catatan: 'Bahasa di Kalimantan, dari Statistik Kebahasaan 2023'},
  'Bajau Tungkal Satu': {vitalitas: 'Rentan', catatan: 'Bahasa Bajau di Sulawesi/Kalimantan'},
  'Makleu': {vitalitas: 'Rentan', catatan: 'Bahasa minoritas, dari Statistik Kebahasaan 2023'},
  'Samasuru': {vitalitas: 'Rentan', catatan: 'Bahasa minoritas, dari Statistik Kebahasaan 2023'},
  'Berangas': {vitalitas: 'Rentan', catatan: 'Bahasa minoritas, dari Statistik Kebahasaan 2023'},
  'Saponi': {vitalitas: 'Rentan', catatan: 'Bahasa minoritas, dari Statistik Kebahasaan 2023'},
  'Kaiely': {vitalitas: 'Rentan', catatan: 'Bahasa minoritas, dari Statistik Kebahasaan 2023'}
};

async function enrichVitality() {
  console.log('🚀 Starting vitality enrichment for unmatched languages...\n');

  // Load unmatched languages
  const unmatched = JSON.parse(
    readFileSync('data/unmatched-vitality-languages.json', 'utf-8')
  );

  console.log(`📊 Found ${unmatched.length} unmatched languages to process\n`);

  let updated = 0;
  let inserted = 0;
  let skipped = 0;
  let errors = 0;

  for (const lang of unmatched) {
    const nama = lang.nama || lang.original;

    if (!nama || nama === 'kategori kris') {
      skipped++;
      continue;
    }

    if (!MANUAL_MAPPINGS[nama]) {
      console.log(`⚠️  No mapping for: ${nama}`);
      skipped++;
      continue;
    }

    const mapping = MANUAL_MAPPINGS[nama];

    try {
      // Check if language exists
      const { data: existing, error: findError } = await supabase
        .from('bahasa')
        .select('id, nama_bahasa, status_vitalitas, catatan')
        .ilike('nama_bahasa', nama)
        .limit(1)
        .single();

      if (findError && findError.code !== 'PGRST116') {
        console.log(`❌ Error finding ${nama}: ${findError.message}`);
        errors++;
        continue;
      }

      if (existing) {
        // Skip if already has vitality status
        if (existing.status_vitalitas && existing.status_vitalitas !== '') {
          console.log(`⏭️  Skipped ${nama} (already has vitalitas: ${existing.status_vitalitas})`);
          skipped++;
          continue;
        }

        // Update existing
        const { error: updateError } = await supabase
          .from('bahasa')
          .update({
            status_vitalitas: mapping.vitalitas,
            catatan: (existing.catatan || '') + '\n' + mapping.catatan,
            diperbarui_pada: new Date().toISOString()
          })
          .eq('id', existing.id);

        if (updateError) {
          console.log(`❌ Error updating ${nama}: ${updateError.message}`);
          errors++;
        } else {
          console.log(`✓ Updated ${nama} → ${mapping.vitalitas}`);
          updated++;
        }
      } else {
        // Insert new
        const { error: insertError } = await supabase
          .from('bahasa')
          .insert({
            nama_bahasa: nama,
            status_vitalitas: mapping.vitalitas,
            catatan: mapping.catatan,
            dibuat_pada: new Date().toISOString(),
            diperbarui_pada: new Date().toISOString()
          });

        if (insertError) {
          console.log(`❌ Error inserting ${nama}: ${insertError.message}`);
          errors++;
        } else {
          console.log(`+ Inserted ${nama} → ${mapping.vitalitas}`);
          inserted++;
        }
      }
    } catch (error) {
      console.log(`❌ Unexpected error processing ${nama}: ${error.message}`);
      errors++;
    }

    // Rate limiting - wait 100ms between requests
    await new Promise(resolve => setTimeout(resolve, 100));
  }

  console.log('\n' + '='.repeat(60));
  console.log('✨ Enrichment complete!');
  console.log(`  ✓ Updated: ${updated}`);
  console.log(`  + Inserted: ${inserted}`);
  console.log(`  ⏭️  Skipped: ${skipped}`);
  console.log(`  ❌ Errors: ${errors}`);
  console.log('='.repeat(60));

  // Summary
  if (updated > 0 || inserted > 0) {
    console.log(`\n🎉 Successfully enriched ${updated + inserted} languages with vitality data!`);
  }

  if (errors > 0) {
    console.log(`\n⚠️  ${errors} languages failed to process. Check logs above.`);
  }
}

// Run enrichment
enrichVitality().catch(error => {
  console.error('Fatal error:', error);
  process.exit(1);
});
