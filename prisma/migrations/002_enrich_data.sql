-- ============================================
-- NUSANTARA BASA - Data Enrichment SQL
-- Run this in Supabase SQL Editor
-- ============================================

-- Phase 1: Add linguistic features for major languages
-- Insert or update fitur_linguistik table

INSERT INTO fitur_linguistik (bahasa_id, sistem_tulisan, tipe_morfologi, urutan_kata, jumlah_vokal, jumlah_konsonan, memiliki_nada, memiliki_register, catatan_fonologi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 'Latin, Hanacaraka'
    WHEN 'Sunda' THEN 'Latin'
    WHEN 'Madura' THEN 'Latin'
    WHEN 'Batak Toba' THEN 'Latin, Surat Batak'
    WHEN 'Minangkabau' THEN 'Latin, Jawi'
    WHEN 'Bugis' THEN 'Latin, Lontara'
    WHEN 'Makassar' THEN 'Latin, Lontara'
    WHEN 'Bali' THEN 'Latin, Aksara Bali'
    WHEN 'Aceh' THEN 'Latin, Jawi'
    WHEN 'Banjar' THEN 'Latin, Jawi'
    ELSE 'Latin'
  END,
  'aglutinatif',
  CASE b.nama_bahasa
    WHEN 'Batak Toba' THEN 'VSO'
    WHEN 'Toraja' THEN 'VSO'
    ELSE 'SVO'
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 6
    WHEN 'Sunda' THEN 6
    WHEN 'Batak Toba' THEN 6
    ELSE 5
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 20
    WHEN 'Sunda' THEN 18
    WHEN 'Batak Toba' THEN 20
    WHEN 'Madura' THEN 19
    ELSE 17
  END,
  FALSE,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN TRUE
    WHEN 'Bali' THEN TRUE
    WHEN 'Sunda' THEN TRUE
    ELSE FALSE
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 'Memiliki vokal schwa /ə/, sistem tingkatan bahasa (ngoko, krama)'
    WHEN 'Sunda' THEN 'Memiliki sistem undak-usuk (tingkatan bahasa)'
    WHEN 'Batak Toba' THEN 'Konsonan kompleks, prenasalized stops'
    WHEN 'Madura' THEN 'Memiliki glottal stop, konsonan retrofleks'
    WHEN 'Minangkabau' THEN 'Diftong /ai/, /oi/ umum'
    WHEN 'Bugis' THEN 'Sistem vokal 5, konsonan prenasalized'
    WHEN 'Bali' THEN 'Memiliki sistem tingkatan bahasa (kasar, alus)'
    ELSE 'Sistem fonologi standar Austronesia'
  END,
  NOW(),
  NOW()
FROM bahasa b
WHERE b.nama_bahasa IN ('Jawa', 'Sunda', 'Madura', 'Batak Toba', 'Minangkabau', 'Bugis', 'Makassar', 'Bali', 'Aceh', 'Banjar', 'Toraja', 'Sasak', 'Lampung', 'Rejang', 'Dayak')
ON CONFLICT (bahasa_id) DO UPDATE SET
  sistem_tulisan = EXCLUDED.sistem_tulisan,
  tipe_morfologi = EXCLUDED.tipe_morfologi,
  urutan_kata = EXCLUDED.urutan_kata,
  jumlah_vokal = EXCLUDED.jumlah_vokal,
  jumlah_konsonan = EXCLUDED.jumlah_konsonan,
  memiliki_nada = EXCLUDED.memiliki_nada,
  memiliki_register = EXCLUDED.memiliki_register,
  catatan_fonologi = EXCLUDED.catatan_fonologi,
  diperbarui_pada = NOW();

-- Phase 2: Add location data for languages
INSERT INTO lokasi (bahasa_id, provinsi, kabupaten, kecamatan, tipe_wilayah, luas_km2, dibuat_pada)
SELECT 
  b.id,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 'Jawa Tengah, Jawa Timur, DI Yogyakarta'
    WHEN 'Sunda' THEN 'Jawa Barat, Banten'
    WHEN 'Madura' THEN 'Jawa Timur (Pulau Madura)'
    WHEN 'Batak Toba' THEN 'Sumatera Utara'
    WHEN 'Minangkabau' THEN 'Sumatera Barat'
    WHEN 'Bugis' THEN 'Sulawesi Selatan'
    WHEN 'Makassar' THEN 'Sulawesi Selatan'
    WHEN 'Bali' THEN 'Bali'
    WHEN 'Aceh' THEN 'Aceh'
    WHEN 'Banjar' THEN 'Kalimantan Selatan'
    WHEN 'Toraja' THEN 'Sulawesi Selatan'
    WHEN 'Sasak' THEN 'Nusa Tenggara Barat'
    WHEN 'Lampung' THEN 'Lampung'
    WHEN 'Rejang' THEN 'Bengkulu'
    WHEN 'Dayak' THEN 'Kalimantan'
    WHEN 'Papua' THEN 'Papua'
    WHEN 'Ambon' THEN 'Maluku'
    WHEN 'Ternate' THEN 'Maluku Utara'
    WHEN 'Tidore' THEN 'Maluku Utara'
    WHEN 'Gorontalo' THEN 'Gorontalo'
    WHEN 'Mandar' THEN 'Sulawesi Barat'
    WHEN 'Sangihe' THEN 'Sulawesi Utara'
    WHEN 'Talaud' THEN 'Sulawesi Utara'
    WHEN 'Bima' THEN 'Nusa Tenggara Barat'
    WHEN 'Sumbawa' THEN 'Nusa Tenggara Barat'
    WHEN 'Manggarai' THEN 'Nusa Tenggara Timur'
    WHEN 'Sikka' THEN 'Nusa Tenggara Timur'
    WHEN 'Belu' THEN 'Nusa Tenggara Timur'
    WHEN 'Alor' THEN 'Nusa Tenggara Timur'
    WHEN 'Solor' THEN 'Nusa Tenggara Timur'
    ELSE NULL
  END,
  NULL,
  NULL,
  'pulau',
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 80000
    WHEN 'Sunda' THEN 35000
    WHEN 'Madura' THEN 5000
    WHEN 'Batak Toba' THEN 25000
    WHEN 'Minangkabau' THEN 42000
    WHEN 'Bugis' THEN 45000
    WHEN 'Bali' THEN 5600
    ELSE 10000
  END,
  NOW()
FROM bahasa b
WHERE b.nama_bahasa IN ('Jawa', 'Sunda', 'Madura', 'Batak Toba', 'Minangkabau', 'Bugis', 'Makassar', 'Bali', 'Aceh', 'Banjar', 'Toraja', 'Sasak', 'Lampung', 'Rejang', 'Dayak', 'Papua', 'Ambon', 'Ternate', 'Tidore', 'Gorontalo', 'Mandar', 'Sangihe', 'Talaud', 'Bima', 'Sumbawa', 'Manggarai', 'Sikka', 'Belu', 'Alor', 'Solor')
ON CONFLICT DO NOTHING;

-- Phase 3: Add preservation status
INSERT INTO status_preservasi (bahasa_id, status_unesco, tingkat_vitalitas, jumlah_penutur_aktif, tren_penutur, dokumentasi_lengkap, program_revitalisasi, dibuat_pada, diperbarui_pada)
SELECT 
  b.id,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 'aman'
    WHEN 'Sunda' THEN 'aman'
    WHEN 'Madura' THEN 'aman'
    WHEN 'Batak Toba' THEN 'aman'
    WHEN 'Minangkabau' THEN 'aman'
    WHEN 'Bugis' THEN 'aman'
    WHEN 'Makassar' THEN 'aman'
    WHEN 'Bali' THEN 'aman'
    WHEN 'Aceh' THEN 'aman'
    WHEN 'Banjar' THEN 'aman'
    ELSE 'rentan'
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 'stabil'
    WHEN 'Sunda' THEN 'stabil'
    WHEN 'Madura' THEN 'stabil'
    WHEN 'Batak Toba' THEN 'stabil'
    WHEN 'Minangkabau' THEN 'stabil'
    WHEN 'Bugis' THEN 'stabil'
    WHEN 'Makassar' THEN 'stabil'
    WHEN 'Bali' THEN 'stabil'
    WHEN 'Aceh' THEN 'stabil'
    WHEN 'Banjar' THEN 'stabil'
    ELSE 'menurun'
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 80000000
    WHEN 'Sunda' THEN 40000000
    WHEN 'Madura' THEN 14000000
    WHEN 'Batak Toba' THEN 2000000
    WHEN 'Minangkabau' THEN 6000000
    WHEN 'Bugis' THEN 5000000
    WHEN 'Makassar' THEN 2000000
    WHEN 'Bali' THEN 3000000
    WHEN 'Aceh' THEN 3500000
    WHEN 'Banjar' THEN 3500000
    ELSE 100000
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN 'stabil'
    WHEN 'Sunda' THEN 'stabil'
    WHEN 'Madura' THEN 'stabil'
    WHEN 'Batak Toba' THEN 'stabil'
    WHEN 'Minangkabau' THEN 'stabil'
    WHEN 'Bugis' THEN 'stabil'
    WHEN 'Makassar' THEN 'stabil'
    WHEN 'Bali' THEN 'stabil'
    WHEN 'Aceh' THEN 'stabil'
    WHEN 'Banjar' THEN 'stabil'
    ELSE 'menurun'
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN TRUE
    WHEN 'Sunda' THEN TRUE
    WHEN 'Madura' THEN TRUE
    WHEN 'Batak Toba' THEN TRUE
    WHEN 'Minangkabau' THEN TRUE
    WHEN 'Bugis' THEN TRUE
    WHEN 'Makassar' THEN TRUE
    WHEN 'Bali' THEN TRUE
    WHEN 'Aceh' THEN TRUE
    WHEN 'Banjar' THEN TRUE
    ELSE FALSE
  END,
  CASE b.nama_bahasa
    WHEN 'Jawa' THEN TRUE
    WHEN 'Sunda' THEN TRUE
    WHEN 'Madura' THEN TRUE
    WHEN 'Batak Toba' THEN TRUE
    WHEN 'Minangkabau' THEN TRUE
    WHEN 'Bugis' THEN TRUE
    WHEN 'Makassar' THEN TRUE
    WHEN 'Bali' THEN TRUE
    WHEN 'Aceh' THEN TRUE
    WHEN 'Banjar' THEN TRUE
    ELSE FALSE
  END,
  NOW(),
  NOW()
FROM bahasa b
WHERE b.nama_bahasa IN ('Jawa', 'Sunda', 'Madura', 'Batak Toba', 'Minangkabau', 'Bugis', 'Makassar', 'Bali', 'Aceh', 'Banjar', 'Toraja', 'Sasak', 'Lampung', 'Rejang', 'Dayak', 'Papua', 'Ambon', 'Ternate', 'Tidore', 'Gorontalo', 'Mandar', 'Sangihe', 'Talaud', 'Bima', 'Sumbawa', 'Manggarai', 'Sikka', 'Belu', 'Alor', 'Solor')
ON CONFLICT (bahasa_id) DO UPDATE SET
  status_unesco = EXCLUDED.status_unesco,
  tingkat_vitalitas = EXCLUDED.tingkat_vitalitas,
  jumlah_penutur_aktif = EXCLUDED.jumlah_penutur_aktif,
  tren_penutur = EXCLUDED.tren_penutur,
  dokumentasi_lengkap = EXCLUDED.dokumentasi_lengkap,
  program_revitalisasi = EXCLUDED.program_revitalisasi,
  diperbarui_pada = NOW();

-- Phase 4: Add auto-summary for major languages
UPDATE bahasa
SET auto_summary = CASE nama_bahasa
  WHEN 'Jawa' THEN 'Bahasa Jawa adalah bahasa Austronesia yang dituturkan oleh sekitar 80 juta orang, terutama di Jawa Tengah, Jawa Timur, dan DI Yogyakarta. Bahasa ini memiliki sistem tingkatan bahasa (ngoko, madya, krama) yang mencerminkan hierarki sosial. Jawa memiliki aksara tradisional Hanacaraka dan kaya akan sastra klasik seperti Serat Centhini dan Serat Wedhatama.'
  WHEN 'Sunda' THEN 'Bahasa Sunda adalah bahasa Austronesia yang dituturkan oleh sekitar 40 juta orang di Jawa Barat dan Banten. Bahasa ini memiliki sistem undak-usuk (tingkatan bahasa) yang mirip dengan Jawa. Sunda memiliki tradisi sastra yang kaya, termasuk pantun Sunda dan cerita pantun.'
  WHEN 'Madura' THEN 'Bahasa Madura dituturkan oleh sekitar 14 juta orang, terutama di Pulau Madura dan sebagian Jawa Timur. Bahasa ini memiliki sistem fonologi yang unik dengan glottal stop dan konsonan retrofleks. Madura memiliki tradisi lisan yang kuat termasuk carok dan kerapan sapi.'
  WHEN 'Batak Toba' THEN 'Bahasa Batak Toba adalah bahasa Austronesia yang dituturkan oleh sekitar 2 juta orang di Sumatera Utara, khususnya di sekitar Danau Toba. Bahasa ini memiliki aksara tradisional Surat Batak dan kaya akan tradisi adat dan marga.'
  WHEN 'Minangkabau' THEN 'Bahasa Minangkabau dituturkan oleh sekitar 6 juta orang di Sumatera Barat. Masyarakat Minangkabau menganut sistem matrilineal, dan bahasa mereka memiliki banyak dialek. Minangkabau terkenal dengan tradisi merantau dan kuliner rendang.'
  WHEN 'Bugis' THEN 'Bahasa Bugis dituturkan oleh sekitar 5 juta orang di Sulawesi Selatan. Bahasa ini memiliki aksara tradisional Lontara dan masyarakat Bugis terkenal sebagai pelaut ulung dengan perahu pinisi.'
  WHEN 'Makassar' THEN 'Bahasa Makassar dituturkan oleh sekitar 2 juta orang di Sulawesi Selatan, khususnya di kota Makassar. Bahasa ini juga menggunakan aksara Lontara dan memiliki tradisi maritim yang kuat.'
  WHEN 'Bali' THEN 'Bahasa Bali dituturkan oleh sekitar 3 juta orang di Pulau Bali. Bahasa ini memiliki sistem tingkatan (kasar, alus) dan erat kaitannya dengan agama Hindu Bali. Bali memiliki aksara tradisional Aksara Bali.'
  WHEN 'Aceh' THEN 'Bahasa Aceh dituturkan oleh sekitar 3,5 juta orang di Provinsi Aceh. Bahasa ini memiliki pengaruh kuat dari bahasa Arab dan Melayu karena sejarah Islam dan perdagangan. Aceh memiliki tradisi sastra yang kaya termasuk hikayat.'
  WHEN 'Banjar' THEN 'Bahasa Banjar dituturkan oleh sekitar 3,5 juta orang di Kalimantan Selatan. Bahasa ini memiliki kemiripan dengan bahasa Melayu dan Jawa. Masyarakat Banjar terkenal dengan tradisi rumah panggung dan pasar terapung.'
  ELSE auto_summary
END,
diperbarui_pada = NOW()
WHERE nama_bahasa IN ('Jawa', 'Sunda', 'Madura', 'Batak Toba', 'Minangkabau', 'Bugis', 'Makassar', 'Bali', 'Aceh', 'Banjar');

-- Summary output
SELECT '✅ Data enrichment complete!' as status,
       (SELECT COUNT(*) FROM fitur_linguistik) as fitur_count,
       (SELECT COUNT(*) FROM lokasi) as lokasi_count,
       (SELECT COUNT(*) FROM status_preservasi) as status_count,
       (SELECT COUNT(*) FROM bahasa WHERE auto_summary IS NOT NULL) as summary_count;
