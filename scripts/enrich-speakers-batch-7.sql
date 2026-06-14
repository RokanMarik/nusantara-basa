-- Bahasa Napu (6 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 6000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'napu' AND jumlah_penutur IS NULL;

-- Bahasa Mori (30 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 30000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'mori' AND jumlah_penutur IS NULL;

-- Bahasa Bungku (30 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 30000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'bungku' AND jumlah_penutur IS NULL;

-- Bahasa Saluan (60 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 60000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'saluan' AND jumlah_penutur IS NULL;

-- Bahasa Banggai (125 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 125000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'banggai' AND jumlah_penutur IS NULL;
