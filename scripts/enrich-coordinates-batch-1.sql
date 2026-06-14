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
