-- Bahasa Batak Angkola (700 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 700000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'batak angkola' AND jumlah_penutur IS NULL;

-- Bahasa Toraja Sa'dan (750 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 750000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE (LOWER(nama_bahasa) = 'toraja' OR LOWER(nama_bahasa) LIKE '%toraja sa%') AND jumlah_penutur IS NULL;

-- Bahasa Sasak (2.7 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 2700000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'sasak' AND jumlah_penutur IS NULL;

-- Bahasa Ternate (50 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 50000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'ternate' AND jumlah_penutur IS NULL;

-- Bahasa Tidore (30 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 30000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'tidore' AND jumlah_penutur IS NULL;
