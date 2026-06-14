-- EGIDS Classification using Mathematical Heuristic
-- Formula based on: speaker count + vitality status + language significance
--
-- EGIDS SCALE MAPPING:
-- Level 0  (International)  - Cross-border institutional use
-- Level 1  (National)       - National official language
-- Level 2  (Regional)       - Provincial official language
-- Level 3  (Trade)          - Local trade lingua franca
-- Level 4  (Educational)    - Standardized, taught in schools
-- Level 5  (Written)        - Written tradition, all generations use
-- Level 6a (Vigorous)       - All generations speak at home
-- Level 6b (Threatened)     - All generations but declining
-- Level 7  (Shifting)       - Parents understand but don't teach
-- Level 8a (Moribund)       - Only grandparents speak
-- Level 8b (Nearly Extinct) - Only isolated elderly
-- Level 9  (Dormant)        - No fluent speakers, identity symbol
-- Level 10 (Extinct)        - No speakers remain
--
-- MATHEMATICAL FORMULA:
-- Priority 1: Special cases (Bahasa Indonesia = Level 1)
-- Priority 2: Vitality status mapping (Punah=10, Sangat Terancam=8b, etc)
-- Priority 3: Speaker count tiers with vitality cross-reference
-- Priority 4: Vitality-only mapping (no speaker data)
-- Priority 5: Province-level languages get +1 institutional boost

-- ============================================================
-- PASS 1: Special cases - National language
-- ============================================================
UPDATE bahasa
SET egids_level = '1 - National'
WHERE LOWER(nama_bahasa) = 'indonesia'
  AND (egids_level IS NULL OR egids_level = '');

-- ============================================================
-- PASS 2: Vitality-status-based mapping (highest confidence)
-- ============================================================

-- Punah → Level 10 (Extinct)
UPDATE bahasa
SET egids_level = '10 - Extinct'
WHERE status_vitalitas = 'Punah'
  AND (egids_level IS NULL OR egids_level = '');

-- Hampir Punah → Level 9 (Dormant)
UPDATE bahasa
SET egids_level = '9 - Dormant'
WHERE status_vitalitas = 'Hampir Punah'
  AND (egids_level IS NULL OR egids_level = '');

-- Sangat Terancam → Level 8b (Nearly Extinct)
UPDATE bahasa
SET egids_level = '8b - Nearly Extinct'
WHERE status_vitalitas = 'Sangat Terancam'
  AND (egids_level IS NULL OR egids_level = '');

-- ============================================================
-- PASS 3: Speaker-count-based classification (main formula)
-- Uses logarithmic speaker tiers + vitality cross-reference
--
-- Formula: egids = f(log10(speakers), vitality_status)
--
-- Tier mapping:
--   speakers >= 10,000,000  → Level 4 (Educational) if Aman
--                            → Level 5 (Written)     otherwise
--   speakers >= 1,000,000   → Level 5 (Written)     if Aman
--                            → Level 6a (Vigorous)   otherwise
--   speakers >= 500,000     → Level 5 (Written)     if Aman
--                            → Level 6a (Vigorous)   otherwise
--   speakers >= 100,000     → Level 6a (Vigorous)   if Aman/Rentan
--                            → Level 6b (Threatened) otherwise
--   speakers >= 50,000      → Level 6a (Vigorous)   if Aman
--                            → Level 6b (Threatened) if Rentan
--                            → Level 7 (Shifting)    otherwise
--   speakers >= 10,000      → Level 6b (Threatened) if Rentan
--                            → Level 7 (Shifting)    otherwise
--   speakers >= 1,000       → Level 7 (Shifting)    if Rentan
--                            → Level 8a (Moribund)   otherwise
--   speakers >= 100         → Level 8a (Moribund)
--   speakers < 100          → Level 8b (Nearly Extinct)
-- ============================================================

-- Tier 1: >= 10M speakers (major institutional languages)
UPDATE bahasa
SET egids_level = CASE
    WHEN status_vitalitas = 'Aman' THEN '4 - Educational'
    ELSE '5 - Written'
  END
WHERE jumlah_penutur >= 10000000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 2: 1M-10M speakers (large regional languages)
UPDATE bahasa
SET egids_level = CASE
    WHEN status_vitalitas = 'Aman' THEN '5 - Written'
    WHEN status_vitalitas = 'Rentan' THEN '6a - Vigorous'
    ELSE '6a - Vigorous'
  END
