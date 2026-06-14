-- Bahasa Buol (70 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 70000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'buol' AND jumlah_penutur IS NULL;

-- Bahasa Mongondow (900 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 900000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'mongondow' AND jumlah_penutur IS NULL;

-- Bahasa Bolaang Mongondow (900 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 900000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) LIKE '%bolaang mongondow%' AND jumlah_penutur IS NULL;

-- Bahasa Kaili (200 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 200000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'kaili' AND jumlah_penutur IS NULL;

-- Bahasa Pamona (150 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 150000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'pamona' AND jumlah_penutur IS NULL;
