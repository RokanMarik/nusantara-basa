// Phase 3b: Enrich with direct fetch (free, no Jina)
// Uses Wikipedia API (returns JSON directly)
// Usage: node scripts/phase3b-enrich-free.js [batch_size] [offset]

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);
const BATCH_SIZE = parseInt(process.argv[2]) || 50;
const OFFSET = parseInt(process.argv[3]) || 0;

// Wikipedia API - returns JSON directly, no Jina needed
async function wikiFetch(title, lang = 'id') {
  try {
    const url = `https://${lang}.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(title)}`;
    const res = await fetch(url, { signal: AbortSignal.timeout(10000) });
    if (!res.ok) return null;
    return await res.json();
  } catch { return null; }
}

async function wikiExtract(title, lang = 'id') {
  const data = await wikiFetch(title, lang);
  if (!data || !data.extract) return null;

  const text = data.extract;
  const extracted = {};

  // Extract penutur: "X juta" or "X ribu" or "X million"
  const penuturMatch = text.match(/(\d[\d\s.,]*)\s*(?:juta|ribu|million|thousand)\s*(?:penutur|speakers|orang)?/i);
  if (penuturMatch) {
    let num = parseFloat(penuturMatch[1].replace(/[\s.,]/g, ''));
    const unit = penuturMatch[2].toLowerCase();
    if (unit.includes('juta') || unit.includes('million')) num *= 1000000;
    else if (unit.includes('ribu') || unit.includes('thousand')) num *= 1000;
    extracted.jumlah_penutur = Math.round(num);
  }

  // Extract vitalitas
  const vitalitasMatch = text.match(/(?:status|vitalitas|vulnerable|endangered|safe)\s*(?::|is|:\s*)(aman|rentan|terancam|sangat terancam|kritis|punah|safe|vulnerable|endangered|critical|extinct)/i);
  if (vitalitasMatch) {
    const map = {
      'safe': 'aman', 'aman': 'aman',
      'vulnerable': 'rentan', 'rentan': 'rentan',
      'endangered': 'terancam', 'terancam': 'terancam',
      'severely endangered': 'sangat terancam', 'sangat terancam': 'sangat terancam',
      'critical': 'kritis', 'kritis': 'kritis',
      'extinct': 'punah', 'punah': 'punah',
    };
    const raw = vitalitasMatch[1].toLowerCase();
    extracted.status_vitalitas = map[raw] || map[raw.replace(/\s+/g, ' ')] || raw;
  }

  // Extract lokasi/provinsi
  const provMatch = text.match(/(?:spoken|dituturkan|used)\s*(?:in|di|pada)\s*([A-Z][a-z\s]+?)(?:,|\s*is|\s*where|\s*yang|\s*\.)/i);
  if (provMatch) {
    extracted.provinsi = provMatch[1].trim().substring(0, 100);
  }

  return Object.keys(extracted).length > 0 ? extracted : null;
}

async function updateLanguage(bahasaId, data) {
  const updates = {};
  if (data.jumlah_penutur) updates.jumlah_penutur = data.jumlah_penutur;
  if (data.status_vitalitas) updates.status_vitalitas = data.status_vitalitas;

  if (Object.keys(updates).length > 0) {
    await supabase.from("bahasa").update(updates).eq("id", bahasaId);
  }

  if (data.provinsi) {
    const { data: existing } = await supabase.from("lokasi").select("id").eq("bahasa_id", bahasaId).limit(1);
    if (!existing?.length) {
      await supabase.from("lokasi").insert({ bahasa_id: bahasaId, provinsi: data.provinsi });
    }
  }
}

async function main() {
  console.log("🔍 Phase 3b: Enrich (Free - Wikipedia API)");
  console.log(`Batch: ${BATCH_SIZE}, Offset: ${OFFSET}\n`);

  const { data: languages, error } = await supabase
    .from("bahasa")
    .select("id, nama_bahasa, kode_iso_639")
    .is("jumlah_penutur", null)
    .order("nama_bahasa")
    .range(OFFSET, OFFSET + BATCH_SIZE - 1);

  if (error || !languages?.length) {
    console.log(error ? `Error: ${error.message}` : "No languages to enrich!");
    return;
  }

  console.log(`Enriching ${languages.length} languages...\n`);

  let success = 0, noData = 0, failed = 0;

  for (let i = 0; i < languages.length; i++) {
    const b = languages[i];
    const name = b.nama_bahasa.replace(/^Bahasa\s*/i, '');
    console.log(`[${i + 1}/${languages.length}] ${b.nama_bahasa}`);

    try {
      // Try Wikipedia ID first, then EN
      let data = await wikiExtract(name, 'id');
      let source = 'wiki-id';

      if (!data) {
        data = await wikiExtract(name, 'en');
        source = 'wiki-en';
      }

      if (!data && b.kode_iso_639) {
        data = await wikiExtract(b.kode_iso_639, 'en');
        source = 'wiki-iso';
      }

      if (data) {
        await updateLanguage(b.id, data);
        const fields = Object.keys(data).filter(k => k !== 'source');
        console.log(`   ✅ ${fields.join(', ')} (${source})`);
        success++;
      } else {
        console.log(`   ⏭️ No data`);
        noData++;
      }
    } catch (err) {
      console.log(`   ❌ ${err.message}`);
      failed++;
    }

    await new Promise(r => setTimeout(r, 500));
  }

  console.log(`\n📊 Batch: ${success} enriched, ${noData} no data, ${failed} failed.`);
  console.log(`Next: node scripts/phase3b-enrich-free.js ${BATCH_SIZE} ${OFFSET + languages.length}`);
}

main();
