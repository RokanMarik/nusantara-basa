// Data collection for Indonesian languages
// Uses: Wikipedia API → qd/kmodel → Supabase
// Usage: node scripts/collect-data.js

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = "https://hkeheukewxsvaarxaket.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20";
const NINEROUTER_URL = "http://localhost:20128";
const NINEROUTER_KEY = "sk-2ce0b3116b58ede3-4v2kkj-033fc842";
const SEARXNG_URL = "http://localhost:8080";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// Wikipedia API (returns JSON directly, no fetch needed)
async function wikipediaSearch(query, limit = 20) {
  try {
    const url = `https://id.wikipedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(query)}&srlimit=${limit}&format=json&origin=*`;
    const res = await fetch(url, { signal: AbortSignal.timeout(10000) });
    const data = await res.json();
    return data.query?.search || [];
  } catch (err) {
    console.log(`   Wikipedia API failed: ${err.message}`);
    return [];
  }
}

async function wikipediaGetPage(title) {
  try {
    const url = `https://id.wikipedia.org/w/api.php?action=query&titles=${encodeURIComponent(title)}&prop=extracts&explaintext=true&format=json&origin=*`;
    const res = await fetch(url, { signal: AbortSignal.timeout(10000) });
    const data = await res.json();
    const pages = data.query?.pages || {};
    const page = Object.values(pages)[0];
    return page?.extract || "";
  } catch (err) {
    return "";
  }
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
      signal: AbortSignal.timeout(45000),
    });
    if (!res.ok) throw new Error(`qd/kmodel error: ${res.status}`);
    const data = await res.json();
    const content_ = data.choices?.[0]?.message?.content || "";
    const jsonMatch = content_.match(/\{[\s\S]*?\}/);
    if (!jsonMatch) throw new Error("No JSON");
    return JSON.parse(jsonMatch[0]);
  } catch (err) {
    console.log(`   qd/kmodel failed: ${err.message}`);
    return null;
  }
}

const JINA_API_KEY = "jina_0c540aa7efef42229075a6c58bd5bfbcAAKAJglySqUEUW1yoifWMPN1SN8Z";

async function jinaFetch(url) {
  try {
    const res = await fetch(`https://r.jina.ai/${url}`, {
      headers: {
        "Authorization": `Bearer ${JINA_API_KEY}`,
        "Accept": "text/plain",
      },
      signal: AbortSignal.timeout(30000),
    });
    if (!res.ok) throw new Error(`Jina error: ${res.status}`);
    return await res.text();
  } catch (err) {
    console.log(`   Jina failed: ${err.message}`);
    return null;
  }
}

async function getLanguageList() {
  console.log("\n1. Getting language list from multiple sources...\n");

  const allLangs = [];

  // Source 1: Wikipedia ID - Bahasa di Indonesia menurut rumpun
  console.log("   Source 1: Wikipedia ID...");
  const rumpunSearch = await wikipediaSearch("bahasa di Indonesia menurut rumpun", 20);
  for (const r of rumpunSearch) {
    if (r.title.startsWith("Bahasa ") && !r.title.includes("Daftar")) {
      allLangs.push({ nama: r.title.replace(/^Bahasa\s*/, ''), source: "wikipedia-id" });
    }
  }

  // Source 2: Wikipedia ID - Bahasa daerah per provinsi
  console.log("   Source 2: Bahasa per provinsi...");
  const provSearch = await wikipediaSearch("bahasa daerah di Indonesia provinsi", 30);
  for (const r of provSearch) {
    if (r.title.startsWith("Bahasa ")) {
      allLangs.push({ nama: r.title.replace(/^Bahasa\s*/, ''), source: "wikipedia-id" });
    }
  }

  // Source 3: Wikipedia ID - List bahasa
  console.log("   Source 3: Daftar bahasa...");
  const listSearch = await wikipediaSearch("daftar bahasa di Indonesia", 20);
  for (const r of listSearch) {
    const page = await wikipediaGetPage(r.title);
    if (page) {
      const extracted = await qdExtract(page,
        "Extract ALL language names mentioned. Return JSON array: [{nama: string}]. Only actual language names, not rumpun or categories."
      );
      if (extracted && Array.isArray(extracted)) {
        extracted.forEach(l => allLangs.push({ nama: l.nama, source: "wikipedia-list" }));
      }
    }
  }

  // Deduplicate
  const seen = new Set();
  const unique = allLangs.filter(l => {
    const key = l.nama.toLowerCase().trim();
    if (seen.has(key) || key.length < 3) return false;
    seen.add(key);
    return true;
  });

  // Filter out garbage patterns
  const garbage = /^rumpun|^daftar|^bahasa daerah|^suku|^kelompok|^wilayah|^dialek|^surat|^di\s|filipina|nugini|alkitab|klasik$|belanda|inggris$|^indonesia$|^indonesia\s|^daerah$|newar|umbria|tsat|^gaul$|^gaul\s|^\s*$/i;
  const clean = unique.filter(l => !garbage.test(l.nama));

  console.log(`   ${allLangs.length} raw → ${unique.length} unique → ${clean.length} clean`);
  return clean;
}

