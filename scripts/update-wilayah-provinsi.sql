-- Update wilayah dan provinsi dari kolom catatan
UPDATE bahasa SET
  wilayah = CASE
    WHEN catatan LIKE '%Wilayah DapoBas: %' THEN REGEXP_REPLACE(SPLIT_PART(SPLIT_PART(catatan, 'Wilayah DapoBas: ', 2), ' | ', 1), '[,|].*$', '')
    WHEN catatan LIKE '%Wilayah: %' THEN REGEXP_REPLACE(SPLIT_PART(SPLIT_PART(catatan, 'Wilayah: ', 2), ' | ', 1), '[,|].*$', '')
    ELSE NULL
  END,
  provinsi = CASE
    WHEN catatan LIKE '%Provinsi DapoBas: %' THEN REGEXP_REPLACE(SPLIT_PART(SPLIT_PART(catatan, 'Provinsi DapoBas: ', 2), ',', 1), '[,|].*$', '')
    WHEN catatan LIKE '%Provinsi: %' THEN REGEXP_REPLACE(SPLIT_PART(SPLIT_PART(catatan, 'Provinsi: ', 2), ',', 1), '[,|].*$', '')
    ELSE NULL
  END
WHERE (wilayah IS NULL OR wilayah = '') AND (catatan LIKE '%Wilayah%' OR catatan LIKE '%Provinsi%');
