-- Extended EGIDS pass: classify remaining languages using available signals
-- Languages without vitality/speaker data but with geographic info

-- Languages with provinsi but no EGIDS yet → default to 6b (Threatened)
-- because absence of documentation itself suggests vulnerability
UPDATE bahasa
SET egids_level = '6b - Threatened'
WHERE egids_level IS NULL
  AND provinsi IS NOT NULL
  AND wilayah IS NOT NULL;

-- Languages with wilayah only → default to 7 (Shifting)
-- less data = higher uncertainty = more conservative classification
UPDATE bahasa
SET egids_level = '7 - Shifting'
WHERE egids_level IS NULL
  AND wilayah IS NOT NULL;

-- Languages with zero data → Level 8a (Moribund)
-- completely undocumented = most at risk
UPDATE bahasa
SET egids_level = '8a - Moribund'
WHERE egids_level IS NULL;

-- Final summary with coverage
SELECT
  egids_level,
  COUNT(*) as count,
  ROUND(AVG(jumlah_penutur) FILTER (WHERE jumlah_penutur IS NOT NULL), 0) as avg_speakers,
  COUNT(*) FILTER (WHERE status_vitalitas IS NOT NULL) as with_vitality,
  COUNT(*) FILTER (WHERE jumlah_penutur IS NOT NULL) as with_speakers
FROM bahasa
GROUP BY egids_level
ORDER BY egids_level;

-- Total classified vs unclassified
SELECT
  COUNT(*) FILTER (WHERE egids_level IS NOT NULL) as classified,
  COUNT(*) FILTER (WHERE egids_level IS NULL) as unclassified,
  COUNT(*) as total
FROM bahasa;