async function getLanguageDetails(lang) {
  console.log(`   Getting details for ${lang.nama}...`);

  // Try Jina fetch from multiple sources
  const urls = [
    `https://id.wikipedia.org/wiki/Bahasa_${encodeURIComponent(lang.nama)}`,
    `https://id.wikipedia.org/wiki/${encodeURIComponent(lang.nama)}`,
    `https://www.ethnologue.com/language/${lang.iso || ''}`,
  ].filter(u => !u.includes('/language/'));

  for (const url of urls) {
    const content = await jinaFetch(url);
    if (content && content.length > 200) {
      const details = await qdExtract(content,
        `Extract data about "${lang.nama}". Return JSON:
        {
          "jumlah_penutur": number|null,
          "status_vitalitas": "aman"|"rentan"|"terancam"|"sangat terancam"|"kritis"|null,
          "provinsi": string|null,
          "kabupaten": string|null,
          "sistem_tulisan": string|null,
          "tipe_morfologi": string|null,
          "urutan_kata": string|null
        }`
      );
      if (details && (details.jumlah_penutur || details.provinsi)) {
        console.log(`   ✅ Got details from Jina (${url})`);
        return details;
      }
    }
  }

  // Fallback: Wikipedia API
  const pageContent = await wikipediaGetPage(lang.nama.startsWith("Bahasa ") ? lang.nama : `Bahasa ${lang.nama}`);
  if (pageContent) {
    const details = await qdExtract(pageContent,
      `Extract data. Return JSON: { "jumlah_penutur": number|null, "status_vitalitas": string|null, "provinsi": string|null }`
    );
    if (details) return details;
  }

  return null;
}

async function insertLanguage(lang, details) {
  // Check if exists
  const { data: existing } = await supabase
    .from("bahasa")
    .select("id")
    .ilike("nama_bahasa", lang.nama)
    .limit(1);

  if (existing?.length > 0) {
    console.log(`   Already exists: ${lang.nama}`);
    return;
  }

  // Get rumpun ID
  const { data: rumpun } = await supabase
    .from("rumpun_bahasa")
    .select("id").eq("nama_rumpun", "Austronesia").single();

  // Insert bahasa
  const { data: bahasa, error: bError } = await supabase
    .from("bahasa")
    .insert({
      nama_bahasa: lang.nama,
      nama_lokal: lang.nama,
      rumpun_id: rumpun?.id || null,
      jumlah_penutur: details?.jumlah_penutur || null,
      status_vitalitas: details?.status_vitalitas || null,
    })
    .select().single();

  if (bError || !bahasa) {
    console.log(`   Insert failed: ${bError?.message}`);
    return;
  }

  // Insert lokasi
  if (details?.provinsi) {
    await supabase.from("lokasi").insert({
      bahasa_id: bahasa.id,
      provinsi: details.provinsi,
    });
  }

  // Insert fitur
  if (details?.sistem_tulisan || details?.tipe_morfologi) {
    await supabase.from("fitur_linguistik").insert({
      bahasa_id: bahasa.id,
      sistem_tulisan: details.sistem_tulisan || null,
      tipe_morfologi: details.tipe_morfologi || null,
      urutan_kata: details.urutan_kata || null,
    });
  }

  console.log(`   ✅ ${lang.nama}`);
}

async function main() {
  console.log("🔍 Nusantara Basa - Data Collection");
  console.log("Wikipedia API → qd/kmodel → Supabase\n");

  const languages = await getLanguageList();
  if (languages.length === 0) {
    console.log("\n❌ No languages found.");
    process.exit(1);
  }

  console.log(`\n📝 Processing ${languages.length} languages...\n`);

  let success = 0, failed = 0;
  const maxProcess = Math.min(languages.length, 50); // Limit to 50 per run

  for (let i = 0; i < maxProcess; i++) {
    const lang = languages[i];
    console.log(`[${i + 1}/${languages.length}] ${lang.nama}`);

    try {
      const details = await getLanguageDetails(lang);
      await insertLanguage(lang, details);
      success++;
    } catch (err) {
      console.log(`   ❌ ${err.message}`);
      failed++;
    }

    await new Promise(r => setTimeout(r, 2000));
  }

  console.log(`\n📊 Done! ${success} inserted, ${failed} failed.`);
}

main();
