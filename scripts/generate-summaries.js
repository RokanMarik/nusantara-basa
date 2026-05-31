// Generate AI summaries for all languages using 9Router
// Usage: node scripts/generate-summaries.js

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = "https://hkeheukewxsvaarxaket.supabase.co";
const SUPABASE_KEY = process.argv[2];
const NINEROUTER_URL = process.env.NINEROUTER_URL || "http://localhost:20128";
const NINEROUTER_KEY = process.env.NINEROUTER_KEY || "";

if (!SUPABASE_KEY) {
  console.log("Usage: node generate-summaries.js <SUPABASE_SERVICE_ROLE_KEY>");
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

async function call9Router(prompt) {
  const response = await fetch(`${NINEROUTER_URL}/v1/chat/completions`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${NINEROUTER_KEY}`,
    },
    body: JSON.stringify({
      model: "auto-ringan",
      messages: [{ role: "user", content: prompt }],
      temperature: 0.7,
      max_tokens: 500,
      stream: false,
    }),
    signal: AbortSignal.timeout(300000),
  });

  if (!response.ok) {
    const errText = await response.text();
    throw new Error(`9Router error: ${response.status} ${errText}`);
  }
  const data = await response.json();
  return data.choices?.[0]?.message?.content || "";
}

async function main() {
  console.log("🔍 Fetching languages without summary...\n");

  const { data: allBahasa, error: fetchError } = await supabase
    .from("bahasa")
    .select("id, nama_bahasa, nama_lokal, kode_iso_639, jumlah_penutur, status_vitalitas, catatan, rumpun_bahasa(nama_rumpun, sub_rumpun), lokasi(provinsi, kabupaten, tipe_wilayah), fitur_linguistik(sistem_tulisan, tipe_morfologi, urutan_kata, jumlah_vokal, jumlah_konsonan, memiliki_nada, memiliki_register), kosakata(kata, arti_indonesia)")
    .is("auto_summary", null)
    .limit(100);

  if (fetchError) {
    console.error("❌ Fetch error:", fetchError.message);
    process.exit(1);
  }

  if (!allBahasa || allBahasa.length === 0) {
    console.log("✅ Semua bahasa sudah punya summary!");
    process.exit(0);
  }

  console.log(`📝 ${allBahasa.length} bahasa perlu summary.\n`);

  let success = 0;
  let failed = 0;

  for (let i = 0; i < allBahasa.length; i++) {
    const b = allBahasa[i];
    console.log(`[${i + 1}/${allBahasa.length}] ${b.nama_bahasa}...`);

    try {
      const kosakataSample = (b.kosakata || []).slice(0, 10).map(k => `${k.kata} = ${k.arti_indonesia}`).join(", ");

      const prompt = `Buat ringkasan 3 paragraf tentang bahasa ${b.nama_bahasa}${b.nama_lokal ? ` (${b.nama_lokal})` : ""} dalam bahasa Indonesia yang informatif dan menarik.

Data:
- Rumpun: ${b.rumpun_bahasa?.nama_rumpun || "Tidak diketahui"}${b.rumpun_bahasa?.sub_rumpun ? ` (Sub-rumpun: ${b.rumpun_bahasa.sub_rumpun})` : ""}
- ISO 639-3: ${b.kode_iso_639 || "Tidak ada"}
- Jumlah penutur: ${b.jumlah_penutur ? b.jumlah_penutur.toLocaleString("id-ID") : "Tidak diketahui"}
- Status vitalitas: ${b.status_vitalitas || "Tidak diketahui"}
- Lokasi: ${(b.lokasi || []).map(l => l.provinsi).filter(Boolean).join(", ") || "Tidak diketahui"}
- Sistem tulisan: ${b.fitur_linguistik?.sistem_tulisan || "Tidak diketahui"}
- Tipe morfologi: ${b.fitur_linguistik?.tipe_morfologi || "Tidak diketahui"}
- Urutan kata: ${b.fitur_linguistik?.urutan_kata || "Tidak diketahui"}
${kosakataSample ? `- Contoh kosakata: ${kosakataSample}` : ""}

Format:
- Paragraf 1: Overview (rumpun, lokasi, jumlah penutur, konteks budaya)
- Paragraf 2: Fitur linguistik (tulisan, morfologi, fonologi, contoh kosakata)
- Paragraf 3: Status preservasi dan ancaman (jika ada)

Jawab dalam bahasa Indonesia. 3 paragraf saja, tanpa heading.`;

      const summary = await call9Router(prompt);

      const { error: updateError } = await supabase
        .from("bahasa")
        .update({ auto_summary: summary.trim() })
        .eq("id", b.id);

      if (updateError) throw updateError;

      console.log(`   ✅ Summary generated (${summary.length} chars)`);
      success++;

      // Rate limit - 45 detik antar request (hindari 429)
      await new Promise(r => setTimeout(r, 10000));

    } catch (err) {
      console.log(`   ❌ Failed: ${err.message}`);
      failed++;
    }
  }

  console.log(`\n📊 Selesai! ${success} berhasil, ${failed} gagal.`);
}

main();
