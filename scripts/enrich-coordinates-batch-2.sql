UPDATE bahasa 
SET koordinat_pusat = '{"lat": 2.9, "lng": 99.1, "source": "Simalungun regency, North Sumatra"}'
WHERE LOWER(nama_bahasa) = 'batak simalungun' AND koordinat_pusat IS NULL;

-- Bahasa Dayak (generic)


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.5, "lng": 114.5, "source": "Central Kalimantan region"}'
WHERE LOWER(nama_bahasa) LIKE '%dayak%' AND koordinat_pusat IS NULL;

-- Bahasa Toraja


UPDATE bahasa 
SET koordinat_pusat = '{"lat": -3.0, "lng": 119.8, "source": "Tana Toraja, South Sulawesi"}'
WHERE LOWER(nama_bahasa) LIKE '%toraja%' AND koordinat_pusat IS NULL;

-- Bahasa Sasak


UPDATE bahasa 
SET koordinat_pusat = '{"lat": -8.6, "lng": 116.3, "source": "Lombok island"}'
WHERE LOWER(nama_bahasa) = 'sasak' AND koordinat_pusat IS NULL;

-- Bahasa Ternate


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.8, "lng": 127.4, "source": "Ternate island, North Maluku"}'
WHERE LOWER(nama_bahasa) = 'ternate' AND koordinat_pusat IS NULL;

-- Bahasa Tidore


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.7, "lng": 127.4, "source": "Tidore island, North Maluku"}'
WHERE LOWER(nama_bahasa) = 'tidore' AND koordinat_pusat IS NULL;

-- Bahasa Ambon/Melayu Ambon


UPDATE bahasa 
SET koordinat_pusat = '{"lat": -3.7, "lng": 128.2, "source": "Ambon island, Maluku"}'
WHERE (LOWER(nama_bahasa) = 'ambon' OR LOWER(nama_bahasa) LIKE '%melayu ambon%') AND koordinat_pusat IS NULL;

-- Bahasa Sangir


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 3.5, "lng": 125.5, "source": "Sangihe islands, North Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'sangir' AND koordinat_pusat IS NULL;

-- Bahasa Gorontalo


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.5, "lng": 123.1, "source": "Gorontalo province"}'
WHERE LOWER(nama_bahasa) = 'gorontalo' AND koordinat_pusat IS NULL;

-- Bahasa Muna


UPDATE bahasa 
SET koordinat_pusat = '{"lat": -4.8, "lng": 122.6, "source": "Muna island, Southeast Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'muna' AND koordinat_pusat IS NULL;

-- Bahasa Tolitoli


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 1.0, "lng": 120.8, "source": "Tolitoli regency, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'tolitoli' AND koordinat_pusat IS NULL;

-- Bahasa Buol


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 1.0, "lng": 121.4, "source": "Buol regency, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'buol' AND koordinat_pusat IS NULL;

-- Bahasa Mongondow


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.8, "lng": 124.0, "source": "Mongondow regency, North Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'mongondow' AND koordinat_pusat IS NULL;

-- Bahasa Bolaang Mongondow


UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.8, "lng": 124.0, "source": "Bolaang Mongondow region, North Sulawesi"}'
WHERE LOWER(nama_bahasa) LIKE '%bolaang mongondow%' AND koordinat_pusat IS NULL;

-- Bahasa Kaili


UPDATE bahasa 
SET koordinat_pusat = '{"lat": -0.9, "lng": 119.8, "source": "Central Sulawesi region (Palu)"}'
WHERE LOWER(nama_bahasa) = 'kaili' AND koordinat_pusat IS NULL;

-- Bahasa Pamona
