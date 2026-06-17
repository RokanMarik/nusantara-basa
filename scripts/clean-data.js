// Clean garbage data from database
// Usage: node scripts/clean-data.js

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// Patterns that indicate garbage entries
const GARBAGE_PATTERNS = [
  /^rumpun\b/i,           // "Rumpun bahasa..."
  /^di\s/i,               // "di Papua Nugini"
  /^bahasa\s+daerah/i,   // "Bahasa daerah..."
  /^daftar\b/i,           // "Daftar bahasa..."
  /^suku\b/i,             // "Suku Bali"
  /^kelompok\b/i,         // "Kelompok etnik..."
  /^wilayah\b/i,          // "Wilayah administratif..."
  /^dialek\b/i,           // "Dialek bahasa Sunda"
  /^surat\b/i,            // "Surat Lampung" (writing system)
  /filipina/i,            // Not Indonesian
  /nugini/i,              // Papua New Guinea
  /alkitab/i,             // Biblical
  /klasik$/i,             // "Sunda Klasik"
  /serang$/i,             // "Sunda Serang"
  /lumajang$/i,           // "Madura Lumajang"
  /situbondo$/i,          // "Madura Situbondo"
  /belitung$/i,           // "Melayu Belitung"
  /^belanda/i,            // "Belanda Indonesia" - not local language
  /^inggris$/i,           // "Inggris" - not Indonesian
  /^indonesia$/i,         // "Indonesia" - not a language name
  /^indonesia\s/i,        // "Indonesia gaul"
  /^jawa\s+timur$/i,      // Province, not language
  /^daerah$/i,            // Just "daerah"
  /^loncong$/i,           // Not a language
  /^newar$/i,             // Nepal language
  /^tsat$/i,              // Not Indonesian
  /^umbria$/i,            // Italy
  /^moronene$/i,          // Already covered by other sources
];

function isGarbage(name) {
  return GARBAGE_PATTERNS.some(p => p.test(name));
}

async function main() {
  console.log("🧹 Cleaning garbage data...\n");

  // Get all languages
  const { data: allBahasa, error } = await supabase
    .from("bahasa")
    .select("id, nama_bahasa");

  if (error) {
    console.error("Error:", error.message);
    process.exit(1);
  }

  console.log(`Total bahasa: ${allBahasa.length}`);

  // Find garbage
  const garbage = allBahasa.filter(b => isGarbage(b.nama_bahasa));
  const valid = allBahasa.filter(b => !isGarbage(b.nama_bahasa));

  console.log(`Valid: ${valid.length}`);
  console.log(`Garbage: ${garbage.length}\n`);

  if (garbage.length > 0) {
    console.log("Will delete:");
    garbage.forEach(g => console.log(`  - ${g.nama_bahasa}`));
    console.log();

    // Confirm
    console.log("Deleting garbage entries...");

    for (const g of garbage) {
      // Delete related data first (CASCADE should handle this, but be explicit)
      await supabase.from("lokasi").delete().eq("bahasa_id", g.id);
      await supabase.from("fitur_linguistik").delete().eq("bahasa_id", g.id);
      await supabase.from("kosakata").delete().eq("bahasa_id", g.id);
      await supabase.from("status_preservasi").delete().eq("bahasa_id", g.id);
      await supabase.from("manuskrip").delete().eq("bahasa_id", g.id);

      const { error: delError } = await supabase
        .from("bahasa")
        .delete()
        .eq("id", g.id);

      if (delError) {
        console.log(`  ❌ Failed: ${g.nama_bahasa} - ${delError.message}`);
      } else {
        console.log(`  ✅ Deleted: ${g.nama_bahasa}`);
      }
    }
  }

  // Summary
  const { count: finalCount } = await supabase
    .from("bahasa")
    .select("*", { count: "exact", head: true });

  console.log(`\n📊 Final count: ${finalCount} bahasa`);
}

main();
