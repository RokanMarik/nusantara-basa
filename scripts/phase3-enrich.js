// Phase 3: Enrich data - Jina fetch + regex extraction
// Usage: node scripts/phase3-enrich.js [batch_size] [offset]

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20";
const JINA_API_KEY = "jina_0c540aa7efef42229075a6c58bd5bfbcAAKAJglySqUEUW1yoifWMPN1SN8Z";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);
const BATCH_SIZE = parseInt(process.argv[2]) || 50;
const OFFSET = parseInt(process.argv[3]) || 0;

async function jinaFetch(url) {
  try {
    const res = await fetch(`https://r.jina.ai/${url}`, {
      headers: { "Authorization": `Bearer ${JINA_API_KEY}`, "Accept": "text/plain" },
      signal: AbortSignal.timeout(30000),
    });
    if (!res.ok) return null;
    return await res.text();
  } catch { return null; }
}

function extractData(text) {
  const data = {};

  // Extract penutur: "X juta penutur" or "X ribu penutur"
  const penuturMatch = text.match(/(\d[\d\s.]*)\s*(juta|ribu|jtw|juta)\s*(?:penutur|orang|orang\s*yang\s*menggunakan|penutur\s*asli)/i);
  if (penuturMatch) {
    let num = parseFloat(penuturMatch[1].replace(/[\s.]/g, ''));
    const unit = penuturMatch[2].toLowerCase();
    if (unit.includes('juta')) num *= 1000000;
    else if (unit.includes('ribu')) num *= 1000;
    data.jumlah_penutur = Math.round(num);
  }

  // Extract vitalitas
  const vitalitasMatch = text.match(/(?:status\s*(?:vitalitas)?|vitalitas|keadaan|kategori)[^:]*:\s*(aman|rentan|terancam|sangat terancam|kritis|punah)/i);
  if (vitalitasMatch) {
    data.status_vitalitas = vitalitasMatch[1].toLowerCase();
  }

  // Extract provinsi: "dituturkan di X" or "berasal dari X"
  const provMatch = text.match(/dituturkan\s*(?:di|pada|terutama\s*di)\s*([A-Z][a-z\s]+?)(?:,|\s*dan|\s*yang|\s*\()/i);
  if (provMatch) {
    data.provinsi = provMatch[1].trim();
  }

  // Extract sistem tulisan
  const tulisanMatch = text.match(/(?:aksara|sistem\s*tulisan|huruf|tulisan)\s*[:\(]\s*([^,\)\n]+)/i);
  if (tulisanMatch) {
    data.sistem_tulisan = tulisanMatch[1].trim().substring(0, 60);
  }

  // Extract morfologi
  const morfologiMatch = text.match(/morfologi\s*[:\(]\s*(aglutinatif|isolatif|flektif|polisintetik)/i);
  if (morfologiMatch) {
    data.tipe_morfologi = morfologiMatch[1].toLowerCase();
  }

  // Extract urutan kata
  const kataMatch = text.match(/\b(SVO|SOV|VSO|VOS|OVS|OSV)\b/);
  if (kataMatch) {
    data.urutan_kata = kataMatch[1];
  }

  return data;
}

async function enrichLanguage(bahasa) {
  const name = bahasa.nama_bahasa.replace(/^Bahasa\s*/i, '');
  const iso = bahasa.kode_iso_639;

  // Try multiple sources in order
  const urls = [];

  // 1. Wikipedia ID
  urls.push(`https://id.wikipedia.org/wiki/Bahasa_${encodeURIComponent(name)}`);
  urls.push(`https://id.wikipedia.org/wiki/${encodeURIComponent(name)}`);

  // 2. Glottolog (comprehensive linguistic database)
  if (iso) {
    urls.push(`https://glottolog.org/resource/languoid/id/${iso.toLowerCase()}1234`);
    urls.push(`https://glottolog.org/resource/languoid/iso/${iso.toLowerCase()}`);
  }

  // 3. Wikipedia EN (more languages have English articles)
  urls.push(`https://en.wikipedia.org/wiki/${encodeURIComponent(name)}_language`);
  urls.push(`https://en.wikipedia.org/wiki/Languages_of_Indonesia`);

  // 4. Ethnologue (speaker data)
  if (iso) {
    urls.push(`https://www.ethnologue.com/language/${iso.toLowerCase()}`);
  }

  for (const url of urls) {
    const content = await jinaFetch(url);
    if (content && content.length > 200) {
      const extracted = extractData(content);
      if (Object.keys(extracted).length > 0) {
        return { ...extracted, source: url };
      }
    }
  }

  return null;
}

async function updateLanguage(bahasaId, data) {
  const updates = {};
  if (data.jumlah_penutur) updates.jumlah_penutur = data.jumlah_penutur;
  if (data.status_vitalitas) updates.status_vitalitas = data.status_vitalitas;

  if (Object.keys(updates).length > 0) {
    await supabase.from("bahasa").update(updates).eq("id", bahasaId);
  }

  if (data.provinsi) {
    // Check if lokasi already exists
    const { data: existing } = await supabase
      .from("lokasi").select("id").eq("bahasa_id", bahasaId).limit(1);
    if (!existing?.length) {
      await supabase.from("lokasi").insert({
        bahasa_id: bahasaId, provinsi: data.provinsi,
      });
    }
  }

  if (data.sistem_tulisan || data.tipe_morfologi || data.urutan_kata) {
    const { data: existing } = await supabase
      .from("fitur_linguistik").select("id").eq("bahasa_id", bahasaId).limit(1);
    if (!existing?.length) {
      await supabase.from("fitur_linguistik").insert({
        bahasa_id: bahasaId,
        sistem_tulisan: data.sistem_tulisan || null,
        tipe_morfologi: data.tipe_morfologi || null,
        urutan_kata: data.urutan_kata || null,
      });
    }
  }
}

async function main() {
  console.log("🔍 Phase 3: Enrich Data");
  console.log(`Batch size: ${BATCH_SIZE}, Offset: ${OFFSET}\n`);

  // Get languages without penutur
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
    console.log(`[${i + 1}/${languages.length}] ${b.nama_bahasa}`);

    try {
      const data = await enrichLanguage(b);
      if (data) {
        await updateLanguage(b.id, data);
        const fields = Object.keys(data).filter(k => k !== 'source');
        console.log(`   ✅ ${fields.join(', ')} (from ${data.source})`);
        success++;
      } else {
        console.log(`   ⏭️ No data found`);
        noData++;
      }
    } catch (err) {
      console.log(`   ❌ ${err.message}`);
      failed++;
    }

    await new Promise(r => setTimeout(r, 2000));
  }

  console.log(`\n📊 Batch complete: ${success} enriched, ${noData} no data, ${failed} failed.`);
  console.log(`Next batch: node scripts/phase3-enrich.js ${BATCH_SIZE} ${OFFSET + languages.length}`);
}

main();
