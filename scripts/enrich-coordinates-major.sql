-- Enrich coordinates for major/well-known languages
-- Using known geographic locations from linguistic research

-- Bahasa Jawa
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -7.5, "lng": 110.5, "source": "Central Java region (Yogyakarta/Solo)"}'
WHERE LOWER(nama_bahasa) = 'jawa' AND koordinat_pusat IS NULL;

-- Bahasa Sunda
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -6.9, "lng": 107.6, "source": "West Java region (Bandung)"}'
WHERE LOWER(nama_bahasa) = 'sunda' AND koordinat_pusat IS NULL;

-- Bahasa Minangkabau
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -0.9, "lng": 100.4, "source": "West Sumatra region (Padang)"}'
WHERE LOWER(nama_bahasa) = 'minangkabau' AND koordinat_pusat IS NULL;

-- Bahasa Aceh
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 5.5, "lng": 95.3, "source": "Aceh region (Banda Aceh)"}'
WHERE LOWER(nama_bahasa) = 'aceh' AND koordinat_pusat IS NULL;

-- Bahasa Batak Toba
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 2.6, "lng": 98.9, "source": "Lake Toba region, North Sumatra"}'
WHERE LOWER(nama_bahasa) = 'batak toba' AND koordinat_pusat IS NULL;

-- Bahasa Bugis
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -5.1, "lng": 119.4, "source": "South Sulawesi region (Makassar)"}'
WHERE LOWER(nama_bahasa) = 'bugis' AND koordinat_pusat IS NULL;

-- Bahasa Bali
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -8.5, "lng": 115.2, "source": "Bali island (Denpasar)"}'
WHERE LOWER(nama_bahasa) = 'bali' AND koordinat_pusat IS NULL;

-- Bahasa Banjar
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -3.3, "lng": 114.6, "source": "South Kalimantan region (Banjarmasin)"}'
WHERE LOWER(nama_bahasa) = 'banjar' AND koordinat_pusat IS NULL;

-- Bahasa Madura
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -7.1, "lng": 113.3, "source": "Madura island, East Java"}'
WHERE LOWER(nama_bahasa) = 'madura' AND koordinat_pusat IS NULL;

-- Bahasa Makassar
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -5.1, "lng": 119.4, "source": "South Sulawesi region (Makassar)"}'
WHERE LOWER(nama_bahasa) = 'makassar' AND koordinat_pusat IS NULL;

-- Bahasa Betawi
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -6.2, "lng": 106.8, "source": "Jakarta region"}'
WHERE LOWER(nama_bahasa) = 'betawi' AND koordinat_pusat IS NULL;

-- Bahasa Palembang
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -2.9, "lng": 104.7, "source": "South Sumatra region (Palembang)"}'
WHERE LOWER(nama_bahasa) = 'palembang' AND koordinat_pusat IS NULL;

-- Bahasa Lampung
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -5.4, "lng": 105.2, "source": "Lampung province"}'
WHERE LOWER(nama_bahasa) = 'lampung' AND koordinat_pusat IS NULL;

-- Bahasa Batak Mandailing
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 1.5, "lng": 99.3, "source": "South Tapanuli, North Sumatra"}'
WHERE LOWER(nama_bahasa) = 'batak mandailing' AND koordinat_pusat IS NULL;

-- Bahasa Batak Karo
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 3.1, "lng": 98.3, "source": "Karo regency, North Sumatra"}'
WHERE LOWER(nama_bahasa) = 'batak karo' AND koordinat_pusat IS NULL;

-- Bahasa Batak Simalungun
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
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -1.8, "lng": 120.6, "source": "Poso region, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'pamona' AND koordinat_pusat IS NULL;

-- Bahasa Napu
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -1.5, "lng": 120.3, "source": "Napu valley, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'napu' AND koordinat_pusat IS NULL;

-- Bahasa Mori
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -2.5, "lng": 121.5, "source": "Mori region, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'mori' AND koordinat_pusat IS NULL;

