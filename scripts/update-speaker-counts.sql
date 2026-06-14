-- Update Speaker Counts from Public Sources
-- Based on Ethnologue 2024, BPS Sensus 2020, and academic sources

-- ========== MAJOR LANGUAGES (> 1M speakers) ==========

-- Javanese: 85+ million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 85000000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Jawa' AND (jumlah_penutur IS NULL OR jumlah_penutur < 85000000);

-- Sundanese: 42 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 42000000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Sunda' AND (jumlah_penutur IS NULL OR jumlah_penutur < 42000000);

-- Madurese: 13.6 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 13600000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Madura' AND (jumlah_penutur IS NULL OR jumlah_penutur < 13600000);

-- Minangkabau: 5.5 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 5500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Minangkabau' AND (jumlah_penutur IS NULL OR jumlah_penutur < 5500000);

-- Buginese: 5 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 5000000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Bugis' AND (jumlah_penutur IS NULL OR jumlah_penutur < 5000000);

-- Balinese: 3.3 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 3300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Bali' AND (jumlah_penutur IS NULL OR jumlah_penutur < 3300000);

-- Acehnese: 3.5 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 3500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Aceh' AND (jumlah_penutur IS NULL OR jumlah_penutur < 3500000);

-- Banjarese: 3.5 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 3500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Banjar' AND (jumlah_penutur IS NULL OR jumlah_penutur < 3500000);

-- Betawi: 2.7 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 2700000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Betawi' AND (jumlah_penutur IS NULL OR jumlah_penutur < 2700000);

-- Sasak: 2.1 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 2100000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Sasak' AND (jumlah_penutur IS NULL OR jumlah_penutur < 2100000);

-- Makassar: 2.1 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 2100000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Makassar' AND (jumlah_penutur IS NULL OR jumlah_penutur < 2100000);

-- Batak Toba: 2 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 2000000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Batak Toba' AND (jumlah_penutur IS NULL OR jumlah_penutur < 2000000);

-- Malay (Indonesian): 77 million (BPS 2020)
UPDATE bahasa SET jumlah_penutur = 77000000, jumlah_penutur_tahun = 2020, sumber_referensi = 'BPS Sensus 2020' 
WHERE nama_bahasa = 'Melayu' AND (jumlah_penutur IS NULL OR jumlah_penutur < 77000000);

-- ========== LARGE LANGUAGES (500K - 1M speakers) ==========

-- Lampung: 1.5 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 1500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Lampung' AND (jumlah_penutur IS NULL OR jumlah_penutur < 1500000);

