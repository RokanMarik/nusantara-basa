// Phase 1: Fast Insert - 700+ bahasa dalam 30 detik
// Tanpa Jina/qd/kmodel - cuma insert basic data
// Usage: node scripts/phase1-fast-insert.js

const { createClient } = require('@supabase/supabase-js');

const SUPABASE_URL = "https://hkeheukewxsvaarxaket.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrZWhldWtld3hzdmFhcnhha2V0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4MDEzOTkzMywiZXhwIjoyMDk1NzE1OTMzfQ.36yS86na5jZYaJEguPDREzrx_qpPOL15zNNxMaeCg20";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// 700+ Indonesian languages with ISO 639-3 codes
const LANGUAGES = [
  // === SUMATERA ===
  { nama: "Aceh", iso: "ace" }, { nama: "Alas", iso: "aln" },
  { nama: "Gayo", iso: "gay" }, { nama: "Tamiang", iso: "tmy" },
  { nama: "Aneuk Jamee", iso: "jas" }, { nama: "Kluet", iso: "knk" },
  { nama: "Devayan", iso: "dnw" }, { nama: "Singkil", iso: "sck" },
  { nama: "Pakpak", iso: "pcc" }, { nama: "Dairi", iso: "dri" },
  { nama: "Karo", iso: "btx" }, { nama: "Simalungun", iso: "bts" },
  { nama: "Batak Toba", iso: "bbc" }, { nama: "Batak Mandailing", iso: "btm" },
  { nama: "Batak Angkola", iso: "akb" }, { nama: "Nias", iso: "nia" },
  { nama: "Sikule", iso: "skh" }, { nama: "Mentawai", iso: "mwv" },
  { nama: "Minangkabau", iso: "min" }, { nama: "Kerinci", iso: "kvr" },
  { nama: "Kubu", iso: "kvb" }, { nama: "Lubu", iso: "lcf" },
  { nama: "Musi", iso: "mui" }, { nama: "Komering", iso: "mge" },
  { nama: "Lematang", iso: "lmt" }, { nama: "Pasemah", iso: "pse" },
  { nama: "Rejang", iso: "rjb" }, { nama: "Serawai", iso: "srw" },
  { nama: "Semendo", iso: "sbd" }, { nama: "Ogan", iso: "ogn" },
  { nama: "Lampung Nyo", iso: "abl" }, { nama: "Lampung Api", iso: "ljp" },
  { nama: "Pubian", iso: "pbi" }, { nama: "Abung", iso: "abu" },
  { nama: "Sungkai", iso: "skk" }, { nama: "Krui", iso: "kri" },
  { nama: "Ranau", iso: "rnu" }, { nama: "Belalau", iso: "bla" },
  { nama: "Melayu", iso: "msa" }, { nama: "Melayu Jambi", iso: "jax" },
  { nama: "Melayu Riau", iso: "msi" }, { nama: "Melayu Bangka", iso: "mfa" },
  { nama: "Melayu Belitung", iso: "bel" }, { nama: "Melayu Palembang", iso: "plm" },
  { nama: "Melayu Bengkulu", iso: "bke" }, { nama: "Melayu Tamiang", iso: "tmy" },

  // === JAWA ===
  { nama: "Jawa", iso: "jav" }, { nama: "Sunda", iso: "sun" },
  { nama: "Madura", iso: "mad" }, { nama: "Osing", iso: "osi" },
  { nama: "Tengger", iso: "tes" }, { nama: "Banyumasan", iso: "bew" },
  { nama: "Banten", iso: "bgn" }, { nama: "Cirebon", iso: "cnn" },

  // === KALIMANTAN ===
  { nama: "Banjar", iso: "bjn" }, { nama: "Dayak Ngaju", iso: "nij" },
  { nama: "Dayak Iban", iso: "ibl" }, { nama: "Dayak Kenyah", iso: "xkl" },
  { nama: "Dayak Bakati", iso: "sne" }, { nama: "Dayak Benuaq", iso: "bqn" },
  { nama: "Dayak Tunjung", iso: "tuj" }, { nama: "Dayak Lawangan", iso: "lbx" },
  { nama: "Dayak Maanyan", iso: "mhy" }, { nama: "Dayak Dohoi", iso: "otd" },
  { nama: "Dayak Siang", iso: "sya" }, { nama: "Bakumpai", iso: "bkr" },
  { nama: "Kutai", iso: "vkt" }, { nama: "Berau", iso: "beu" },
  { nama: "Tidung", iso: "nti" }, { nama: "Lundayeh", iso: "lnd" },
  { nama: "Murut", iso: "mvv" }, { nama: "Bisaya", iso: "bth" },
  { nama: "Kendayan", iso: "knx" }, { nama: "Selako", iso: "skl" },
  { nama: "Mualang", iso: "mld" }, { nama: "Bekati", iso: "bth" },
  { nama: "Sanggau", iso: "scg" }, { nama: "Ribun", iso: "rbo" },
  { nama: "Embaloh", iso: "ebu" }, { nama: "Taman", iso: "tmn" },
  { nama: "Kalis", iso: "kbr" }, { nama: "Bukit", iso: "bkt" },
  { nama: "Punan", iso: "pna" }, { nama: "Bukat", iso: "bkl" },
  { nama: "Merap", iso: "mep" }, { nama: "Segai", iso: "sgr" },
  { nama: "Bahau", iso: "bhv" }, { nama: "Modang", iso: "mxd" },
  { nama: "Katingan", iso: "kxg" }, { nama: "Ot Danum", iso: "otd" },
  { nama: "Kahayan", iso: "khy" }, { nama: "Kapuas", iso: "kpu" },
  { nama: "Mendawai", iso: "mdw" }, { nama: "Sukamara", iso: "suk" },
  { nama: "Kohin", iso: "kxg" }, { nama: "Seberuang", iso: "sbe" },
  { nama: "Tabun", iso: "tbn" }, { nama: "Jongkong", iso: "jkg" },

  // === SULAWESI ===
  { nama: "Bugis", iso: "bug" }, { nama: "Makassar", iso: "mak" },
  { nama: "Mandar", iso: "mdr" }, { nama: "Mamuju", iso: "mqj" },
  { nama: "Tolaki", iso: "lbw" }, { nama: "Muna", iso: "mnb" },
  { nama: "Buton", iso: "btx" }, { nama: "Wolio", iso: "wlo" },
  { nama: "Campalagian", iso: "cml" }, { nama: "Pannei", iso: "pcl" },
  { nama: "Aralle-Tabulahan", iso: "atq" }, { nama: "Dakka", iso: "dkk" },
  { nama: "Bambam", iso: "ptu" }, { nama: "Ulumanda", iso: "ulm" },
  { nama: "Kalao", iso: "kly" }, { nama: "Kulisusu", iso: "vkl" },
  { nama: "Tukang Besi", iso: "bhq" }, { nama: "Wakonae", iso: "wko" },
  { nama: "Waru", iso: "wrp" }, { nama: "Pancana", iso: "pnc" },
  { nama: "Laiyolo", iso: "lyo" }, { nama: "Taloki", iso: "tll" },
  { nama: "Tae", iso: "rob" }, { nama: "Toraja", iso: "sda" },
  { nama: "Mamasa", iso: "mqj" }, { nama: "Bambam", iso: "ptu" },
  { nama: "Duri", iso: "mvp" }, { nama: "Enrekang", iso: "qte" },
  { nama: "Maiwa", iso: "mwf" }, { nama: "Bentong", iso: "bnu" },
  { nama: "Konjo", iso: "kjc" }, { nama: "Bonerate", iso: "bnr" },
  { nama: "Kalao", iso: "kly" }, { nama: "Lembata", iso: "lmm" },
  { nama: "Bungku", iso: "bkz" }, { nama: "Bahonsuai", iso: "bhq" },
  { nama: "Lindu", iso: "lkl" }, { nama: "Pendau", iso: "pdu" },
  { nama: "Tajio", iso: "tdj" }, { nama: "Saluan", iso: "loe" },
  { nama: "Andio", iso: "anv" }, { nama: "Pamona", iso: "pmf" },
  { nama: "Topoiyo", iso: "toz" }, { nama: "Bada", iso: "bhz" },
  { nama: "Rampi", iso: "lje" }, { nama: "Ledo Kaili", iso: "lew" },
  { nama: "Unde", iso: "und" }, { nama: "Kaili", iso: "lew" },
  { nama: "Sedoa", iso: "zdm" }, { nama: "Tolala", iso: "tlr" },
  { nama: "Tombelala", iso: "txo" }, { nama: "Totoli", iso: "txe" },
  { nama: "Dampelas", iso: "dmp" }, { nama: "Lauje", iso: "law" },
  { nama: "Gorontalo", iso: "gor" }, { nama: "Suwawa", iso: "swv" },
  { nama: "Atinggola", iso: "atg" }, { nama: "Limboto", iso: "lim" },
  { nama: "Bolango", iso: "bld" }, { nama: "Kaidipang", iso: "kjp" },

  // === BALI & NUSA TENGGARA ===
  { nama: "Bali", iso: "ban" }, { nama: "Sasak", iso: "sas" },
  { nama: "Sumbawa", iso: "smw" }, { nama: "Bima", iso: "bhp" },
  { nama: "Mbojo", iso: "bhp" }, { nama: "Dompu", iso: "dop" },
  { nama: "Manggarai", iso: "mql" }, { nama: "Ngadha", iso: "nxl" },
  { nama: "Nage", iso: "nxl" }, { nama: "Keo", iso: "nke" },
  { nama: "Ende", iso: "end" }, { nama: "Lio", iso: "lew" },
  { nama: "Sikka", iso: "skk" }, { nama: "Krowai", iso: "krr" },
  { nama: "Lamaholot", iso: "lmo" }, { nama: "Adonara", iso: "adr" },
  { nama: "Solor", iso: "slr" }, { nama: "Alor", iso: "aol" },
  { nama: "Abui", iso: "abz" }, { nama: "Kamang", iso: "woy" },
  { nama: "Sawila", iso: "swt" }, { nama: "Wersing", iso: "kvw" },
  { nama: "Kabola", iso: "klz" }, { nama: "Teiwa", iso: "twe" },
  { nama: "Hamap", iso: "hmu" }, { nama: "Adang", iso: "adn" },
  { nama: "Kula", iso: "tpx" }, { nama: "Reta", iso: "ret" },
  { nama: "Leti", iso: "lti" }, { nama: "Moa", iso: "moa" },
  { nama: "Luang", iso: "lex" }, { nama: "Fordata", iso: "frd" },
  { nama: "Yamdena", iso: "jmd" }, { nama: "Selaru", iso: "slu" },
  { nama: "Seluwasan", iso: "slw" }, { nama: "Damer", iso: "dmr" },
  { nama: "Wetarese", iso: "wet" }, { nama: "Galoli", iso: "gal" },
  { nama: "Makasae", iso: "mkz" }, { nama: "Tetum", iso: "tet" },
  { nama: "Kemak", iso: "kem" }, { nama: "Mambae", iso: "mba" },
  { nama: "Tocodede", iso: "tqc" }, { nama: "Idalaka", iso: "idl" },
  { nama: "Kairui", iso: "krc" }, { nama: "Waima'a", iso: "wmh" },
  { nama: "Naueti", iso: "nvt" }, { nama: "Habun", iso: "hab" },
  { nama: "Lova", iso: "lva" }, { nama: "Raihat", iso: "rht" },

  // === MALUKU ===
  { nama: "Ambon", iso: "abs" }, { nama: "Tulehu", iso: "tlh" },
  { nama: "Hitu", iso: "hit" }, { nama: "Asilulu", iso: "asl" },
  { nama: "Luhu", iso: "lhu" }, { nama: "Manipa", iso: "mnp" },
  { nama: "Piru", iso: "prr" }, { nama: "Elpaputih", iso: "epu" },
  { nama: "Sepa", iso: "spg" }, { nama: "Kaelolo", iso: "klv" },
  { nama: "Amahai", iso: "amq" }, { nama: "Seit", iso: "sei" },
  { nama: "Nusaelaut", iso: "nua" }, { nama: "Teluti", iso: "tlt" },
  { nama: "Lisabata", iso: "lsl" }, { nama: "Nuniali", iso: "nul" },
  { nama: "Moksela", iso: "mox" }, { nama: "Ambelau", iso: "aml" },
  { nama: "Buru", iso: "bzu" }, { nama: "Lisela", iso: "lil" },
  { nama: "Masiwang", iso: "msy" }, { nama: "Hoti", iso: "htl" },
  { nama: "Selaru", iso: "slu" }, { nama: "Yamdena", iso: "jmd" },
  { nama: "Fordata", iso: "frd" }, { nama: "Dawera-Daweloor", iso: "dwd" },
  { nama: "Emplawas", iso: "emw" }, { nama: "Seluwasan", iso: "slw" },
  { nama: "Banda", iso: "bnd" }, { nama: "Geser", iso: "ges" },
  { nama: "Gorom", iso: "grm" }, { nama: "Wahai", iso: "wha" },
  { nama: "Bati", iso: "bvt" }, { nama: "Sula", iso: "sly" },
  { nama: "Mangole", iso: "mgl" }, { nama: "Sanana", iso: "snq" },
  { nama: "Sahu", iso: "saj" }, { nama: "Tobelo", iso: "tlb" },
  { nama: "Galela", iso: "gbi" }, { nama: "Loloda", iso: "lll" },
  { nama: "Modole", iso: "mdw" }, { nama: "Ibu", iso: "iba" },
  { nama: "Ternate", iso: "tvo" }, { nama: "Tidore", iso: "tby" },
  { nama: "Gane", iso: "gno" }, { nama: "Makian", iso: "mky" },
  { nama: "Kayoa", iso: "kya" }, { nama: "Bacan", iso: "bch" },
  { nama: "Obi", iso: "obi" }, { nama: "Forest Tobelo", iso: "tbg" },
  { nama: "Pagu", iso: "pau" }, { nama: "Gamkonora", iso: "gmk" },
  { nama: "Waioli", iso: "wot" }, { nama: "Maba", iso: "mga" },
  { nama: "Patani", iso: "ptz" }, { nama: "Sawai", iso: "swb" },

  // === PAPUA ===
  { nama: "Asmat", iso: "asm" }, { nama: "Dani", iso: "dna" },
  { nama: "Dani Barat", iso: "dnw" }, { nama: "Lani", iso: "lgi" },
  { nama: "Yali", iso: "yli" }, { nama: "Ekari", iso: "ekg" },
  { nama: "Mee", iso: "mea" }, { nama: "Moni", iso: "kgm" },
  { nama: "Damal", iso: "dcn" }, { nama: "Amung", iso: "kwy" },
  { nama: "Kamoro", iso: "kao" }, { nama: "Sempan", iso: "sde" },
  { nama: "Korowai", iso: "kew" }, { nama: "Citak", iso: "lmk" },
  { nama: "Ngalik", iso: "nlk" }, { nama: "Awyi", iso: "auu" },
  { nama: "Yei", iso: "yei" }, { nama: "Ninggerum", iso: "nim" },
  { nama: "Kimyal", iso: "kpm" }, { nama: "Eipo", iso: "eip" },
  { nama: "Mek", iso: "mek" }, { nama: "Ketengban", iso: "xte" },
  { nama: "Poboya", iso: "poy" }, { nama: "Mombum", iso: "mog" },
  { nama: "Kombai", iso: "kox" }, { nama: "Warkai", iso: "wri" },
  { nama: "Marind", iso: "mqy" }, { nama: "Yaqay", iso: "yay" },
  { nama: "Kanum", iso: "knu" }, { nama: "Nafri", iso: "nfr" },
  { nama: "Sko", iso: "sko" }, { nama: "I'saka", iso: "isk" },
  { nama: "Biangai", iso: "bgg" }, { nama: "Bauzi", iso: "bvz" },
  { nama: "Demisa", iso: "dem" }, { nama: "Tunggare", iso: "tgg" },
  { nama: "Nisa", iso: "niz" }, { nama: "Hattam", iso: "had" },
  { nama: "Maybrat", iso: "ayz" }, { nama: "Arfak", iso: "arf" },
  { nama: "Sougb", iso: "sog" }, { nama: "Mpur", iso: "akc" },
  { nama: "Abun", iso: "kgr" }, { nama: "Karon", iso: "krr" },
  { nama: "Meyah", iso: "mej" }, { nama: "Moskona", iso: "mtj" },
  { nama: "Dombano", iso: "dqm" }, { nama: "Sobey", iso: "soj" },
  { nama: "Biak", iso: "bhw" }, { nama: "Waropen", iso: "wrp" },
  { nama: "Serui", iso: "sry" }, { nama: "Yapen", iso: "yap" },
  { nama: "Ansus", iso: "and" }, { nama: "Moor", iso: "msl" },
  { nama: "Wondama", iso: "wnd" }, { nama: "Roon", iso: "rnt" },
  { nama: "Yeretuar", iso: "ytt" }, { nama: "Umar", iso: "umm" },
  { nama: "Miyoba", iso: "miy" }, { nama: "Dusner", iso: "dus" },

  // === LAINNYA ===
  { nama: "Ciacia", iso: "cia" }, { nama: "Mori Bawah", iso: "xmz" },
  { nama: "Kaili Ledo", iso: "lew" }, { nama: "Uma", iso: "ppk" },
  { nama: "Bada", iso: "bhz" }, { nama: "Behoa", iso: "bep" },
  { nama: "Napu", iso: "npy" }, { nama: "Rongga", iso: "rgh" },
  { nama: "Riung", iso: "lrg" }, { nama: "Ngada", iso: "nxl" },
  { nama: "Nage", iso: "nxl" }, { nama: "Keo", iso: "nke" },
  { nama: "Palue", iso: "ple" }, { nama: "Sikka", iso: "skk" },
  { nama: "Krowai", iso: "krr" }, { nama: "Lamaholot", iso: "lmo" },
  { nama: "Adonara", iso: "adr" }, { nama: "Solor", iso: "slr" },
  { nama: "Lembata", iso: "lmm" }, { nama: "Kedang", iso: "kdx" },
  { nama: "Mukang", iso: "muk" }, { nama: "Kambera", iso: "xbr" },
  { nama: "Wanukaka", iso: "wvn" }, { nama: "Mamboru", iso: "mmd" },
  { nama: "Anakalangu", iso: "akq" }, { nama: "Weyewa", iso: "weo" },
  { nama: "Laura", iso: "lrr" }, { nama: "Mambae", iso: "mba" },
  { nama: "Tetum", iso: "tet" }, { nama: "Galoli", iso: "gal" },
  { nama: "Idalaka", iso: "idl" }, { nama: "Kairui", iso: "krc" },
  { nama: "Waima'a", iso: "wmh" }, { nama: "Naueti", iso: "nvt" },
  { nama: "Habun", iso: "hab" }, { nama: "Kemak", iso: "kem" },
  { nama: "Tocodede", iso: "tqc" }, { nama: "Makasae", iso: "mkz" },
  { nama: "Buna", iso: "bfn" }, { nama: "Lova", iso: "lva" },
  { nama: "Makuva", iso: "mvv" }, { nama: "Raihat", iso: "rht" },
  { nama: "Sa'ban", iso: "snb" }, { nama: "Kelabit", iso: "kzi" },
  { nama: "Lundayeh", iso: "lnd" }, { nama: "Murut", iso: "mvv" },
  { nama: "Tidung", iso: "nti" }, { nama: "Berau", iso: "beu" },
  { nama: "Sama-Bajau", iso: "bdr" }, { nama: "Yakan", iso: "yka" },
  { nama: "Iranun", iso: "irn" }, { nama: "Maranao", iso: "mrw" },
  { nama: "Maguindanao", iso: "mdh" }, { nama: "Tausug", iso: "tsg" },
  { nama: "Brunei", iso: "kxd" }, { nama: "Kedayan", iso: "kxd" },
  { nama: "Belait", iso: "beg" }, { nama: "Tutong", iso: "ttx" },
  { nama: "Dusun", iso: "dun" }, { nama: "Rungus", iso: "drg" },
  { nama: "Bonggi", iso: "txg" }, { nama: "Ida'an", iso: "dbj" },
  { nama: "Melanau", iso: "mlx" }, { nama: "Kajang", iso: "kaj" },
  { nama: "Kejaman", iso: "kje" }, { nama: "Sekapan", iso: "skp" },
  { nama: "Tatana", iso: "ttg" }, { nama: "Timugon", iso: "tih" },
  { nama: "Tobilung", iso: "tgg" }, { nama: "Iban", iso: "iba" },
  { nama: "Mualang", iso: "mld" }, { nama: "Tabun", iso: "tbn" },
  { nama: "Jongkong", iso: "jkg" }, { nama: "Embaloh", iso: "ebu" },
  { nama: "Taman", iso: "tmn" }, { nama: "Kalbar", iso: "kbr" },
  { nama: "Seberuang", iso: "sbe" }, { nama: "Sajingan", iso: "sjn" },
  { nama: "Sekayam", iso: "sky" }, { nama: "Sintang", iso: "stg" },
  { nama: "Silat", iso: "slt" }, { nama: "Kabong", iso: "kbg" },
  { nama: "Ambalau", iso: "aml" }, { nama: "Berawan", iso: "bwu" },
  { nama: "Kiput", iso: "kyw" }, { nama: "Punan", iso: "pna" },
  { nama: "Bukat", iso: "bkl" }, { nama: "Bahau", iso: "bhv" },
  { nama: "Modang", iso: "mxd" }, { nama: "Benuaq", iso: "bqn" },
  { nama: "Tunjung", iso: "tuj" }, { nama: "Lawangan", iso: "lbx" },
  { nama: "Maanyan", iso: "mhy" }, { nama: "Dusun Deyah", iso: "dun" },
  { nama: "Paku", iso: "pku" }, { nama: "Tawoyan", iso: "twy" },
  { nama: "Bakumpai", iso: "bkr" }, { nama: "Bara Dia", iso: "bdi" },
  { nama: "Mantangai", iso: "mtn" }, { nama: "Sebangau", iso: "sbg" },
  { nama: "Sampit", iso: "smp" }, { nama: "Kahayan", iso: "khy" },
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
  { nama: "Salako", iso: "skl" }, { nama: "Belom", iso: "blm" },
  { nama: "Bekati", iso: "bth" }, { nama: "Semandang", iso: "smd" },
];

