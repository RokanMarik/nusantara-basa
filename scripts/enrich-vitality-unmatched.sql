-- Enrichment: Update vitality status for unmatched languages from Statistik Kebahasaan 2023
-- Generated from unmatched-vitality-languages.json with manual research
-- Total: 57 languages processed

BEGIN;

-- 1. Walsa
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Walsa')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Walsa', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Walsa')
);

-- 2. Dajub
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Dajub')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Dajub', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Dajub')
);

-- 3. Sentani
UPDATE bahasa 
SET status_vitalitas = 'Aman',
    catatan = COALESCE(catatan, '') || E'
Bahasa utama di Papua, EGIDS 5 (Developing), ratusan ribu penutur',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Sentani')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Sentani', 'Aman', 'Bahasa utama di Papua, EGIDS 5 (Developing), ratusan ribu penutur', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Sentani')
);

-- 4. Tagalisa
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Tagalisa')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tagalisa', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tagalisa')
);

-- 5. Aframa
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Aframa')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Aframa', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Aframa')
);

-- 6. Gresi
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Gresi')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Gresi', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Gresi')
);

-- 7. Kuri
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Kuri')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Kuri', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Kuri')
);

-- 8. Meoswar
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Meoswar')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Meoswar', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Meoswar')
);

-- 9. Minahasa
UPDATE bahasa 
SET status_vitalitas = 'Aman',
    catatan = COALESCE(catatan, '') || E'
Bahasa utama di Sulawesi Utara, EGIDS 5 (Developing), ratusan ribu penutur',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Minahasa')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Minahasa', 'Aman', 'Bahasa utama di Sulawesi Utara, EGIDS 5 (Developing), ratusan ribu penutur', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Minahasa')
);

-- 10. Senggi
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Senggi')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Senggi', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Senggi')
);

-- 11. Somu
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Somu')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Somu', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Somu')
);

-- 12. Modole
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Halmahera Utara, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Modole')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Modole', 'Rentan', 'Bahasa di Halmahera Utara, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Modole')
);

-- 13. Marori
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Marori')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Marori', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Marori')
);

-- 14. Seget
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Seget')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Seget', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Seget')
);

-- 15. Hatam
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Hatam')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Hatam', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Hatam')
);

-- 16. Lemolang
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Sulawesi Selatan, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Lemolang')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Lemolang', 'Rentan', 'Bahasa di Sulawesi Selatan, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Lemolang')
);

-- 17. Saleman
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Seram, Maluku, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Saleman')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Saleman', 'Rentan', 'Bahasa di Seram, Maluku, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Saleman')
);

-- 18. Yalahatan
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Seram, Maluku, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Yalahatan')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Yalahatan', 'Rentan', 'Bahasa di Seram, Maluku, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Yalahatan')
);

-- 19. Dra
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Dra')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Dra', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Dra')
);

-- 20. Karas
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Karas')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Karas', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Karas')
);

-- 21. Massenrengpulu
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Sulawesi Selatan, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Massenrengpulu')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Massenrengpulu', 'Rentan', 'Bahasa di Sulawesi Selatan, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Massenrengpulu')
);

-- 22. Ngguntar
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Ngguntar')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Ngguntar', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Ngguntar')
);

-- 23. Pedamaran
UPDATE bahasa 
SET status_vitalitas = 'Aman',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Sumatera Selatan, EGIDS 6a (Vigorous)',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Pedamaran')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Pedamaran', 'Aman', 'Bahasa di Sumatera Selatan, EGIDS 6a (Vigorous)', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Pedamaran')
);

-- 24. Tehit
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Tehit')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tehit', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tehit')
);

-- 25. Tenggalan
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Kalimantan, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Tenggalan')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tenggalan', 'Rentan', 'Bahasa di Kalimantan, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tenggalan')
);

-- 26. Arguni
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Arguni')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Arguni', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Arguni')
);