-- Toraja: 1 million (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 1000000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Toraja' AND (jumlah_penutur IS NULL OR jumlah_penutur < 1000000);

-- Dayak Ngaju: 900K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 900000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Dayak Ngaju' AND (jumlah_penutur IS NULL OR jumlah_penutur < 900000);

-- Mandar: 500K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Mandar' AND (jumlah_penutur IS NULL OR jumlah_penutur < 500000);

-- Batak Karo: 600K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 600000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Batak Karo' AND (jumlah_penutur IS NULL OR jumlah_penutur < 600000);

-- Batak Simalungun: 500K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Batak Simalungun' AND (jumlah_penutur IS NULL OR jumlah_penutur < 500000);

-- Gorontalo: 900K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 900000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Gorontalo' AND (jumlah_penutur IS NULL OR jumlah_penutur < 900000);

-- Minahasa: 500K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Minahasa' AND (jumlah_penutur IS NULL OR jumlah_penutur < 500000);

-- Mongondow: 700K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 700000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Mongondow' AND (jumlah_penutur IS NULL OR jumlah_penutur < 700000);

-- ========== MEDIUM LANGUAGES (100K - 500K speakers) ==========

-- Dayak Iban: 400K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 400000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Dayak Iban' AND (jumlah_penutur IS NULL OR jumlah_penutur < 400000);

-- Dayak Maanyan: 150K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 150000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Dayak Maanyan' AND (jumlah_penutur IS NULL OR jumlah_penutur < 150000);

-- Kutai: 300K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Kutai' AND (jumlah_penutur IS NULL OR jumlah_penutur < 300000);

-- Tolaki: 300K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Tolaki' AND (jumlah_penutur IS NULL OR jumlah_penutur < 300000);

-- Kaili: 250K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 250000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Kaili' AND (jumlah_penutur IS NULL OR jumlah_penutur < 250000);

-- Pamona: 200K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 200000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Pamona' AND (jumlah_penutur IS NULL OR jumlah_penutur < 200000);

-- Muna: 200K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 200000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Muna' AND (jumlah_penutur IS NULL OR jumlah_penutur < 200000);

-- Buton: 150K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 150000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Buton' AND (jumlah_penutur IS NULL OR jumlah_penutur < 150000);

-- Sangihe: 200K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 200000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Sangihe' AND (jumlah_penutur IS NULL OR jumlah_penutur < 200000);

-- Talaud: 100K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 100000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Talaud' AND (jumlah_penutur IS NULL OR jumlah_penutur < 100000);

-- Sumbawa: 300K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Sumbawa' AND (jumlah_penutur IS NULL OR jumlah_penutur < 300000);

-- Bima: 500K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Bima' AND (jumlah_penutur IS NULL OR jumlah_penutur < 500000);

-- Manggarai: 500K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Manggarai' AND (jumlah_penutur IS NULL OR jumlah_penutur < 500000);

-- Lamaholot: 150K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 150000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Lamaholot' AND (jumlah_penutur IS NULL OR jumlah_penutur < 150000);

-- Tetun: 400K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 400000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Tetun' AND (jumlah_penutur IS NULL OR jumlah_penutur < 400000);

-- Ngada: 60K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 60000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Ngada' AND (jumlah_penutur IS NULL OR jumlah_penutur < 60000);

-- Ende: 150K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 150000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Ende' AND (jumlah_penutur IS NULL OR jumlah_penutur < 150000);

-- Atoni: 400K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 400000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Atoni' AND (jumlah_penutur IS NULL OR jumlah_penutur < 400000);

-- Alor: 50K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 50000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Alor' AND (jumlah_penutur IS NULL OR jumlah_penutur < 50000);

-- Sumba (all variants): 300K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa ILIKE 'Sumba%' AND (jumlah_penutur IS NULL OR jumlah_penutur < 300000);

-- Ambon: 200K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 200000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Ambon' AND (jumlah_penutur IS NULL OR jumlah_penutur < 200000);

-- Ternate: 50K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 50000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Ternate' AND (jumlah_penutur IS NULL OR jumlah_penutur < 50000);

-- Tidore: 30K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 30000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Tidore' AND (jumlah_penutur IS NULL OR jumlah_penutur < 30000);

-- Buru: 40K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 40000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Buru' AND (jumlah_penutur IS NULL OR jumlah_penutur < 40000);

-- Kei: 100K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 100000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Kei' AND (jumlah_penutur IS NULL OR jumlah_penutur < 100000);

-- Aru: 50K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 50000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Aru' AND (jumlah_penutur IS NULL OR jumlah_penutur < 50000);

-- Tanimbar: 80K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 80000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Tanimbar' AND (jumlah_penutur IS NULL OR jumlah_penutur < 80000);

-- Sula: 30K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 30000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Sula' AND (jumlah_penutur IS NULL OR jumlah_penutur < 30000);

-- Seram: 50K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 50000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Seram' AND (jumlah_penutur IS NULL OR jumlah_penutur < 50000);

-- ========== PAPUA LANGUAGES ==========

-- Sentani: 30K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 30000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Sentani' AND (jumlah_penutur IS NULL OR jumlah_penutur < 30000);

-- Biak: 50K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 50000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Biak' AND (jumlah_penutur IS NULL OR jumlah_penutur < 50000);

-- Yapen: 40K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 40000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Yapen' AND (jumlah_penutur IS NULL OR jumlah_penutur < 40000);

-- Dani: 200K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 200000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Dani' AND (jumlah_penutur IS NULL OR jumlah_penutur < 200000);

-- Asmat: 70K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 70000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Asmat' AND (jumlah_penutur IS NULL OR jumlah_penutur < 70000);

-- Marind: 10K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 10000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Marind' AND (jumlah_penutur IS NULL OR jumlah_penutur < 10000);

-- Ekari: 100K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 100000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Ekari' AND (jumlah_penutur IS NULL OR jumlah_penutur < 100000);

-- Moni: 20K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 20000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Moni' AND (jumlah_penutur IS NULL OR jumlah_penutur < 20000);

-- Mimika: 30K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 30000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Mimika' AND (jumlah_penutur IS NULL OR jumlah_penutur < 30000);

-- Sawi: 10K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 10000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Sawi' AND (jumlah_penutur IS NULL OR jumlah_penutur < 10000);

-- Amungme: 20K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 20000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Amungme' AND (jumlah_penutur IS NULL OR jumlah_penutur < 20000);

-- Damal: 10K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 10000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Damal' AND (jumlah_penutur IS NULL OR jumlah_penutur < 10000);

-- ========== SUMATRA LANGUAGES ==========

-- Rejang: 350K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 350000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Rejang' AND (jumlah_penutur IS NULL OR jumlah_penutur < 350000);

-- Kerinci: 300K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Kerinci' AND (jumlah_penutur IS NULL OR jumlah_penutur < 300000);

-- Mentawai: 70K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 70000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Mentawai' AND (jumlah_penutur IS NULL OR jumlah_penutur < 70000);

-- Nias: 700K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 700000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Nias' AND (jumlah_penutur IS NULL OR jumlah_penutur < 700000);

-- Gayo: 300K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Gayo' AND (jumlah_penutur IS NULL OR jumlah_penutur < 300000);

-- Komering: 500K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 500000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Komering' AND (jumlah_penutur IS NULL OR jumlah_penutur < 500000);

-- Simeulue: 70K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 70000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Simeulue' AND (jumlah_penutur IS NULL OR jumlah_penutur < 70000);

-- Mandailing: 400K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 400000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Mandailing' AND (jumlah_penutur IS NULL OR jumlah_penutur < 400000);

-- Batak Angkola: 300K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 300000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Batak Angkola' AND (jumlah_penutur IS NULL OR jumlah_penutur < 300000);

-- Batak Pakpak: 200K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 200000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Batak Pakpak' AND (jumlah_penutur IS NULL OR jumlah_penutur < 200000);

-- ========== ADDITIONAL BATAK LANGUAGES ==========

-- Batak Dairi: 150K (Ethnologue 2024)
UPDATE bahasa SET jumlah_penutur = 150000, jumlah_penutur_tahun = 2024, sumber_referensi = 'Ethnologue 2024' 
WHERE nama_bahasa = 'Batak Dairi' AND (jumlah_penutur IS NULL OR jumlah_penutur < 150000);

-- Verify results
SELECT COUNT(*) as total_dengan_penutur, 
       SUM(CASE WHEN jumlah_penutur >= 1000000 THEN 1 ELSE 0 END) as diatas_1juta,
       SUM(CASE WHEN jumlah_penutur >= 100000 AND jumlah_penutur < 1000000 THEN 1 ELSE 0 END) as antara_100k_1juta,
       SUM(CASE WHEN jumlah_penutur >= 10000 AND jumlah_penutur < 100000 THEN 1 ELSE 0 END) as antara_10k_100k,
       SUM(CASE WHEN jumlah_penutur < 10000 THEN 1 ELSE 0 END) as dibawah_10k
FROM bahasa 
WHERE jumlah_penutur IS NOT NULL;
