-- Bahasa Osing (400 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 400000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'osing' AND jumlah_penutur IS NULL;

-- Bahasa Tengger (500 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 500000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'tengger' AND jumlah_penutur IS NULL;

-- Bahasa Using (400 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 400000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'using' AND jumlah_penutur IS NULL;

-- Summary
SELECT COUNT(*) as total_with_speakers FROM bahasa WHERE jumlah_penutur > 0;
