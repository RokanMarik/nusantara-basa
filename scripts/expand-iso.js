// Phase 3b: Expand from ISO 639-3 registry
// Source: SIL ISO 639-3 code table (700+ Indonesian languages)
// Usage: node scripts/expand-iso.js [limit]

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = "https://hkeheukewxsvaarxaket.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20";
const JINA_API_KEY = "jina_0c540aa7efef42229075a6c58bd5bfbcAAKAJglySqUEUW1yoifWMPN1SN8Z";
const NINEROUTER_URL = "http://localhost:20128";
const NINEROUTER_KEY = "sk-2ce0b3116b58ede3-4v2kkj-033fc842";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);
const LIMIT = parseInt(process.argv[2]) || 50;

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

async function qdExtract(content, prompt) {
  try {
    const res = await fetch(`${NINEROUTER_URL}/v1/chat/completions`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "Authorization": `Bearer ${NINEROUTER_KEY}` },
      body: JSON.stringify({
        model: "qd/kmodel",
        messages: [
          { role: "system", content: "Return ONLY valid JSON, no explanation." },
          { role: "user", content: `${prompt}\n\nText:\n${content.substring(0, 4000)}` }
        ],
        temperature: 0.1,
        max_tokens: 500,
        stream: false,
      }),
      signal: AbortSignal.timeout(60000),
    });
    if (!res.ok) return null;
    const data = await res.json();
    const content_ = data.choices?.[0]?.message?.content || "";
    const jsonMatch = content_.match(/\{[\s\S]*?\}/);
    if (!jsonMatch) return null;
    return JSON.parse(jsonMatch[0]);
  } catch { return null; }
}

async function getIsoLanguages() {
  console.log("\n1. Fetching ISO 639-3 registry...\n");

  // Fetch the ISO 639-3 code table for Indonesian languages
  const content = await jinaFetch("https://iso639-3.sil.org/code_tables/639/data/a/639/data");
  if (content) {
    const extracted = await qdExtract(content,
      "Extract ALL languages where the country/region includes Indonesia. Return JSON array: [{nama: string, iso: string, province: string|null}]. Include every Indonesian language."
    );
    if (extracted && Array.isArray(extracted) && extracted.length > 50) {
      console.log(`   Extracted ${extracted.length} languages from ISO registry`);
      return extracted;
    }
  }

  // Fallback: known list of Indonesian language ISO codes
  console.log("   Using fallback language list...");
  return [
    { nama: "Aceh", iso: "ace" }, { nama: "Alor", iso: "aol" },
    { nama: "Amarasi", iso: "aaz" }, { nama: "Ambelau", iso: "aml" },
    { nama: "Ambon", iso: "abs" }, { nama: "Ampanang", iso: "bfg" },
    { nama: "Bali", iso: "ban" }, { nama: "Bamayo", iso: "bmq" },
    { nama: "Banda", iso: "bnd" }, { nama: "Banggai", iso: "bgz" },
    { nama: "Banjar", iso: "bjn" }, { nama: "Batak Angkola", iso: "akb" },
    { nama: "Batak Dairi", iso: "btd" }, { nama: "Batak Karo", iso: "btx" },
    { nama: "Batak Mandailing", iso: "btm" }, { nama: "Batak Pakpak", iso: "bpx" },
    { nama: "Batak Simalungun", iso: "bts" }, { nama: "Batak Toba", iso: "bbc" },
    { nama: "Bentong", iso: "bnu" }, { nama: "Berawan", iso: "bwu" },
    { nama: "Bima", iso: "bhp" }, { nama: "Bonerate", iso: "bnr" },
    { nama: "Bugis", iso: "bug" }, { nama: "Bungku", iso: "bkz" },
    { nama: "Ciacia", iso: "cia" }, { nama: "Dani", iso: "dna" },
    { nama: "Dayak Bakati", iso: "sne" }, { nama: "Dayak Iban", iso: "ibl" },
    { nama: "Dayak Kenyah", iso: "xkl" }, { nama: "Dayak Ngaju", iso: "nij" },
    { nama: "Donggo", iso: "doo" }, { nama: "Duri", iso: "mvp" },
    { nama: "Embaloh", iso: "ebu" }, { nama: "Ende", iso: "end" },
    { nama: "Flores", iso: "kna" }, { nama: "Gayo", iso: "gay" },
    { nama: "Gorontalo", iso: "gor" }, { nama: "Habu", iso: "hbu" },
    { nama: "Hulontalo", iso: "gor" }, { nama: "Iban", iso: "iba" },
    { nama: "Kadai", iso: "aqt" }, { nama: "Kaili", iso: "lew" },
    { nama: "Kamang", iso: "woy" }, { nama: "Kambera", iso: "xbr" },
    { nama: "Kamberau", iso: "bim" }, { nama: "Kendayan", iso: "knx" },
    { nama: "Kerinci", iso: "kvr" }, { nama: "Komodo", iso: "xkl" },
    { nama: "Konjo", iso: "kjc" }, { nama: "Kulon Progo", iso: "jav" },
    { nama: "Kutai", iso: "vkt" }, { nama: "Lampung", iso: "ljp" },
    { nama: "Lao", iso: "lao" }, { nama: "Ledo Kaili", iso: "lew" },
    { nama: "Leti", iso: "lti" }, { nama: "Loloda", iso: "lll" },
    { nama: "Mandar", iso: "mdr" }, { nama: "Mandobo", iso: "bup" },
    { nama: "Manggarai", iso: "mql" }, { nama: "Maniq", iso: "mnq" },
    { nama: "Mansim", iso: "syw" }, { nama: "Mansim Matbat", iso: "slw" },
    { nama: "Marind", iso: "mqy" }, { nama: "Melayu", iso: "msa" },
    { nama: "Minaanga", iso: "vkm" }, { nama: "Minangkabau", iso: "min" },
    { nama: "Mori Bawah", iso: "xmz" }, { nama: "Mori Atas", iso: "xmz" },
    { nama: "Muna", iso: "mnb" }, { nama: "Muna Buton", iso: "bku" },
    { nama: "Nias", iso: "nia" }, { nama: "Osing", iso: "osi" },
    { nama: "Pamona", iso: "pmf" }, { nama: "Pati", iso: "jax" },
    { nama: "Pendau", iso: "pdu" }, { nama: "Rampi", iso: "lje" },
    { nama: "Rembong", iso: "rkb" }, { nama: "Riang", iso: "ri" },
    { nama: "Saluan", iso: "loe" }, { nama: "Samosir", iso: "sac" },
    { nama: "Sasak", iso: "sas" }, { nama: "Sekap", iso: "skp" },
    { nama: "Selayar", iso: "sld" }, { nama: "Semende", iso: "sbd" },
    { nama: "Sumbawa", iso: "smw" }, { nama: "Sunda", iso: "sun" },
    { nama: "Tae", iso: "rob" }, { nama: "Tajio", iso: "tdj" },
    { nama: "Taloki", iso: "tll" }, { nama: "Tolaki", iso: "lbw" },
    { nama: "Tombelala", iso: "txo" }, { nama: "Tombonuwo", iso: "tgb" },
    { nama: "Tontemboan", iso: "tnt" }, { nama: "Toraja", iso: "sda" },
    { nama: "Totoli", iso: "txe" }, { nama: "Tukang Besi", iso: "bhq" },
    { nama: "Uma", iso: "ppk" }, { nama: "Wolio", iso: "wlo" },
    { nama: "Wotu", iso: "wtq" }, { nama: "Yapein", iso: "yap" },
  ];
}

