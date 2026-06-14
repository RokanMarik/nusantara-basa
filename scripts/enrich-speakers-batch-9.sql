-- Bahasa Kerinci (300 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 300000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'kerinci' AND jumlah_penutur IS NULL;

-- Bahasa Nias (770 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 770000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'nias' AND jumlah_penutur IS NULL;

-- Bahasa Mentawai (70 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 70000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'mentawai' AND jumlah_penutur IS NULL;

-- Bahasa Enggano (2 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 2000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'enggano' AND jumlah_penutur IS NULL;

-- Bahasa Kubu (10 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 10000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'kubu' AND jumlah_penutur IS NULL;
