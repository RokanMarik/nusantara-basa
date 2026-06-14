-- Enrich speaker counts for major/well-documented languages
-- Based on Ethnologue 2023 data

-- Batch 1: Major regional languages
UPDATE bahasa SET jumlah_penutur = 42000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Sunda';
UPDATE bahasa SET jumlah_penutur = 13600000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Madura';
UPDATE bahasa SET jumlah_penutur = 5000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Minangkabau';
UPDATE bahasa SET jumlah_penutur = 5000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Bugis';
UPDATE bahasa SET jumlah_penutur = 5000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Betawi';
UPDATE bahasa SET jumlah_penutur = 3500000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Aceh';
UPDATE bahasa SET jumlah_penutur = 3500000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Banjar';
UPDATE bahasa SET jumlah_penutur = 3300000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Bali';
UPDATE bahasa SET jumlah_penutur = 3100000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Palembang';

-- Batch 2: Batak languages and others
UPDATE bahasa SET jumlah_penutur = 2000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Batak Toba';
UPDATE bahasa SET jumlah_penutur = 1500000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Lampung';
UPDATE bahasa SET jumlah_penutur = 1200000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Batak Simalungun';
UPDATE bahasa SET jumlah_penutur = 1000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Batak Mandailing';
UPDATE bahasa SET jumlah_penutur = 1000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Melayu Riau';
UPDATE bahasa SET jumlah_penutur = 1000000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Melayu Jambi';
UPDATE bahasa SET jumlah_penutur = 900000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Gorontalo';
UPDATE bahasa SET jumlah_penutur = 900000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Mongondow';
UPDATE bahasa SET jumlah_penutur = 900000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Bolaang Mongondow';
UPDATE bahasa SET jumlah_penutur = 800000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Nias';

-- Batch 3: Smaller languages
UPDATE bahasa SET jumlah_penutur = 700000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Batak Angkola';
UPDATE bahasa SET jumlah_penutur = 600000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Batak Karo';
UPDATE bahasa SET jumlah_penutur = 500000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Tengger';
UPDATE bahasa SET jumlah_penutur = 400000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Osing';
UPDATE bahasa SET jumlah_penutur = 400000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Using';
UPDATE bahasa SET jumlah_penutur = 350000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Rejang';
UPDATE bahasa SET jumlah_penutur = 300000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Muna';
UPDATE bahasa SET jumlah_penutur = 300000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Kerinci';
UPDATE bahasa SET jumlah_penutur = 250000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Sangihe';
UPDATE bahasa SET jumlah_penutur = 200000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Batak Pakpak';

-- Batch 4: Smaller languages continued
UPDATE bahasa SET jumlah_penutur = 200000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Kaili';
UPDATE bahasa SET jumlah_penutur = 150000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Pamona';
UPDATE bahasa SET jumlah_penutur = 125000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Banggai';
UPDATE bahasa SET jumlah_penutur = 100000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Buol';
UPDATE bahasa SET jumlah_penutur = 100000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Tolitoli';
UPDATE bahasa SET jumlah_penutur = 70000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Mentawai';
UPDATE bahasa SET jumlah_penutur = 70000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Ternate';
UPDATE bahasa SET jumlah_penutur = 60000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Saluan';
UPDATE bahasa SET jumlah_penutur = 50000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Tidore';
UPDATE bahasa SET jumlah_penutur = 40000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Totoli';

-- Batch 5: Endangered/small languages
UPDATE bahasa SET jumlah_penutur = 30000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Mori';
UPDATE bahasa SET jumlah_penutur = 30000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Bungku';
UPDATE bahasa SET jumlah_penutur = 20000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Tomini';
UPDATE bahasa SET jumlah_penutur = 10000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Kubu';
UPDATE bahasa SET jumlah_penutur = 6000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Napu';
UPDATE bahasa SET jumlah_penutur = 2000, sumber_referensi = 'Ethnologue 2023', jumlah_penutur_tahun = 2023 WHERE nama_bahasa = 'Enggano';
