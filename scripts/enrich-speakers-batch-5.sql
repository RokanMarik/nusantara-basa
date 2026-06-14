-- Bahasa Ambon (1 juta penutur sebagai bahasa ibu)
UPDATE bahasa 
SET jumlah_penutur = 1000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE (LOWER(nama_bahasa) = 'ambon' OR LOWER(nama_bahasa) LIKE '%melayu ambon%') AND jumlah_penutur IS NULL;

-- Bahasa Sangir (200 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 200000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'sangir' AND jumlah_penutur IS NULL;

-- Bahasa Gorontalo (900 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 900000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'gorontalo' AND jumlah_penutur IS NULL;

-- Bahasa Muna (300 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 300000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'muna' AND jumlah_penutur IS NULL;

-- Bahasa Tolitoli (70 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 70000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'tolitoli' AND jumlah_penutur IS NULL;
