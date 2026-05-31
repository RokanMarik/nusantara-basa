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

async function getLanguageList() {
  console.log("\n1. Getting language list from Wikipedia...\n");

  const results = await wikipediaSearch("bahasa daerah Indonesia", 30);
  if (results.length === 0) return [];

  console.log(`   Found ${results.length} Wikipedia articles`);

  // Extract language names from search results
  const languages = results
    .filter(r => r.title.includes("Bahasa") || r.title.includes("Suku"))
    .map(r => ({ nama: r.title.replace(/^Bahasa\s*/, ''), snippet: r.snippet }));

  // Deduplicate
  const seen = new Set();
  const unique = languages.filter(l => {
    const key = l.nama.toLowerCase().substring(0, 10);
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });

  console.log(`   ${unique.length} unique languages`);
  return unique.slice(0, 30); // Limit to 30 for now
}

async function getLanguageDetails(lang) {
  console.log(`   Getting details for ${lang.nama}...`);

  // Get Wikipedia page content
  const pageContent = await wikipediaGetPage(lang.nama.startsWith("Bahasa ") ? lang.nama : `Bahasa ${lang.nama}`);

  if (pageContent) {
    const details = await qdExtract(pageContent,
      `Extract data about this language. Return JSON:
      {
        "jumlah_penutur": number or null,
        "status_vitalitas": "aman"|"rentan"|"terancam"|"sangat terancam"|"kritis"|null,
        "provinsi": string or null,
        "sistem_tulisan": string or null,
        "tipe_morfologi": string or null,
        "urutan_kata": string or null
      }
      If data not found, use null.`
    );
    if (details) return details;
  }

  // Fallback: use SearXNG snippets
  console.log(`   Trying SearXNG for ${lang.nama}...`);
  const url = `${SEARXNG_URL}/search?q=${encodeURIComponent(`bahasa ${lang.nama} penutur vitalitas`)}&format=json&language=id&engines=duckduckgo,wikipedia`;
  try {
    const res = await fetch(url, { signal: AbortSignal.timeout(10000) });
    const data = await res.json();
    const snippets = data.results?.slice(0, 3).map(r => `${r.title}: ${r.content}`).join("\n\n");

    if (snippets) {
      const details = await qdExtract(snippets,
        `Extract data from search results. Return JSON:
        { "jumlah_penutur": number|null, "status_vitalitas": string|null, "provinsi": string|null }`
      );
      if (details) return details;
    }
  } catch {}

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

  for (let i = 0; i < languages.length; i++) {
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
