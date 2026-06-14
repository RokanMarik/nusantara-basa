-- Nusantara Basa - Enrichment Batch 2
-- Languages: Minangkabau, Madura, Bali, Aceh, Banjar
-- Date: 2025-06-14

-- ============================================================================
-- FITUR LINGUISTIK
-- ============================================================================

INSERT INTO fitur_linguistik (
  bahasa_id, sistem_tulisan, tipe_morfologi, urutan_kata,
  jumlah_vokal, jumlah_konsonan, memiliki_nada, memiliki_register,
  catatan_fonologi, dibuat_pada, diperbarui_pada
)
SELECT b.id,
  CASE b.nama_bahasa
    WHEN 'Minangkabau' THEN 'Latin, Jawi'
    WHEN 'Madura' THEN 'Latin, Carakan Madura'
    WHEN 'Bali' THEN 'Latin, Aksara Bali'
    WHEN 'Aceh' THEN 'Latin, Jawi'
    WHEN 'Banjar' THEN 'Latin, Jawi'
  END,
  CASE b.nama_bahasa
    WHEN 'Minangkabau' THEN 'aglutinatif'
    WHEN 'Madura' THEN 'aglutinatif'
    WHEN 'Bali' THEN 'aglutinatif'
    WHEN 'Aceh' THEN 'isolatif'
    WHEN 'Banjar' THEN 'aglutinatif'
  END,
  CASE b.nama_bahasa
    WHEN 'Aceh' THEN 'SVO'
    WHEN 'Bali' THEN 'SVO'
    ELSE 'SVO'
  END,
  CASE b.nama_bahasa
    WHEN 'Minangkabau' THEN 6
    WHEN 'Madura' THEN 6
    WHEN 'Bali' THEN 6
    WHEN 'Aceh' THEN 7
    WHEN 'Banjar' THEN 5
  END,
  CASE b.nama_bahasa
    WHEN 'Minangkabau' THEN 19
    WHEN 'Madura' THEN 19
    WHEN 'Bali' THEN 18
    WHEN 'Aceh' THEN 21
    WHEN 'Banjar' THEN 17
  END,
  FALSE,
  CASE b.nama_bahasa
    WHEN 'Bali' THEN TRUE
    ELSE FALSE
  END,
  CASE b.nama_bahasa
    WHEN 'Minangkabau' THEN 'Diftong /ai/, /au/ umum. Konsonan prenasalized.'
    WHEN 'Madura' THEN 'Memiliki glottal stop, konsonan retrofleks, vokal schwa /ə/.'
    WHEN 'Bali' THEN 'Memiliki sistem tingkatan bahasa (kasar, alus). Vokal panjang.'
    WHEN 'Aceh' THEN 'Sistem vokal kompleks dengan nasal dan vokal panjang. Konsonan glottal.'
    WHEN 'Banjar' THEN 'Mirip Melayu dengan pengaruh Jawa. Vokal /a/ dan /ə/ bergantian.'
  END,
  NOW(), NOW()
FROM bahasa b
WHERE b.nama_bahasa IN ('Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar')
ON CONFLICT (bahasa_id) DO UPDATE SET
  sistem_tulisan = EXCLUDED.sistem_tulisan,
  tipe_morfologi = EXCLUDED.tipe_morfologi,
  urutan_kata = EXCLUDED.urutan_kata,
  jumlah_vokal = EXCLUDED.jumlah_vokal,
  jumlah_konsonan = EXCLUDED.jumlah_konsonan,
  memiliki_register = EXCLUDED.memiliki_register,
  catatan_fonologi = EXCLUDED.catatan_fonologi,
  diperbarui_pada = NOW();

-- ============================================================================
-- AUTO SUMMARY
-- ============================================================================

