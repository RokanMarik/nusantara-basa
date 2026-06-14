-- Comprehensive Data Cleanup Script
-- Based on data quality audit results

-- ============================================
-- STEP 1: Delete Invalid Entries
-- ============================================

-- Delete "Demografi Indonesia" - not a language
DELETE FROM bahasa WHERE nama_bahasa = 'Demografi Indonesia';

-- ============================================
-- STEP 2: Fix ISO Code Issues
-- ============================================

-- Fix "ri " (with trailing space) for Riang
-- Riang language ISO code should be "ril" (Riang language)
UPDATE bahasa 
SET kode_iso_639 = 'ril' 
WHERE nama_bahasa = 'Riang' AND kode_iso_639 = 'ri ';

-- ============================================
-- STEP 3: Enrich Minimal Data Languages
-- ============================================

-- Languages with ISO codes but no wilayah/provinsi
-- Will use ISO code to lookup from external sources

-- For now, let's identify and categorize minimal data languages
-- Group by potential region based on name patterns

-- Update languages with clear regional indicators in names
UPDATE bahasa 
SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Barat'
WHERE nama_bahasa LIKE '%Dayak%' 
  AND wilayah IS NULL;

UPDATE bahasa 
SET wilayah = 'Papua', provinsi = 'Papua'
WHERE (nama_bahasa LIKE '%Asmat%' OR nama_bahasa LIKE '%Dani%')
  AND wilayah IS NULL;

UPDATE bahasa 
SET wilayah = 'Sulawesi', provinsi = 'Sulawesi Selatan'
WHERE (nama_bahasa LIKE '%Toraja%' OR nama_bahasa LIKE '%Bugis%' OR nama_bahasa LIKE '%Makassar%')
  AND wilayah IS NULL;

UPDATE bahasa 
SET wilayah = 'Sumatera', provinsi = 'Sumatera Utara'
WHERE nama_bahasa LIKE '%Batak%'
  AND wilayah IS NULL;

-- Update specific well-known languages
UPDATE bahasa SET wilayah = 'Kalimantan', provinsi = 'Kalimantan Selatan' WHERE nama_bahasa = 'Banjar' AND wilayah IS NULL;
UPDATE bahasa SET wilayah = 'Maluku', provinsi = 'Maluku' WHERE nama_bahasa = 'Ambon' AND wilayah IS NULL;
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Timur' WHERE nama_bahasa = 'Flores' AND wilayah IS NULL;
UPDATE bahasa SET wilayah = 'Nusa Tenggara', provinsi = 'Nusa Tenggara Barat' WHERE nama_bahasa = 'Sumbawa' AND wilayah IS NULL;

-- Mark languages that need manual review (have ISO but no region data)
-- These will be flagged for future enrichment from Ethnologue/Glottolog
UPDATE bahasa 
SET catatan = CONCAT(COALESCE(catatan, ''), ' [NEEDS_REGION_ENRICHMENT]')
WHERE kode_iso_639 IS NOT NULL 
  AND wilayah IS NULL 
  AND provinsi IS NULL
  AND catatan NOT LIKE '%NEEDS_REGION_ENRICHMENT%';

-- ============================================
-- STEP 4: Validate EGIDS Classification
-- ============================================

-- Ensure no EGIDS level for deleted/invalid entries
UPDATE bahasa 
SET egids_level = NULL 
WHERE nama_bahasa IN ('Demografi Indonesia');

-- Re-classify languages that might have been affected by cleanup
-- Languages with ISO codes but still no data should get default classification
UPDATE bahasa 
SET egids_level = '8a - Moribund'
WHERE egids_level IS NULL 
  AND kode_iso_639 IS NOT NULL
  AND jumlah_penutur IS NULL
  AND status_vitalitas IS NULL;

-- ============================================
-- STEP 5: Create Summary Report
-- ============================================

SELECT 'Cleanup Summary' as report;
SELECT 
  COUNT(*) as total_languages,
  COUNT(*) FILTER (WHERE wilayah IS NOT NULL) as with_wilayah,
  COUNT(*) FILTER (WHERE provinsi IS NOT NULL) as with_provinsi,
  COUNT(*) FILTER (WHERE kode_iso_639 IS NOT NULL) as with_iso,
  COUNT(*) FILTER (WHERE egids_level IS NOT NULL) as with_egids,
  COUNT(*) FILTER (WHERE catatan LIKE '%NEEDS_REGION_ENRICHMENT%') as needs_enrichment
FROM bahasa;

-- Show remaining minimal data entries
SELECT 'Languages Still Needing Enrichment' as report;
SELECT nama_bahasa, kode_iso_639, wilayah, provinsi, egids_level
FROM bahasa
WHERE wilayah IS NULL 
  AND provinsi IS NULL
ORDER BY nama_bahasa
LIMIT 20;
