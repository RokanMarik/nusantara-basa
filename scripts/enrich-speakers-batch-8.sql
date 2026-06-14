-- Bahasa Tomini (20 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 20000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'tomini' AND jumlah_penutur IS NULL;

-- Bahasa Totoli (40 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 40000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'totoli' AND jumlah_penutur IS NULL;

-- Bahasa Melayu Riau (2 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 2000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) LIKE '%melayu riau%' AND jumlah_penutur IS NULL;

-- Bahasa Melayu Jambi (1 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 1000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) LIKE '%melayu jambi%' AND jumlah_penutur IS NULL;

-- Bahasa Rejang (350 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 350000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'rejang' AND jumlah_penutur IS NULL;
