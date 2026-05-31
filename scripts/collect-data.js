// Data collection for Indonesian languages
// Priority: jina/fetch → SearXNG → qd/kmodel
// Usage: node scripts/collect-data.js

const { createClient } = require('@supabase/supabase-js');
const { execSync } = require('child_process');

const SUPABASE_URL = "https://hkeheukewxsvaarxaket.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20";
const NINEROUTER_URL = "http://localhost:20128";
const NINEROUTER_KEY = "sk-2ce0b3116b58ede3-4v2kkj-033fc842";
const SEARXNG_URL = "http://localhost:8080";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

async function jinaFetch(url) {
  try {
    const res = await fetch(`${NINEROUTER_URL}/v1/web/fetch`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "Authorization": `Bearer ${NINEROUTER_KEY}` },
      body: JSON.stringify({ model: "jina/fetch", url }),
      signal: AbortSignal.timeout(30000),
    });
    if (!res.ok) throw new Error(`jina fetch error: ${res.status}`);
    const data = await res.json();
    return data.content || data.text || "";
  } catch (err) {
    console.log(`   jina/fetch failed: ${err.message}`);
    return null;
  }
}

async function searxngSearch(query) {
  try {
    const url = `${SEARXNG_URL}/search?q=${encodeURIComponent(query)}&format=json&engines=duckduckgo,google,wikipedia&language=id`;
    const res = await fetch(url, { signal: AbortSignal.timeout(15000) });
    if (!res.ok) throw new Error(`searxng error: ${res.status}`);
    const data = await res.json();
    return data.results || [];
  } catch (err) {
    console.log(`   SearXNG failed: ${err.message}`);
    return [];
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
          { role: "system", content: "Extract data from the given text. Return ONLY valid JSON, no explanation." },
          { role: "user", content: `${prompt}\n\nText:\n${content.substring(0, 3000)}` }
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
    if (!jsonMatch) throw new Error("No JSON in response");
    return JSON.parse(jsonMatch[0]);
  } catch (err) {
    console.log(`   qd/kmodel failed: ${err.message}`);
    return null;
  }
}

async function getLanguageList() {
  console.log("\n1. Getting language list from Wikipedia...\n");

  // Try jina/fetch first
  const content = await jinaFetch("https://id.wikipedia.org/wiki/Daftar_bahasa_di_Indonesia");

  if (content) {
    const extracted = await qdExtract(content,
      "Extract ALL Indonesian languages from this text. Return JSON array: [{nama: string, iso: string, provinsi: string}]. Include as many as possible."
    );
    if (extracted && Array.isArray(extracted)) {
      console.log(`   Extracted ${extracted.length} languages from Wikipedia via jina/fetch`);
      return extracted;
    }
  }

  // Fallback to SearXNG
  console.log("   Falling back to SearXNG...");
  const results = await searxngSearch("daftar lengkap bahasa daerah Indonesia");

  for (const r of results.slice(0, 3)) {
    const content = await jinaFetch(r.url);
    if (content) {
      const extracted = await qdExtract(content,
        "Extract ALL Indonesian languages from this text. Return JSON array: [{nama: string, iso: string, provinsi: string}]."
      );
      if (extracted && Array.isArray(extracted) && extracted.length > 0) {
        console.log(`   Extracted ${extracted.length} languages from ${r.url}`);
        return extracted;
      }
    }
  }

  console.log("   Could not extract language list. Using fallback list.");
  return [];
}

async function getLanguageDetails(lang) {
  console.log(`   Fetching details for ${lang.nama}...`);

  // Search for this language
  const searchResults = await searxngSearch(`${lang.nama} bahasa daerah penutur vitalitas ISO`);

  for (const r of searchResults.slice(0, 2)) {
    const content = await jinaFetch(r.url);
    if (content) {
      const details = await qdExtract(content,
        `Extract data for language "${lang.nama}". Return JSON:
        {
          "jumlah_penutur": number or null,
          "status_vitalitas": "aman"|"rentan"|"terancam"|"sangat terancam"|"kritis" or null,
          "provinsi": string,
          "kabupaten": string or null,
          "sistem_tulisan": string or null,
          "tipe_morfologi": string or null,
          "urutan_kata": string or null,
          "lat": number or null,
          "lng": number or null
        }`
      );
      if (details) {
        console.log(`   Got details from ${r.url}`);
        return details;
      }
    }
  }

  return null;
}

async function insertLanguage(lang, details) {
  // Check if already exists
  if (lang.iso) {
    const { data: existing } = await supabase
      .from("bahasa")
      .select("id")
      .eq("kode_iso_639", lang.iso)
      .single();
    if (existing) {
      console.log(`   Already exists: ${lang.nama}`);
      return;
    }
  }

  // Get rumpun ID (default to Austronesia)
  const { data: rumpun } = await supabase
    .from("rumpun_bahasa")
    .select("id")
    .eq("nama_rumpun", "Austronesia")
    .single();

  // Insert bahasa
  const { data: bahasa, error: bError } = await supabase
    .from("bahasa")
    .insert({
      nama_bahasa: lang.nama,
      nama_lokal: lang.nama,
      kode_iso_639: lang.iso || null,
      rumpun_id: rumpun?.id || null,
      jumlah_penutur: details?.jumlah_penutur || null,
      status_vitalitas: details?.status_vitalitas || null,
      koordinat_pusat: details?.lat && details?.lng ? { type: "Point", coordinates: [details.lng, details.lat] } : null,
    })
    .select()
    .single();

  if (bError || !bahasa) {
    console.log(`   Insert failed: ${bError?.message}`);
    return;
  }

  // Insert lokasi
  if (details?.provinsi) {
    await supabase.from("lokasi").insert({
      bahasa_id: bahasa.id,
      provinsi: details.provinsi,
      kabupaten: details.kabupaten || null,
    });
  }

  // Insert fitur_linguistik
  if (details?.sistem_tulisan || details?.tipe_morfologi || details?.urutan_kata) {
    await supabase.from("fitur_linguistik").insert({
      bahasa_id: bahasa.id,
      sistem_tulisan: details.sistem_tulisan || null,
      tipe_morfologi: details.tipe_morfologi || null,
      urutan_kata: details.urutan_kata || null,
    });
  }

  console.log(`   ✅ Inserted: ${lang.nama}`);
}

async function main() {
  console.log("🔍 Nusantara Basa - Data Collection");
  console.log("Priority: jina/fetch → SearXNG → qd/kmodel\n");

  const languages = await getLanguageList();

  if (languages.length === 0) {
    console.log("\n❌ No languages found. Exiting.");
    process.exit(1);
  }

  console.log(`\n📝 Processing ${languages.length} languages...\n`);

  let success = 0;
  let failed = 0;

  for (let i = 0; i < languages.length; i++) {
    const lang = languages[i];
    console.log(`[${i + 1}/${languages.length}] ${lang.nama}`);

    try {
      const details = await getLanguageDetails(lang);
      await insertLanguage(lang, details);
      success++;
    } catch (err) {
      console.log(`   ❌ Error: ${err.message}`);
      failed++;
    }

    // Rate limit
    await new Promise(r => setTimeout(r, 3000));
  }

  console.log(`\n📊 Done! ${success} inserted, ${failed} failed.`);
}

main();