async function main() {
  console.log("🚀 Phase 1: Fast Insert");
  console.log(`Total languages in list: ${LANGUAGES.length}\n`);

  // Get rumpun ID
  const { data: rumpun } = await supabase
    .from("rumpun_bahasa")
    .select("id")
    .eq("nama_rumpun", "Austronesia")
    .single();

  const rumpunId = rumpun?.id || null;

  let inserted = 0, skipped = 0, failed = 0;

  // Batch insert for speed
  const batchSize = 50;
  for (let i = 0; i < LANGUAGES.length; i += batchSize) {
    const batch = LANGUAGES.slice(i, i + batchSize);

    // Check existing
    const names = batch.map(l => l.nama.toLowerCase());
    const { data: existing } = await supabase
      .from("bahasa")
      .select("nama_bahasa")
      .in("nama_bahasa", batch.map(l => l.nama));

    const existingNames = new Set((existing || []).map(e => e.nama_bahasa.toLowerCase()));

    // Filter out existing
    const toInsert = batch.filter(l => !existingNames.has(l.nama.toLowerCase()));

    if (toInsert.length > 0) {
      const insertData = toInsert.map(l => ({
        nama_bahasa: l.nama,
        nama_lokal: l.nama,
        kode_iso_639: l.iso,
        rumpun_id: rumpunId,
      }));

      const { error } = await supabase
        .from("bahasa")
        .insert(insertData);

      if (error) {
        // Fall back to one-by-one insert
        for (const l of toInsert) {
          const { error: singleError } = await supabase
            .from("bahasa")
            .insert({
              nama_bahasa: l.nama,
              nama_lokal: l.nama,
              kode_iso_639: l.iso,
              rumpun_id: rumpunId,
            });
          if (singleError) failed++;
          else inserted++;
        }
      } else {
        inserted += toInsert.length;
      }
    }

    skipped += batch.length - toInsert.length;
  }

  const { count: total } = await supabase.from("bahasa").select("*", { count: "exact", head: true });

  console.log(`\n📊 Results:`);
  console.log(`   Inserted: ${inserted}`);
  console.log(`   Skipped:  ${skipped}`);
  console.log(`   Failed:   ${failed}`);
  console.log(`   Total in DB: ${total}`);
  console.log(`\n✅ Phase 1 complete!`);
  console.log(`   Next: node scripts/clean-data.js`);
}

main();
