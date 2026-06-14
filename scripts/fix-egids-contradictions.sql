-- Fix data contradictions before EGIDS reclassification

-- 1. Fix: Languages marked as "Punah" but have speakers
-- These should have status_vitalitas corrected, not speakers removed
UPDATE bahasa
SET status_vitalitas = 'Rentan'
WHERE status_vitalitas = 'Punah'
  AND jumlah_penutur > 0;

-- 2. Remove duplicate entries (keep the one with most data)
DELETE FROM bahasa
WHERE id NOT IN (
  SELECT DISTINCT ON (nama_bahasa) id
  FROM bahasa
  ORDER BY nama_bahasa,
    (CASE WHEN jumlah_penutur IS NOT NULL THEN 1 ELSE 0 END) DESC,
    (CASE WHEN status_vitalitas IS NOT NULL THEN 1 ELSE 0 END) DESC,
    (CASE WHEN provinsi IS NOT NULL THEN 1 ELSE 0 END) DESC,
    dibuat_pada ASC
);

-- 3. Reset EGIDS for reclassification
UPDATE bahasa SET egids_level = NULL;

-- 4. Reclassify using improved formula

-- Special case: Bahasa Indonesia
UPDATE bahasa
SET egids_level = '1 - National'
WHERE LOWER(nama_bahasa) = 'indonesia';

-- Priority 1: Vitality-based classification (highest confidence)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Punah' THEN '10 - Extinct'
  WHEN status_vitalitas = 'Hampir Punah' THEN '9 - Dormant'
  WHEN status_vitalitas = 'Sangat Terancam' THEN '8b - Nearly Extinct'
  WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '7 - Shifting'
  WHEN status_vitalitas = 'Rentan' THEN '6b - Threatened'
  WHEN status_vitalitas = 'Aman' THEN '6a - Vigorous'
  ELSE NULL
END
WHERE status_vitalitas IS NOT NULL
  AND egids_level IS NULL;

-- Priority 2: Speaker-count-based classification (with vitality cross-reference)
-- Formula: egids = f(log10(speakers), vitality_status)

-- Tier 1: >= 10M speakers (major institutional languages)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Aman' THEN '4 - Educational'
  ELSE '5 - Written'
END
WHERE jumlah_penutur >= 10000000
  AND egids_level IS NULL;

-- Tier 2: 1M-10M speakers (large regional languages)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Aman' THEN '5 - Written'
  WHEN status_vitalitas = 'Rentan' THEN '6a - Vigorous'
  ELSE '6a - Vigorous'
END
WHERE jumlah_penutur >= 1000000 AND jumlah_penutur < 10000000
  AND egids_level IS NULL;

-- Tier 3: 500K-1M speakers (medium-large languages)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Aman' THEN '5 - Written'
  WHEN status_vitalitas = 'Rentan' THEN '6a - Vigorous'
  ELSE '6a - Vigorous'
END
WHERE jumlah_penutur >= 500000 AND jumlah_penutur < 1000000
  AND egids_level IS NULL;

-- Tier 4: 100K-500K speakers (medium languages)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Aman' THEN '6a - Vigorous'
  WHEN status_vitalitas = 'Rentan' THEN '6a - Vigorous'
  WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '6b - Threatened'
  ELSE '6b - Threatened'
END
WHERE jumlah_penutur >= 100000 AND jumlah_penutur < 500000
  AND egids_level IS NULL;

-- Tier 5: 50K-100K speakers (small-medium languages)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Aman' THEN '6a - Vigorous'
  WHEN status_vitalitas = 'Rentan' THEN '6b - Threatened'
  WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '7 - Shifting'
  ELSE '6b - Threatened'
END
WHERE jumlah_penutur >= 50000 AND jumlah_penutur < 100000
  AND egids_level IS NULL;

-- Tier 6: 10K-50K speakers (small languages)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Aman' THEN '6b - Threatened'
  WHEN status_vitalitas = 'Rentan' THEN '6b - Threatened'
  WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '7 - Shifting'
  ELSE '7 - Shifting'
END
WHERE jumlah_penutur >= 10000 AND jumlah_penutur < 50000
  AND egids_level IS NULL;

-- Tier 7: 1K-10K speakers (very small languages)
UPDATE bahasa
SET egids_level = CASE
  WHEN status_vitalitas = 'Rentan' THEN '7 - Shifting'
  WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '8a - Moribund'
  ELSE '8a - Moribund'
END
WHERE jumlah_penutur >= 1000 AND jumlah_penutur < 10000
  AND egids_level IS NULL;

-- Tier 8: 100-1K speakers (critically small)
UPDATE bahasa
SET egids_level = '8a - Moribund'
WHERE jumlah_penutur >= 100 AND jumlah_penutur < 1000
  AND egids_level IS NULL;

-- Tier 9: < 100 speakers (nearly extinct)
UPDATE bahasa
SET egids_level = '8b - Nearly Extinct'
WHERE jumlah_penutur > 0 AND jumlah_penutur < 100
  AND egids_level IS NULL;

-- Priority 3: Vitality-only mapping (no speaker data)
UPDATE bahasa
SET egids_level = '5 - Written'
WHERE jumlah_penutur IS NULL
  AND status_vitalitas = 'Aman'
  AND egids_level IS NULL;

UPDATE bahasa
SET egids_level = '6b - Threatened'
WHERE jumlah_penutur IS NULL
  AND status_vitalitas = 'Rentan'
  AND egids_level IS NULL;

UPDATE bahasa
SET egids_level = '7 - Shifting'
WHERE jumlah_penutur IS NULL
  AND status_vitalitas = 'Mengalami Kemunduran'
  AND egids_level IS NULL;

-- Priority 4: Institutional boost for languages with provinsi data
UPDATE bahasa
SET egids_level = '6a - Vigorous'
WHERE egids_level = '6b - Threatened'
  AND provinsi IS NOT NULL
  AND jumlah_penutur >= 50000;

-- Summary
SELECT
  egids_level,
  COUNT(*) as count,
  ROUND(AVG(jumlah_penutur) FILTER (WHERE jumlah_penutur IS NOT NULL), 0) as avg_speakers
FROM bahasa
WHERE egids_level IS NOT NULL
GROUP BY egids_level
ORDER BY egids_level;