UPDATE bahasa SET
  auto_summary = CASE nama_bahasa
    WHEN 'Minangkabau' THEN 'Bahasa Minangkabau adalah bahasa Austronesia yang dituturkan oleh sekitar 5,5 juta orang di Sumatera Barat. Masyarakat Minangkabau menganut sistem matrilineal dan terkenal dengan tradisi merantau. Bahasa ini memiliki banyak dialek dan dipengaruhi kuat oleh bahasa Melayu dan Arab melalui Islam.'
    WHEN 'Madura' THEN 'Bahasa Madura dituturkan oleh sekitar 14 juta orang, terutama di Pulau Madura dan pesisir utara Jawa Timur. Bahasa ini memiliki sistem fonologi unik dengan glottal stop dan konsonan retrofleks. Tradisi budaya termasuk kerapan sapi dan seni topeng dhalang.'
    WHEN 'Bali' THEN 'Bahasa Bali dituturkan oleh sekitar 3,3 juta orang di Pulau Bali dan sebagian Lombok. Bahasa ini memiliki sistem tingkatan bahasa (basa kasar, basa alus) yang erat kaitannya dengan kasta Hindu Bali. Aksara Bali masih digunakan dalam konteks religius dan budaya.'
    WHEN 'Aceh' THEN 'Bahasa Aceh dituturkan oleh sekitar 3,5 juta orang di Provinsi Aceh. Bahasa ini memiliki pengaruh kuat dari bahasa Arab dan Persia karena sejarah Kesultanan Aceh sebagai pusat penyebaran Islam. Sastra Aceh kaya akan hikayat dan syair keagamaan.'
    WHEN 'Banjar' THEN 'Bahasa Banjar dituturkan oleh sekitar 3,5 juta orang di Kalimantan Selatan dan tersebar ke Kalimantan Timur. Bahasa ini memiliki kemiripan kuat dengan bahasa Melayu dan Jawa karena sejarah migrasi. Tradisi budaya termasuk rumah panggung Banjar dan pasar terapung.'
    ELSE auto_summary
  END,
  diperbarui_pada = NOW()
WHERE nama_bahasa IN ('Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar');

-- ============================================================================
-- LOKASI
-- ============================================================================

INSERT INTO lokasi (bahasa_id, provinsi, kabupaten, kecamatan, tipe_wilayah, luas_km2, dibuat_pada)
SELECT b.id,
  CASE b.nama_bahasa
    WHEN 'Minangkabau' THEN 'Sumatera Barat'
    WHEN 'Madura' THEN 'Jawa Timur (Pulau Madura)'
    WHEN 'Bali' THEN 'Bali'
    WHEN 'Aceh' THEN 'Aceh'
    WHEN 'Banjar' THEN 'Kalimantan Selatan'
  END,
  NULL, NULL,
  CASE b.nama_bahasa
    WHEN 'Madura' THEN 'pulau'
    WHEN 'Bali' THEN 'pulau'
    ELSE 'daratan'
  END,
  CASE b.nama_bahasa
    WHEN 'Minangkabau' THEN 42000
    WHEN 'Madura' THEN 5000
    WHEN 'Bali' THEN 5600
    WHEN 'Aceh' THEN 57000
    WHEN 'Banjar' THEN 37000
  END,
  NOW()
FROM bahasa b
WHERE b.nama_bahasa IN ('Minangkabau', 'Madura', 'Bali', 'Aceh', 'Banjar')
AND NOT EXISTS (SELECT 1 FROM lokasi l WHERE l.bahasa_id = b.id AND l.provinsi IS NOT NULL);

-- ============================================================================
-- KOSAKATA (Swadesh List)
-- ============================================================================

-- MINANGKABAU
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, fonetik_ipa)
SELECT id, 'ciek', 'satu', '/ci.eʔ/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'duo', 'dua', '/du.o/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'tigo', 'tiga', '/ti.go/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'ampek', 'empat', '/am.peʔ/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'limo', 'lima', '/li.mo/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'anam', 'enam', '/a.nam/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'tujuah', 'tujuh', '/tu.dʒu.a/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'salapan', 'delapan', '/sa.la.pan/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'sambilan', 'sembilan', '/sam.bi.lan/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'sapuluah', 'sepuluh', '/sa.pu.lu.a/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'aia', 'air', '/a.i.a/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'api', 'api', '/a.pi/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'urang', 'orang', '/u.raŋ/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'rumah', 'rumah', '/ru.mah/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
UNION ALL SELECT id, 'makan', 'makan', '/ma.kan/' FROM bahasa WHERE nama_bahasa = 'Minangkabau'
ON CONFLICT DO NOTHING;