-- Bahasa Bungku
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -2.5, "lng": 121.8, "source": "Bungku region, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'bungku' AND koordinat_pusat IS NULL;

-- Bahasa Saluan
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -1.5, "lng": 122.5, "source": "Banggai region, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'saluan' AND koordinat_pusat IS NULL;

-- Bahasa Banggai
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -1.5, "lng": 122.5, "source": "Banggai islands, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'banggai' AND koordinat_pusat IS NULL;

-- Bahasa Tomini
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.5, "lng": 121.0, "source": "Tomini bay, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'tomini' AND koordinat_pusat IS NULL;

-- Bahasa Totoli
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 1.0, "lng": 120.8, "source": "Totoli region, Central Sulawesi"}'
WHERE LOWER(nama_bahasa) = 'totoli' AND koordinat_pusat IS NULL;

-- Bahasa Melayu Riau
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 0.5, "lng": 101.5, "source": "Riau province"}'
WHERE LOWER(nama_bahasa) LIKE '%melayu riau%' AND koordinat_pusat IS NULL;

-- Bahasa Melayu Jambi
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -1.6, "lng": 103.6, "source": "Jambi province"}'
WHERE LOWER(nama_bahasa) LIKE '%melayu jambi%' AND koordinat_pusat IS NULL;

-- Bahasa Rejang
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -3.5, "lng": 102.3, "source": "Bengkulu province"}'
WHERE LOWER(nama_bahasa) = 'rejang' AND koordinat_pusat IS NULL;

-- Bahasa Kerinci
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -2.0, "lng": 101.5, "source": "Kerinci regency, Jambi"}'
WHERE LOWER(nama_bahasa) = 'kerinci' AND koordinat_pusat IS NULL;

-- Bahasa Minang
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -0.9, "lng": 100.4, "source": "West Sumatra region"}'
WHERE LOWER(nama_bahasa) = 'minang' AND koordinat_pusat IS NULL;

-- Bahasa Nias
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 1.1, "lng": 97.5, "source": "Nias island, North Sumatra"}'
WHERE LOWER(nama_bahasa) = 'nias' AND koordinat_pusat IS NULL;

-- Bahasa Mentawai
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -2.2, "lng": 99.5, "source": "Mentawai islands, West Sumatra"}'
WHERE LOWER(nama_bahasa) = 'mentawai' AND koordinat_pusat IS NULL;

-- Bahasa Enggano
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -5.3, "lng": 102.3, "source": "Enggano island, Bengkulu"}'
WHERE LOWER(nama_bahasa) = 'enggano' AND koordinat_pusat IS NULL;

-- Bahasa Kubu
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -1.5, "lng": 102.5, "source": "Jambi/Riau forest region"}'
WHERE LOWER(nama_bahasa) = 'kubu' AND koordinat_pusat IS NULL;

-- Bahasa Sakai
UPDATE bahasa 
SET koordinat_pusat = '{"lat": 1.5, "lng": 101.5, "source": "Riau province"}'
WHERE LOWER(nama_bahasa) = 'sakai' AND koordinat_pusat IS NULL;

-- Bahasa Osing
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -8.3, "lng": 114.2, "source": "Banyuwangi, East Java"}'
WHERE LOWER(nama_bahasa) = 'osing' AND koordinat_pusat IS NULL;

-- Bahasa Tengger
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -7.9, "lng": 112.9, "source": "Bromo Tengger Semeru, East Java"}'
WHERE LOWER(nama_bahasa) = 'tengger' AND koordinat_pusat IS NULL;

-- Bahasa Using
UPDATE bahasa 
SET koordinat_pusat = '{"lat": -8.3, "lng": 114.2, "source": "Banyuwangi, East Java"}'
WHERE LOWER(nama_bahasa) = 'using' AND koordinat_pusat IS NULL;

-- Summary
SELECT COUNT(*) as total_with_coordinates FROM bahasa WHERE koordinat_pusat IS NOT NULL;
