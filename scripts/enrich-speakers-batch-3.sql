-- Bahasa Lampung (1.5 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 1500000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'lampung' AND jumlah_penutur IS NULL;

-- Bahasa Batak Mandailing (1 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 1000000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'batak mandailing' AND jumlah_penutur IS NULL;

-- Bahasa Batak Karo (600 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 600000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'batak karo' AND jumlah_penutur IS NULL;

-- Bahasa Batak Simalungun (1.2 juta penutur)
UPDATE bahasa 
SET jumlah_penutur = 1200000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE LOWER(nama_bahasa) = 'batak simalungun' AND jumlah_penutur IS NULL;

-- Bahasa Batak Pakpak/Dairi (200 ribu penutur)
UPDATE bahasa 
SET jumlah_penutur = 200000,
    sumber_data = 'Ethnologue 2023',
    tahun_sumber_data = 2023
WHERE (LOWER(nama_bahasa) = 'batak pakpak' OR LOWER(nama_bahasa) = 'batak dairi') AND jumlah_penutur IS NULL;
