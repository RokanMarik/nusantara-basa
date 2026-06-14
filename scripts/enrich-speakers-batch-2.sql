-- Bahasa Bali (3.3 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 3300000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'bali' AND jumlah_penutur IS NULL;

-- Bahasa Banjar (3.5 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 3500000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'banjar' AND jumlah_penutur IS NULL;

-- Bahasa Madura (13.6 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 13600000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'madura' AND jumlah_penutur IS NULL;

-- Bahasa Betawi (5 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 5000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'betawi' AND jumlah_penutur IS NULL;

-- Bahasa Palembang (3.1 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 3100000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'palembang' AND jumlah_penutur IS NULL;
