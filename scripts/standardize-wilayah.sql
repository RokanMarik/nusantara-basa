-- Standardize wilayah values to consistent format

-- Fix "Sumatra" -> "Sumatera"
UPDATE bahasa SET wilayah = 'Sumatera' WHERE wilayah = 'Sumatra';

-- Fix "Jawa dan Bali" -> split to individual regions
-- Languages in Jawa dan Bali are primarily in Jawa
UPDATE bahasa SET wilayah = 'Jawa' WHERE wilayah = 'Jawa dan Bali';

-- Fix combined wilayah entries - use primary region
UPDATE bahasa SET wilayah = 'Nusa Tenggara' WHERE wilayah = 'Nusa Tenggara Barat';
UPDATE bahasa SET wilayah = 'Nusa Tenggara' WHERE wilayah = 'Nusa Tenggara Timur';
UPDATE bahasa SET wilayah = 'Nusa Tenggara' WHERE wilayah = 'Jawa dan Bali, Nusa Tenggara Barat';
UPDATE bahasa SET wilayah = 'Sumatera' WHERE wilayah = 'Sumatra, Jawa dan Bali, Kalimantan, Sulawesi, Nusa Tenggara Barat';

-- Remove "Belum teridentifikasi" - set to NULL so we can track what needs enrichment
UPDATE bahasa SET wilayah = NULL WHERE wilayah = 'Belum teridentifikasi';

-- Verify standardization
SELECT wilayah, COUNT(*) as count
FROM bahasa
WHERE wilayah IS NOT NULL
GROUP BY wilayah
ORDER BY count DESC;