-- 27. Bajau Tungkal Satu
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa Bajau di Sulawesi/Kalimantan, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Bajau Tungkal Satu')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Bajau Tungkal Satu', 'Rentan', 'Bahasa Bajau di Sulawesi/Kalimantan, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Bajau Tungkal Satu')
);

-- 28. Bku
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Bku')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Bku', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Bku')
);

-- 29. Dubu
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Dubu')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Dubu', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Dubu')
);

-- 30. Irarutu
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Irarutu')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Irarutu', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Irarutu')
);

-- 31. Kalabra
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Kalabra')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Kalabra', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Kalabra')
);

-- 32. Makleu
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa minoritas, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Makleu')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Makleu', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Makleu')
);

-- 33. Mander
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Mander')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Mander', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Mander')
);

-- 34. Minahasa
UPDATE bahasa 
SET status_vitalitas = 'Aman',
    catatan = COALESCE(catatan, '') || E'
Bahasa utama di Sulawesi Utara, EGIDS 5 (Developing), ratusan ribu penutur',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Minahasa')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Minahasa', 'Aman', 'Bahasa utama di Sulawesi Utara, EGIDS 5 (Developing), ratusan ribu penutur', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Minahasa')
);

-- 35. Namla
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Namla')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Namla', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Namla')
);

-- 36. Nedebang
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di NTT (Alor), dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Nedebang')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Nedebang', 'Rentan', 'Bahasa di NTT (Alor), dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Nedebang')
);

-- 37. Podena
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Podena')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Podena', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Podena')
);

-- 38. Ponosakan
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Sulawesi Utara, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Ponosakan')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Ponosakan', 'Rentan', 'Bahasa di Sulawesi Utara, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Ponosakan')
);

-- 39. Samasuru
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa minoritas, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Samasuru')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Samasuru', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Samasuru')
);

-- 40. Sangihe Talaud
UPDATE bahasa 
SET status_vitalitas = 'Aman',
    catatan = COALESCE(catatan, '') || E'
Bahasa regional di Sulawesi Utara, EGIDS 5 (Developing)',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Sangihe Talaud')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Sangihe Talaud', 'Aman', 'Bahasa regional di Sulawesi Utara, EGIDS 5 (Developing)', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Sangihe Talaud')
);

-- 41. Enggano
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Pulau Enggano, Bengkulu, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Enggano')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Enggano', 'Rentan', 'Bahasa di Pulau Enggano, Bengkulu, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Enggano')
);

-- 42. Teon
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Maluku, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Teon')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Teon', 'Rentan', 'Bahasa di Maluku, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Teon')
);

-- 43. Benggaulu
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Benggaulu')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Benggaulu', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Benggaulu')
);

-- 44. Berangas
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa minoritas, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Berangas')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Berangas', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Berangas')
);

-- 45. Mansim Borai
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Mansim Borai')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Mansim Borai', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Mansim Borai')
);

-- 46. Meher
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di NTT, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Meher')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Meher', 'Rentan', 'Bahasa di NTT, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Meher')
);

-- 47. Loon
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa minoritas, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Loon')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Loon', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Loon')
);

-- 48. Saponi
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa minoritas, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Saponi')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Saponi', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Saponi')
);

-- 49. Kaiely
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa minoritas, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Kaiely')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Kaiely', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Kaiely')
);

-- 50. Mawes
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Mawes')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Mawes', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Mawes')
);

-- 51. Tandia
UPDATE bahasa 
SET status_vitalitas = 'Rentan',
    catatan = COALESCE(catatan, '') || E'
Bahasa di Papua Barat, dari Statistik Kebahasaan 2023',
    diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) = LOWER('Tandia')
  AND (status_vitalitas IS NULL OR status_vitalitas = '');

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tandia', 'Rentan', 'Bahasa di Papua Barat, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tandia')
);


COMMIT;

-- Summary: 51 languages processed, 6 skipped
-- Skipped: Toba , Beka k, kategori kri s, Le , Re a, Ho 