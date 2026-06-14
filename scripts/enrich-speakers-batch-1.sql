-- Enrich speaker counts for major/well-documented languages
-- Based on Ethnologue and linguistic research data

-- Bahasa Sunda (36-42 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 42000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'sunda' AND jumlah_penutur IS NULL;

-- Bahasa Minangkabau (5.5 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 5500000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'minangkabau' AND jumlah_penutur IS NULL;

-- Bahasa Aceh (3.5 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 3500000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'aceh' AND jumlah_penutur IS NULL;

-- Bahasa Batak Toba (2 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 2000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'batak toba' AND jumlah_penutur IS NULL;

-- Bahasa Bugis (5 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 5000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'bugis' AND jumlah_penutur IS NULL;
