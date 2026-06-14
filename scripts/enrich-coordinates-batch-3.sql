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
