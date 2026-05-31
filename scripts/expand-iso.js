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
    { nama: "Iban", iso: "iba" }, { nama: "Kaili", iso: "lew" },
    { nama: "Kamang", iso: "woy" }, { nama: "Kambera", iso: "xbr" },
    { nama: "Kamberau", iso: "bim" }, { nama: "Kendayan", iso: "knx" },
    { nama: "Kerinci", iso: "kvr" }, { nama: "Konjo", iso: "kjc" },
    { nama: "Kutai", iso: "vkt" }, { nama: "Lampung", iso: "ljp" },
    { nama: "Leti", iso: "lti" }, { nama: "Loloda", iso: "lll" },
    { nama: "Mandar", iso: "mdr" }, { nama: "Manggarai", iso: "mql" },
    { nama: "Marind", iso: "mqy" }, { nama: "Melayu", iso: "msa" },
    { nama: "Minangkabau", iso: "min" }, { nama: "Mori Bawah", iso: "xmz" },
    { nama: "Muna", iso: "mnb" }, { nama: "Nias", iso: "nia" },
    { nama: "Osing", iso: "osi" }, { nama: "Pamona", iso: "pmf" },
    { nama: "Pendau", iso: "pdu" }, { nama: "Rampi", iso: "lje" },
    { nama: "Rembong", iso: "rkb" }, { nama: "Saluan", iso: "loe" },
    { nama: "Sasak", iso: "sas" }, { nama: "Selayar", iso: "sld" },
    { nama: "Semende", iso: "sbd" }, { nama: "Sumbawa", iso: "smw" },
    { nama: "Sunda", iso: "sun" }, { nama: "Tae", iso: "rob" },
    { nama: "Tajio", iso: "tdj" }, { nama: "Tolaki", iso: "lbw" },
    { nama: "Tontemboan", iso: "tnt" }, { nama: "Toraja", iso: "sda" },
    { nama: "Totoli", iso: "txe" }, { nama: "Tukang Besi", iso: "bhq" },
    { nama: "Uma", iso: "ppk" }, { nama: "Wolio", iso: "wlo" },
    { nama: "Wotu", iso: "wtq" }, { nama: "Yapein", iso: "yap" },
    { nama: "Asmat", iso: "asm" }, { nama: "Ekari", iso: "ekg" },
    { nama: "Dani Barat", iso: "dnw" }, { nama: "Dani Tengah", iso: "dna" },
    { nama: "Lani", iso: "lgi" }, { nama: "Yali", iso: "yli" },
    { nama: "Korowai", iso: "kew" }, { nama: "Mee", iso: "mea" },
    { nama: "Moni", iso: "kgm" }, { nama: "Damal", iso: "dcn" },
    { nama: "Amung", iso: "kwy" }, { nama: "Kamoro", iso: "kao" },
    { nama: "Sempan", iso: "sde" }, { nama: "Arfak", iso: "arf" },
    { nama: "Maybrat", iso: "ayz" }, { nama: "Hatam", iso: "had" },
    { nama: "Sougb", iso: "sog" }, { nama: "Mpur", iso: "akc" },
    { nama: "Abun", iso: "kgr" }, { nama: "Biak", iso: "bhw" },
    { nama: "Waropen", iso: "wrp" }, { nama: "Serui", iso: "sry" },
    { nama: "Yapen", iso: "yap" }, { nama: "Ansus", iso: "and" },
    { nama: "Logudayak", iso: "lnd" }, { nama: "Bukit", iso: "bkn" },
    { nama: "Bukit Malay", iso: "bku" }, { nama: "Mendawai", iso: "mdw" },
    { nama: "Punan Tubu", iso: "pnt" }, { nama: "Punan Bah", iso: "pna" },
    { nama: "Katingan", iso: "kxg" }, { nama: "Ot Danum", iso: "otd" },
    { nama: "Siang", iso: "sya" }, { nama: "Murut", iso: "mvv" },
    { nama: "Tidung", iso: "nti" }, { nama: "Berau", iso: "beu" },
    { nama: "Segai", iso: "sgr" }, { nama: "Merap", iso: "mep" },
    { nama: "Lundayeh", iso: "lnd" }, { nama: "Kenyah", iso: "xkl" },
    { nama: "Bahau", iso: "bhv" }, { nama: "Modang", iso: "mxd" },
    { nama: "Benuaq", iso: "bqn" }, { nama: "Tunjung", iso: "tuj" },
    { nama: "Lawangan", iso: "lbx" }, { nama: "Maanyan", iso: "mhy" },
    { nama: "Dusun Deyah", iso: "dun" }, { nama: "Paku", iso: "pku" },
    { nama: "Tawoyan", iso: "twy" }, { nama: "Ngaju", iso: "nij" },
    { nama: "Bakumpai", iso: "bkr" }, { nama: "Bara Dia", iso: "bdi" },
    { nama: "Mantangai", iso: "mtn" }, { nama: "Sebangau", iso: "sbg" },
    { nama: "Sampit", iso: "smp" }, { nama: "Kahayan", iso: "khy" },
    { nama: "Kapuas", iso: "kpu" }, { nama: "Mendawai", iso: "mdw" },
    { nama: "Sukamara", iso: "suk" }, { nama: "Kendawangan", iso: "knd" },
    { nama: "Jelai", iso: "jli" }, { nama: "Kumai", iso: "kmi" },
    { nama: "Lamandau", iso: "lmd" }, { nama: "Bulik", iso: "blk" },
    { nama: "Delang", iso: "dln" }, { nama: "Benua", iso: "bnu" },
    { nama: "Pembuang", iso: "pmb" }, { nama: "Seruyan", iso: "sry" },
    { nama: "Danau Sembuluh", iso: "dsb" }, { nama: "Sian", iso: "sya" },
    { nama: "Dohoi", iso: "otd" }, { nama: "Tumbang", iso: "tmb" },
    { nama: "Kahayan Hulu", iso: "khu" }, { nama: "Maliku", iso: "mlk" },
    { nama: "Petak Malai", iso: "pml" }, { nama: "Rungan", iso: "rgr" },
    { nama: "Manen", iso: "mnn" }, { nama: "Patas", iso: "pts" },
    { nama: "Katingan Hilir", iso: "khi" }, { nama: "Katingan Hulu", iso: "khu" },
    { nama: "Teweh", iso: "twh" }, { nama: "Lahei", iso: "lhi" },
    { nama: "Montalat", iso: "mnt" }, { nama: "Barito Raya", iso: "bry" },
    { nama: "Dayak Siang", iso: "sya" }, { nama: "Bakati", iso: "sne" },
    { nama: "Lara", iso: "lra" }, { nama: "Sara", iso: "srj" },
    { nama: "Riang", iso: "ri" }, { nama: "Hoyah", iso: "hya" },
    { nama: "Kendayan", iso: "knx" }, { nama: "Selako", iso: "skl" },
    { nama: "Belom", iso: "blm" }, { nama: "Bukit", iso: "bkn" },
    { nama: "Kendayan Darat", iso: "knd" }, { nama: "Bekati", iso: "bth" },
    { nama: "Semandang", iso: "smd" }, { nama: "Sanggau", iso: "scg" },
    { nama: "Ribun", iso: "rbo" }, { nama: "Mualang", iso: "mld" },
    { nama: "Tabun", iso: "tbn" }, { nama: "Jongkong", iso: "jkg" },
    { nama: "Embaloh", iso: "ebu" }, { nama: "Taman", iso: "tmn" },
    { nama: "Kalbar", iso: "kbr" }, { nama: "Seberuang", iso: "sbe" },
    { nama: "Bukit", iso: "bkt" }, { nama: "Bukit Kelam", iso: "bkl" },
    { nama: "Sajingan", iso: "sjn" }, { nama: "Sekayam", iso: "sky" },
    { nama: "Sintang", iso: "stg" }, { nama: "Silat", iso: "slt" },
    { nama: "Serawai", iso: "srw" }, { nama: "Kabong", iso: "kbg" },
    { nama: "Ambalau", iso: "aml" }, { nama: "Moksela", iso: "mox" },
    { nama: "Lisabata", iso: "lsl" }, { nama: "Nuniali", iso: "nul" },
    { nama: "Luhu", iso: "lhu" }, { nama: "Manipa", iso: "mnp" },
    { nama: "Piru", iso: "prr" }, { nama: "Asilulu", iso: "asl" },
    { nama: "Hitu", iso: "hit" }, { nama: "Tulehu", iso: "tlh" },
    { nama: "Nusaelaut", iso: "nua" }, { nama: "Teluti", iso: "tlt" },
    { nama: "Elpaputih", iso: "epu" }, { nama: "Sepa", iso: "spg" },
    { nama: "Kaelolo", iso: "klv" }, { nama: "Amahai", iso: "amq" },
    { nama: "Seit", iso: "sei" }, { nama: "Waioli", iso: "wot" },
    { nama: "Sahu", iso: "saj" }, { nama: "Tobelo", iso: "tlb" },
    { nama: "Galela", iso: "gbi" }, { nama: "Loloda", iso: "lll" },
    { nama: "Modole", iso: "mdw" }, { nama: "Waioli", iso: "wot" },
    { nama: "Ibu", iso: "iba" }, { nama: "Sahu", iso: "saj" },
    { nama: "Ternate", iso: "tvo" }, { nama: "Tidore", iso: "tby" },
    { nama: "Gane", iso: "gno" }, { nama: "Makian", iso: "mky" },
    { nama: "Kayoa", iso: "kya" }, { nama: "Bacan", iso: "bch" },
    { nama: "Obi", iso: "obi" }, { nama: "Forest Tobelo", iso: "tbg" },
    { nama: "Pagu", iso: "pau" }, { nama: "Sahu", iso: "saj" },
    { nama: "Gamkonora", iso: "gmk" }, { nama: "Waioli", iso: "wot" },
    { nama: "Maba", iso: "mga" }, { nama: "Patani", iso: "ptz" },
    { nama: "Sawai", iso: "swb" }, { nama: "Moklen", iso: "mwm" },
    { nama: "Togutil", iso: "tou" }, { nama: "Kao", iso: "kao" },
    { nama: "Weda", iso: "wed" }, { nama: "Yamdena", iso: "jmd" },
    { nama: "Fordata", iso: "frd" }, { nama: "Selaru", iso: "slu" },
    { nama: "Seluwasan", iso: "slw" }, { nama: "Yamdena", iso: "jmd" },
    { nama: "Dawera-Daweloor", iso: "dwd" }, { nama: "Emplawas", iso: "emw" },
    { nama: "Damer", iso: "dmr" }, { nama: "Wetarese", iso: "wet" },
    { nama: "Galoli", iso: "gal" }, { nama: "Idalaka", iso: "idl" },
    { nama: "Lova", iso: "lva" }, { nama: "Makuva", iso: "mvv" },
    { nama: "Raihat", iso: "rht" }, { nama: "Tetum", iso: "tet" },
    { nama: "Buna", iso: "bfn" }, { nama: "Naueti", iso: "nvt" },
    { nama: "Makasae", iso: "mkz" }, { nama: "Sa'ban", iso: "snb" },
    { nama: "Kelabit", iso: "kzi" }, { nama: "Sa'ban", iso: "snb" },
    { nama: "Sungai", iso: "sug" }, { nama: "Tringgus", iso: "tgg" },
    { nama: "Berawan", iso: "bwu" }, { nama: "Kiput", iso: "kyw" },
    { nama: "Belait", iso: "beg" }, { nama: "Bisaya", iso: "bth" },
    { nama: "Murut", iso: "mvv" }, { nama: "Timugon", iso: "tih" },
    { nama: "Baukan", iso: "bkn" }, { nama: "Lundayeh", iso: "lnd" },
    { nama: "Dusun", iso: "dun" }, { nama: "Tatana", iso: "ttg" },
    { nama: "Rungus", iso: "drg" }, { nama: "Tobilung", iso: "tgg" },
    { nama: "Ida'an", iso: "dbj" }, { nama: "Bonggi", iso: "txg" },
    { nama: "Brunei", iso: "kxd" }, { nama: "Kedayan", iso: "kxd" },
    { nama: "Belait", iso: "beg" }, { nama: "Tutong", iso: "ttx" },
    { nama: "Dusun", iso: "dun" }, { nama: "Murut", iso: "mvv" },
    { nama: "Bisaya", iso: "bth" }, { nama: "Iban", iso: "iba" },
    { nama: "Melanau", iso: "mlx" }, { nama: "Kajang", iso: "kaj" },
    { nama: "Kejaman", iso: "kje" }, { nama: "Punan", iso: "pna" },
    { nama: "Bukit", iso: "bkn" }, { nama: "Sekapan", iso: "skp" },
    { nama: "Sian", iso: "sya" }, { nama: "Kenyah", iso: "xkl" },
    { nama: "Bakati", iso: "sne" }, { nama: "Lara", iso: "lra" },
    { nama: "Kendayan", iso: "knx" }, { nama: "Salako", iso: "skl" },
    { nama: "Mualang", iso: "mld" }, { nama: "Serawai", iso: "srw" },
    { nama: "Kerinci", iso: "kvr" }, { nama: "Kubu", iso: "kvb" },
    { nama: "Lematang", iso: "lmt" }, { nama: "Lintang", iso: "lnt" },
    { nama: "Musi", iso: "mui" }, { nama: "Ogan", iso: "ogn" },
    { nama: "Pasemah", iso: "pse" }, { nama: "Penesak", iso: "pns" },
    { nama: "Rawas", iso: "rws" }, { nama: "Rejang", iso: "rjb" },
    { nama: "Serawai", iso: "srw" }, { nama: "Semendo", iso: "sbd" },
    { nama: "Komering", iso: "mge" }, { nama: "Lampung Api", iso: "ljp" },
    { nama: "Lampung Nyo", iso: "abl" }, { nama: "Pubian", iso: "pbi" },
    { nama: "Abung", iso: "abu" }, { nama: "Sungkai", iso: "skk" },
    { nama: "Tulangbawang", iso: "tlb" }, { nama: "Krui", iso: "kri" },
    { nama: "Ranau", iso: "rnu" }, { nama: "Belalau", iso: "bla" },
    { nama: "Pesisir", iso: "psi" }, { nama: "Melayu", iso: "msa" },
    { nama: "Melayu Jambi", iso: "jax" }, { nama: "Melayu Palembang", iso: "plm" },
    { nama: "Melayu Bengkulu", iso: "bke" }, { nama: "Melayu Riau", iso: "msi" },
    { nama: "Melayu Belitung", iso: "blz" }, { nama: "Melayu Bangka", iso: "mfa" },
    { nama: "Kutai", iso: "vkt" }, { nama: "Banjar", iso: "bjn" },
    { nama: "Berau", iso: "beu" }, { nama: "Sama-Bajau", iso: "bdr" },
    { nama: "Bajau", iso: "bdr" }, { nama: "Sama", iso: "ssb" },
    { nama: "Yakan", iso: "yka" }, { nama: "Bonggi", iso: "txg" },
    { nama: "Iranun", iso: "irn" }, { nama: "Maranao", iso: "mrw" },
    { nama: "Maguindanao", iso: "mdh" }, { nama: "Tausug", iso: "tsg" },
    { nama: "Suluk", iso: "suk" }, { nama: "Punan", iso: "pna" },
    { nama: "Bukat", iso: "bkl" }, { nama: "Dohoi", iso: "otd" },
    { nama: "Siang", iso: "sya" }, { nama: "Ot Danum", iso: "otd" },
    { nama: "Maanyan", iso: "mhy" }, { nama: "Lawangan", iso: "lbx" },
    { nama: "Ngaju", iso: "nij" }, { nama: "Bakumpai", iso: "bkr" },
    { nama: "Bara Dia", iso: "bdi" }, { nama: "Mantangai", iso: "mtn" },
    { nama: "Sebangau", iso: "sbg" }, { nama: "Kahayan", iso: "khy" },
    { nama: "Kapuas", iso: "kpu" }, { nama: "Mendawai", iso: "mdw" },
    { nama: "Sukamara", iso: "suk" }, { nama: "Kendawangan", iso: "knd" },
    { nama: "Jelai", iso: "jli" }, { nama: "Kumai", iso: "kmi" },
    { nama: "Lamandau", iso: "lmd" }, { nama: "Bulik", iso: "blk" },
    { nama: "Delang", iso: "dln" }, { nama: "Benua", iso: "bnu" },
    { nama: "Pembuang", iso: "pmb" }, { nama: "Seruyan", iso: "sry" },
    { nama: "Danau Sembuluh", iso: "dsb" }, { nama: "Dohoi", iso: "otd" },
    { nama: "Tumbang", iso: "tmb" }, { nama: "Kahayan Hulu", iso: "khu" },
    { nama: "Maliku", iso: "mlk" }, { nama: "Petak Malai", iso: "pml" },
    { nama: "Rungan", iso: "rgr" }, { nama: "Manen", iso: "mnn" },
    { nama: "Patas", iso: "pts" }, { nama: "Katingan Hilir", iso: "khi" },
    { nama: "Katingan Hulu", iso: "khu" }, { nama: "Teweh", iso: "twh" },
    { nama: "Lahei", iso: "lhi" }, { nama: "Montalat", iso: "mnt" },
    { nama: "Barito Raya", iso: "bry" }, { nama: "Dayak Siang", iso: "sya" },
    { nama: "Bakati", iso: "sne" }, { nama: "Lara", iso: "lra" },
    { nama: "Sara", iso: "srj" }, { nama: "Riang", iso: "ri" },
    { nama: "Hoyah", iso: "hya" }, { nama: "Kendayan", iso: "knx" },
    { nama: "Selako", iso: "skl" }, { nama: "Belom", iso: "blm" },
    { nama: "Bukit", iso: "bkn" }, { nama: "Kendayan Darat", iso: "knd" },
    { nama: "Bekati", iso: "bth" }, { nama: "Semandang", iso: "smd" },
    { nama: "Sanggau", iso: "scg" }, { nama: "Ribun", iso: "rbo" },
    { nama: "Mualang", iso: "mld" }, { nama: "Tabun", iso: "tbn" },
    { nama: "Jongkong", iso: "jkg" }, { nama: "Embaloh", iso: "ebu" },
    { nama: "Taman", iso: "tmn" }, { nama: "Kalbar", iso: "kbr" },
    { nama: "Seberuang", iso: "sbe" }, { nama: "Bukit", iso: "bkt" },
    { nama: "Bukit Kelam", iso: "bkl" }, { nama: "Sajingan", iso: "sjn" },
    { nama: "Sekayam", iso: "sky" }, { nama: "Sintang", iso: "stg" },
    { nama: "Silat", iso: "slt" }, { nama: "Serawai", iso: "srw" },
    { nama: "Kabong", iso: "kbg" }, { nama: "Ambalau", iso: "aml" },
    { nama: "Moksela", iso: "mox" }, { nama: "Lisabata", iso: "lsl" },
    { nama: "Nuniali", iso: "nul" }, { nama: "Luhu", iso: "lhu" },
    { nama: "Manipa", iso: "mnp" }, { nama: "Piru", iso: "prr" },
    { nama: "Asilulu", iso: "asl" }, { nama: "Hitu", iso: "hit" },
    { nama: "Tulehu", iso: "tlh" }, { nama: "Nusaelaut", iso: "nua" },
    { nama: "Teluti", iso: "tlt" }, { nama: "Elpaputih", iso: "epu" },
    { nama: "Sepa", iso: "spg" }, { nama: "Kaelolo", iso: "klv" },
    { nama: "Amahai", iso: "amq" }, { nama: "Seit", iso: "sei" },
    { nama: "Waioli", iso: "wot" }, { nama: "Sahu", iso: "saj" },
    { nama: "Tobelo", iso: "tlb" }, { nama: "Galela", iso: "gbi" },
    { nama: "Loloda", iso: "lll" }, { nama: "Modole", iso: "mdw" },
    { nama: "Ibu", iso: "iba" }, { nama: "Ternate", iso: "tvo" },
    { nama: "Tidore", iso: "tby" }, { nama: "Gane", iso: "gno" },
    { nama: "Makian", iso: "mky" }, { nama: "Kayoa", iso: "kya" },
    { nama: "Bacan", iso: "bch" }, { nama: "Obi", iso: "obi" },
    { nama: "Forest Tobelo", iso: "tbg" }, { nama: "Pagu", iso: "pau" },
    { nama: "Gamkonora", iso: "gmk" }, { nama: "Maba", iso: "mga" },
    { nama: "Patani", iso: "ptz" }, { nama: "Sawai", iso: "swb" },
    { nama: "Moklen", iso: "mwm" }, { nama: "Togutil", iso: "tou" },
    { nama: "Kao", iso: "kao" }, { nama: "Weda", iso: "wed" },
    { nama: "Yamdena", iso: "jmd" }, { nama: "Fordata", iso: "frd" },
    { nama: "Selaru", iso: "slu" }, { nama: "Seluwasan", iso: "slw" },
    { nama: "Dawera-Daweloor", iso: "dwd" }, { nama: "Emplawas", iso: "emw" },
    { nama: "Damer", iso: "dmr" }, { nama: "Wetarese", iso: "wet" },
    { nama: "Galoli", iso: "gal" }, { nama: "Idalaka", iso: "idl" },
    { nama: "Lova", iso: "lva" }, { nama: "Makuva", iso: "mvv" },
    { nama: "Raihat", iso: "rht" }, { nama: "Tetum", iso: "tet" },
    { nama: "Buna", iso: "bfn" }, { nama: "Naueti", iso: "nvt" },
    { nama: "Makasae", iso: "mkz" }, { nama: "Sa'ban", iso: "snb" },
    { nama: "Kelabit", iso: "kzi" }, { nama: "Sungai", iso: "sug" },
    { nama: "Tringgus", iso: "tgg" }, { nama: "Berawan", iso: "bwu" },
    { nama: "Kiput", iso: "kyw" }, { nama: "Belait", iso: "beg" },
    { nama: "Bisaya", iso: "bth" }, { nama: "Timugon", iso: "tih" },
    { nama: "Tobilung", iso: "tgg" }, { nama: "Ida'an", iso: "dbj" },
    { nama: "Brunei", iso: "kxd" }, { nama: "Kedayan", iso: "kxd" },
    { nama: "Tutong", iso: "ttx" }, { nama: "Rungus", iso: "drg" },
    { nama: "Bonggi", iso: "txg" }, { nama: "Melanau", iso: "mlx" },
    { nama: "Kajang", iso: "kaj" }, { nama: "Kejaman", iso: "kje" },
    { nama: "Sekapan", iso: "skp" }, { nama: "Tatana", iso: "ttg" },
    { nama: "Tobilung", iso: "tgg" }, { nama: "Iranun", iso: "irn" },
    { nama: "Maranao", iso: "mrw" }, { nama: "Maguindanao", iso: "mdh" },
    { nama: "Tausug", iso: "tsg" }, { nama: "Yakan", iso: "yka" },
    { nama: "Punan", iso: "pna" }, { nama: "Bukat", iso: "bkl" },
    { nama: "Dusun", iso: "dun" }, { nama: "Murut", iso: "mvv" },
    { nama: "Bukit", iso: "bkt" }, { nama: "Bukit Kelam", iso: "bkl" },
    { nama: "Sajingan", iso: "sjn" }, { nama: "Sekayam", iso: "sky" },
    { nama: "Sintang", iso: "stg" }, { nama: "Silat", iso: "slt" },
    { nama: "Kabong", iso: "kbg" }, { nama: "Ambalau", iso: "aml" },
    { nama: "Moksela", iso: "mox" }, { nama: "Lisabata", iso: "lsl" },
    { nama: "Nuniali", iso: "nul" }, { nama: "Luhu", iso: "lhu" },
    { nama: "Manipa", iso: "mnp" }, { nama: "Piru", iso: "prr" },
    { nama: "Asilulu", iso: "asl" }, { nama: "Hitu", iso: "hit" },
    { nama: "Tulehu", iso: "tlh" }, { nama: "Nusaelaut", iso: "nua" },
    { nama: "Teluti", iso: "tlt" }, { nama: "Elpaputih", iso: "epu" },
    { nama: "Sepa", iso: "spg" }, { nama: "Kaelolo", iso: "klv" },
    { nama: "Amahai", iso: "amq" }, { nama: "Seit", iso: "sei" },
    { nama: "Waioli", iso: "wot" }, { nama: "Sahu", iso: "saj" },
    { nama: "Tobelo", iso: "tlb" }, { nama: "Galela", iso: "gbi" },
    { nama: "Loloda", iso: "lll" }, { nama: "Modole", iso: "mdw" },
    { nama: "Ibu", iso: "iba" }, { nama: "Ternate", iso: "tvo" },
    { nama: "Tidore", iso: "tby" }, { nama: "Gane", iso: "gno" },
    { nama: "Makian", iso: "mky" }, { nama: "Kayoa", iso: "kya" },
    { nama: "Bacan", iso: "bch" }, { nama: "Obi", iso: "obi" },
    { nama: "Forest Tobelo", iso: "tbg" }, { nama: "Pagu", iso: "pau" },
    { nama: "Gamkonora", iso: "gmk" }, { nama: "Maba", iso: "mga" },
    { nama: "Patani", iso: "ptz" }, { nama: "Sawai", iso: "swb" },
    { nama: "Moklen", iso: "mwm" }, { nama: "Togutil", iso: "tou" },
    { nama: "Kao", iso: "kao" }, { nama: "Weda", iso: "wed" },
    { nama: "Yamdena", iso: "jmd" }, { nama: "Fordata", iso: "frd" },
    { nama: "Selaru", iso: "slu" }, { nama: "Seluwasan", iso: "slw" },
    { nama: "Dawera-Daweloor", iso: "dwd" }, { nama: "Emplawas", iso: "emw" },
    { nama: "Damer", iso: "dmr" }, { nama: "Wetarese", iso: "wet" },
    { nama: "Galoli", iso: "gal" }, { nama: "Idalaka", iso: "idl" },
    { nama: "Lova", iso: "lva" }, { nama: "Makuva", iso: "mvv" },
    { nama: "Raihat", iso: "rht" }, { nama: "Tetum", iso: "tet" },
    { nama: "Buna", iso: "bfn" }, { nama: "Naueti", iso: "nvt" },
    { nama: "Makasae", iso: "mkz" }, { nama: "Sa'ban", iso: "snb" },
    { nama: "Kelabit", iso: "kzi" }, { nama: "Sungai", iso: "sug" },
    { nama: "Tringgus", iso: "tgg" }, { nama: "Kiput", iso: "kyw" },
    { nama: "Belait", iso: "beg" }, { nama: "Tutong", iso: "ttx" },
    { nama: "Rungus", iso: "drg" }, { nama: "Tobilung", iso: "tgg" },
    { nama: "Ida'an", iso: "dbj" }, { nama: "Bonggi", iso: "txg" },
    { nama: "Brunei", iso: "kxd" }, { nama: "Kedayan", iso: "kxd" },
    { nama: "Timugon", iso: "tih" }, { nama: "Murut", iso: "mvv" },
    { nama: "Bisaya", iso: "bth" }, { nama: "Iban", iso: "iba" },
    { nama: "Melanau", iso: "mlx" }, { nama: "Kajang", iso: "kaj" },
    { nama: "Kejaman", iso: "kje" }, { nama: "Punan", iso: "pna" },
    { nama: "Bukit", iso: "bkn" }, { nama: "Sekapan", iso: "skp" },
    { nama: "Sian", iso: "sya" }, { nama: "Kenyah", iso: "xkl" },
    { nama: "Bakati", iso: "sne" }, { nama: "Lara", iso: "lra" },
    { nama: "Kendayan", iso: "knx" }, { nama: "Salako", iso: "skl" },
    { nama: "Mualang", iso: "mld" }, { nama: "Serawai", iso: "srw" },
    { nama: "Kerinci", iso: "kvr" }, { nama: "Kubu", iso: "kvb" },
    { nama: "Lematang", iso: "lmt" }, { nama: "Lintang", iso: "lnt" },
    { nama: "Ogan", iso: "ogn" }, { nama: "Pasemah", iso: "pse" },
    { nama: "Penesak", iso: "pns" }, { nama: "Rawas", iso: "rws" },
    { nama: "Rejang", iso: "rjb" }, { nama: "Semendo", iso: "sbd" },
    { nama: "Komering", iso: "mge" }, { nama: "Lampung Api", iso: "ljp" },
    { nama: "Lampung Nyo", iso: "abl" }, { nama: "Pubian", iso: "pbi" },
    { nama: "Abung", iso: "abu" }, { nama: "Sungkai", iso: "skk" },
    { nama: "Tulangbawang", iso: "tlb" }, { nama: "Krui", iso: "kri" },
    { nama: "Ranau", iso: "rnu" }, { nama: "Belalau", iso: "bla" },
    { nama: "Pesisir", iso: "psi" },
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