-- MADURA
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, fonetik_ipa)
SELECT id, 'settong', 'satu', '/sət.toŋ/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'dhua', 'dua', '/du.a/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'tello', 'tiga', '/təl.lo/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'empa', 'empat', '/əm.pa/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'lema', 'lima', '/le.ma/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'ennem', 'enam', '/ən.nəm/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'pèto', 'tujuh', '/pə.to/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'bâlu', 'delapan', '/bə.lu/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'sanga', 'sembilan', '/sa.ŋa/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'sapolo', 'sepuluh', '/sa.po.lo/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'aèng', 'air', '/a.əŋ/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'apoy', 'api', '/a.poy/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'orèng', 'orang', '/o.rəŋ/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'tombuk', 'rumah', '/tom.buʔ/' FROM bahasa WHERE nama_bahasa = 'Madura'
UNION ALL SELECT id, 'kakan', 'makan', '/ka.kan/' FROM bahasa WHERE nama_bahasa = 'Madura'
ON CONFLICT DO NOTHING;

-- BALI
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, fonetik_ipa)
SELECT id, 'besik', 'satu', '/be.siʔ/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'dua', 'dua', '/du.a/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'telu', 'tiga', '/tə.lu/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'papat', 'empat', '/pa.pat/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'lima', 'lima', '/li.ma/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'nem', 'enam', '/nəm/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'pitu', 'tujuh', '/pi.tu/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'kutus', 'delapan', '/ku.tus/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'sia', 'sembilan', '/si.a/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'dasa', 'sepuluh', '/da.sa/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'yeh', 'air', '/jeh/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'api', 'api', '/a.pi/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'janma', 'orang', '/dʒan.ma/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'jero', 'rumah', '/dʒe.ro/' FROM bahasa WHERE nama_bahasa = 'Bali'
UNION ALL SELECT id, 'ajeng', 'makan', '/a.dʒeŋ/' FROM bahasa WHERE nama_bahasa = 'Bali'
ON CONFLICT DO NOTHING;

-- ACEH
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, fonetik_ipa)
SELECT id, 'sa', 'satu', '/sa/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'duwa', 'dua', '/du.wa/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'lhee', 'tiga', '/lhe/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'peut', 'empat', '/pə.ut/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'limong', 'lima', '/li.moŋ/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'nam', 'enam', '/nam/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'tujoh', 'tujuh', '/tu.dʒo/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'lapan', 'delapan', '/la.pan/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'sikureueng', 'sembilan', '/si.ku.rə.u.eŋ/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'si ploh', 'sepuluh', '/si.plo/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'ie', 'air', '/i.e/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'apui', 'api', '/a.pu.i/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'ureuëng', 'orang', '/u.rə.u.əŋ/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'rumoh', 'rumah', '/ru.mo/' FROM bahasa WHERE nama_bahasa = 'Aceh'
UNION ALL SELECT id, 'pajoh', 'makan', '/pa.dʒo/' FROM bahasa WHERE nama_bahasa = 'Aceh'
ON CONFLICT DO NOTHING;

-- BANJAR
INSERT INTO kosakata (bahasa_id, kata, arti_indonesia, fonetik_ipa)
SELECT id, 'isa', 'satu', '/i.sa/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'dua', 'dua', '/du.a/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'tiga', 'tiga', '/ti.ga/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'ampat', 'empat', '/am.pat/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'lima', 'lima', '/li.ma/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'anam', 'enam', '/a.nam/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'pitu', 'tujuh', '/pi.tu/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'walu', 'delapan', '/wa.lu/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'sanga', 'sembilan', '/sa.ŋa/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'sapuluh', 'sepuluh', '/sa.pu.luh/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'banyu', 'air', '/ba.ɲu/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'api', 'api', '/a.pi/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'urang', 'orang', '/u.raŋ/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'umah', 'rumah', '/u.mah/' FROM bahasa WHERE nama_bahasa = 'Banjar'
UNION ALL SELECT id, 'makan', 'makan', '/ma.kan/' FROM bahasa WHERE nama_bahasa = 'Banjar'
ON CONFLICT DO NOTHING;