async function getDetails(iso) {
  const content = await jinaFetch(`https://id.wikipedia.org/wiki/Bahasa_${iso}`);
  if (content) {
    const details = await qdExtract(content,
      `Extract data. Return JSON:
      { "jumlah_penutur": number|null, "status_vitalitas": "aman"|"rentan"|"terancam"|"sangat terancam"|"kritis"|null, "provinsi": string|null }`
    );
    if (details) return details;
  }

  // Fallback: try without "Bahasa_" prefix
  const content2 = await jinaFetch(`https://id.wikipedia.org/wiki/${iso}`);
  if (content2) {
    return await qdExtract(content2,
      `Extract data. Return JSON: { "jumlah_penutur": number|null, "provinsi": string|null }`
    );
  }

  return null;
}

async function insertLanguage(lang, details) {
  // Check exists
  const { data: existing } = await supabase
    .from("bahasa")
    .select("id").ilike("nama_bahasa", lang.nama).limit(1);
  if (existing?.length > 0) return "skip";

  const { data: rumpun } = await supabase
    .from("rumpun_bahasa").select("id").eq("nama_rumpun", "Austronesia").single();

  const { data: bahasa, error: bError } = await supabase
    .from("bahasa").insert({
      nama_bahasa: lang.nama,
      nama_lokal: lang.nama,
      kode_iso_639: lang.iso || null,
      rumpun_id: rumpun?.id || null,
      jumlah_penutur: details?.jumlah_penutur || null,
      status_vitalitas: details?.status_vitalitas || null,
    }).select().single();

  if (bError || !bahasa) return "error";

  if (details?.provinsi) {
    await supabase.from("lokasi").insert({
      bahasa_id: bahasa.id, provinsi: details.provinsi,
    });
  }

  return "ok";
}

async function main() {
  console.log("🔍 Nusantara Basa - Phase 3b: ISO 639-3 Expansion");
  console.log(`Limit: ${LIMIT} languages per run\n`);

  const languages = await getIsoLanguages();
  console.log(`\n📝 Processing ${languages.length} languages...\n`);

  let success = 0, skipped = 0, failed = 0;

  for (let i = 0; i < Math.min(languages.length, LIMIT); i++) {
    const lang = languages[i];
    console.log(`[${i + 1}/${Math.min(languages.length, LIMIT)}] ${lang.nama} (${lang.iso})`);

    try {
      const details = await getDetails(lang.iso);
      const result = await insertLanguage(lang, details);
      if (result === "ok") { console.log(`   ✅ ${lang.nama}`); success++; }
      else if (result === "skip") { console.log(`   ⏭️ Skip: ${lang.nama}`); skipped++; }
      else { console.log(`   ❌ Error: ${lang.nama}`); failed++; }
    } catch (err) {
      console.log(`   ❌ ${err.message}`);
      failed++;
    }

    await new Promise(r => setTimeout(r, 3000));
  }

  console.log(`\n📊 Done! ${success} inserted, ${skipped} skipped, ${failed} failed.`);
}

main();