WHERE jumlah_penutur >= 1000000 AND jumlah_penutur < 10000000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 3: 500K-1M speakers (medium-large languages)
UPDATE bahasa
SET egids_level = CASE
    WHEN status_vitalitas = 'Aman' THEN '5 - Written'
    WHEN status_vitalitas = 'Rentan' THEN '6a - Vigorous'
    ELSE '6a - Vigorous'
  END
WHERE jumlah_penutur >= 500000 AND jumlah_penutur < 1000000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 4: 100K-500K speakers (medium languages)
UPDATE bahasa
SET egids_level = CASE
    WHEN status_vitalitas = 'Aman' THEN '6a - Vigorous'
    WHEN status_vitalitas = 'Rentan' THEN '6a - Vigorous'
    WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '6b - Threatened'
    ELSE '6b - Threatened'
  END
WHERE jumlah_penutur >= 100000 AND jumlah_penutur < 500000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 5: 50K-100K speakers (small-medium languages)
UPDATE bahasa
SET egids_level = CASE
    WHEN status_vitalitas = 'Aman' THEN '6a - Vigorous'
    WHEN status_vitalitas = 'Rentan' THEN '6b - Threatened'
    WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '7 - Shifting'
    ELSE '6b - Threatened'
  END
WHERE jumlah_penutur >= 50000 AND jumlah_penutur < 100000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 6: 10K-50K speakers (small languages)
UPDATE bahasa
SET egids_level = CASE
    WHEN status_vitalitas = 'Aman' THEN '6b - Threatened'
    WHEN status_vitalitas = 'Rentan' THEN '6b - Threatened'
    WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '7 - Shifting'
    ELSE '7 - Shifting'
  END
WHERE jumlah_penutur >= 10000 AND jumlah_penutur < 50000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 7: 1K-10K speakers (very small languages)
UPDATE bahasa
SET egids_level = CASE
    WHEN status_vitalitas = 'Rentan' THEN '7 - Shifting'
    WHEN status_vitalitas = 'Mengalami Kemunduran' THEN '8a - Moribund'
    ELSE '8a - Moribund'
  END
WHERE jumlah_penutur >= 1000 AND jumlah_penutur < 10000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 8: 100-1K speakers (critically small)
UPDATE bahasa
SET egids_level = '8a - Moribund'
WHERE jumlah_penutur >= 100 AND jumlah_penutur < 1000
  AND (egids_level IS NULL OR egids_level = '');

-- Tier 9: < 100 speakers (nearly extinct)
UPDATE bahasa
SET egids_level = '8b - Nearly Extinct'
WHERE jumlah_penutur > 0 AND jumlah_penutur < 100
  AND (egids_level IS NULL OR egids_level = '');

-- ============================================================
-- PASS 4: Vitality-only mapping (no speaker data)
-- For languages with status_vitalitas but no jumlah_penutur
-- ============================================================
UPDATE bahasa
SET egids_level = '5 - Written'
WHERE jumlah_penutur IS NULL
  AND status_vitalitas = 'Aman'
  AND (egids_level IS NULL OR egids_level = '');

UPDATE bahasa
SET egids_level = '6b - Threatened'
WHERE jumlah_penutur IS NULL
  AND status_vitalitas = 'Rentan'
  AND (egids_level IS NULL OR egids_level = '');

UPDATE bahasa
SET egids_level = '7 - Shifting'
WHERE jumlah_penutur IS NULL
  AND status_vitalitas = 'Mengalami Kemunduran'
  AND (egids_level IS NULL OR egids_level = '');

-- ============================================================
-- PASS 5: Institutional boost for languages with provinsi data
-- Languages with provinsi + significant speaker count get +1 level
-- Only applies to Level 6b that could be 6a with institutional support
-- ============================================================
UPDATE bahasa
SET egids_level = '6a - Vigorous'
WHERE egids_level = '6b - Threatened'
  AND provinsi IS NOT NULL
  AND jumlah_penutur >= 50000;

-- ============================================================
-- SUMMARY: Show classification results
-- ============================================================
SELECT
  egids_level,
  COUNT(*) as count,
  ROUND(AVG(jumlah_penutur) FILTER (WHERE jumlah_penutur IS NOT NULL), 0) as avg_speakers,
  MIN(jumlah_penutur) as min_speakers,
  MAX(jumlah_penutur) as max_speakers
FROM bahasa
WHERE egids_level IS NOT NULL
GROUP BY egids_level
ORDER BY egids_level;
