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
