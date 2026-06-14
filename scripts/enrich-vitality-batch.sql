-- Enrichment: Batch update vitality for 49 unmatched languages
-- Single statement approach compatible with Supabase CLI

UPDATE bahasa
SET status_vitalitas = CASE LOWER(nama_bahasa)
  WHEN LOWER('Walsa') THEN 'Rentan'
  WHEN LOWER('Dajub') THEN 'Rentan'
  WHEN LOWER('Sentani') THEN 'Aman'
  WHEN LOWER('Tagalisa') THEN 'Rentan'
  WHEN LOWER('Aframa') THEN 'Rentan'
  WHEN LOWER('Gresi') THEN 'Rentan'
  WHEN LOWER('Kuri') THEN 'Rentan'
  WHEN LOWER('Meoswar') THEN 'Rentan'
  WHEN LOWER('Senggi') THEN 'Rentan'
  WHEN LOWER('Somu') THEN 'Rentan'
  WHEN LOWER('Modole') THEN 'Rentan'
  WHEN LOWER('Marori') THEN 'Rentan'
  WHEN LOWER('Seget') THEN 'Rentan'
  WHEN LOWER('Hatam') THEN 'Rentan'
  WHEN LOWER('Dra') THEN 'Rentan'
  WHEN LOWER('Karas') THEN 'Rentan'
  WHEN LOWER('Ngguntar') THEN 'Rentan'
  WHEN LOWER('Tehit') THEN 'Rentan'
  WHEN LOWER('Arguni') THEN 'Rentan'
  WHEN LOWER('Bku') THEN 'Rentan'
  WHEN LOWER('Dubu') THEN 'Rentan'
  WHEN LOWER('Irarutu') THEN 'Rentan'
  WHEN LOWER('Kalabra') THEN 'Rentan'
  WHEN LOWER('Mander') THEN 'Rentan'
  WHEN LOWER('Namla') THEN 'Rentan'
  WHEN LOWER('Podena') THEN 'Rentan'
  WHEN LOWER('Benggaulu') THEN 'Rentan'
  WHEN LOWER('Mansim Borai') THEN 'Rentan'
  WHEN LOWER('Mawes') THEN 'Rentan'
  WHEN LOWER('Tandia') THEN 'Rentan'
  WHEN LOWER('Minahasa') THEN 'Aman'
  WHEN LOWER('Lemolang') THEN 'Rentan'
  WHEN LOWER('Massenrengpulu') THEN 'Rentan'
  WHEN LOWER('Ponosakan') THEN 'Rentan'
  WHEN LOWER('Sangihe Talaud') THEN 'Aman'
  WHEN LOWER('Pedamaran') THEN 'Aman'
  WHEN LOWER('Enggano') THEN 'Rentan'
  WHEN LOWER('Saleman') THEN 'Rentan'
  WHEN LOWER('Yalahatan') THEN 'Rentan'
  WHEN LOWER('Teon') THEN 'Rentan'
  WHEN LOWER('Nedebang') THEN 'Rentan'
  WHEN LOWER('Meher') THEN 'Rentan'
  WHEN LOWER('Tenggalan') THEN 'Rentan'
  WHEN LOWER('Bajau Tungkal Satu') THEN 'Rentan'
  WHEN LOWER('Makleu') THEN 'Rentan'
  WHEN LOWER('Samasuru') THEN 'Rentan'
  WHEN LOWER('Berangas') THEN 'Rentan'
  WHEN LOWER('Saponi') THEN 'Rentan'
  WHEN LOWER('Kaiely') THEN 'Rentan'
  ELSE status_vitalitas
END,
catatan = CASE LOWER(nama_bahasa)
  WHEN LOWER('Walsa') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Dajub') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Sentani') THEN COALESCE(catatan, '') || E'\nBahasa utama di Papua, EGIDS 5 (Developing)'
  WHEN LOWER('Tagalisa') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Aframa') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Gresi') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Kuri') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Meoswar') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Senggi') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Somu') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Modole') THEN COALESCE(catatan, '') || E'\nBahasa di Halmahera Utara'
  WHEN LOWER('Marori') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Seget') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Hatam') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Dra') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Karas') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Ngguntar') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Tehit') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Arguni') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Bku') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Dubu') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Irarutu') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Kalabra') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Mander') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Namla') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Podena') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Benggaulu') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Mansim Borai') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Mawes') THEN COALESCE(catatan, '') || E'\nBahasa di Papua, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Tandia') THEN COALESCE(catatan, '') || E'\nBahasa di Papua Barat'
  WHEN LOWER('Minahasa') THEN COALESCE(catatan, '') || E'\nBahasa utama di Sulawesi Utara, EGIDS 5 (Developing)'
  WHEN LOWER('Lemolang') THEN COALESCE(catatan, '') || E'\nBahasa di Sulawesi Selatan'
  WHEN LOWER('Massenrengpulu') THEN COALESCE(catatan, '') || E'\nBahasa di Sulawesi Selatan'
  WHEN LOWER('Ponosakan') THEN COALESCE(catatan, '') || E'\nBahasa di Sulawesi Utara'
  WHEN LOWER('Sangihe Talaud') THEN COALESCE(catatan, '') || E'\nBahasa regional di Sulawesi Utara, EGIDS 5 (Developing)'
  WHEN LOWER('Pedamaran') THEN COALESCE(catatan, '') || E'\nBahasa di Sumatera Selatan, EGIDS 6a (Vigorous)'
  WHEN LOWER('Enggano') THEN COALESCE(catatan, '') || E'\nBahasa di Pulau Enggano, Bengkulu'
  WHEN LOWER('Saleman') THEN COALESCE(catatan, '') || E'\nBahasa di Seram, Maluku'
  WHEN LOWER('Yalahatan') THEN COALESCE(catatan, '') || E'\nBahasa di Seram, Maluku'
  WHEN LOWER('Teon') THEN COALESCE(catatan, '') || E'\nBahasa di Maluku, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Nedebang') THEN COALESCE(catatan, '') || E'\nBahasa di NTT (Alor)'
  WHEN LOWER('Meher') THEN COALESCE(catatan, '') || E'\nBahasa di NTT, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Tenggalan') THEN COALESCE(catatan, '') || E'\nBahasa di Kalimantan'
  WHEN LOWER('Bajau Tungkal Satu') THEN COALESCE(catatan, '') || E'\nBahasa Bajau di Sulawesi/Kalimantan'
  WHEN LOWER('Makleu') THEN COALESCE(catatan, '') || E'\nBahasa minoritas, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Samasuru') THEN COALESCE(catatan, '') || E'\nBahasa minoritas, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Berangas') THEN COALESCE(catatan, '') || E'\nBahasa minoritas, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Saponi') THEN COALESCE(catatan, '') || E'\nBahasa minoritas, dari Statistik Kebahasaan 2023'
  WHEN LOWER('Kaiely') THEN COALESCE(catatan, '') || E'\nBahasa minoritas, dari Statistik Kebahasaan 2023'
  ELSE catatan
END,
diperbarui_pada = NOW()
WHERE LOWER(nama_bahasa) IN (
  LOWER('Walsa'), LOWER('Dajub'), LOWER('Sentani'), LOWER('Tagalisa'), LOWER('Aframa'), LOWER('Gresi'), LOWER('Kuri'), LOWER('Meoswar'), LOWER('Senggi'), LOWER('Somu'), LOWER('Modole'), LOWER('Marori'), LOWER('Seget'), LOWER('Hatam'), LOWER('Dra'), LOWER('Karas'), LOWER('Ngguntar'), LOWER('Tehit'), LOWER('Arguni'), LOWER('Bku'), LOWER('Dubu'), LOWER('Irarutu'), LOWER('Kalabra'), LOWER('Mander'), LOWER('Namla'), LOWER('Podena'), LOWER('Benggaulu'), LOWER('Mansim Borai'), LOWER('Mawes'), LOWER('Tandia'), LOWER('Minahasa'), LOWER('Lemolang'), LOWER('Massenrengpulu'), LOWER('Ponosakan'), LOWER('Sangihe Talaud'), LOWER('Pedamaran'), LOWER('Enggano'), LOWER('Saleman'), LOWER('Yalahatan'), LOWER('Teon'), LOWER('Nedebang'), LOWER('Meher'), LOWER('Tenggalan'), LOWER('Bajau Tungkal Satu'), LOWER('Makleu'), LOWER('Samasuru'), LOWER('Berangas'), LOWER('Saponi'), LOWER('Kaiely')
)
AND (status_vitalitas IS NULL OR status_vitalitas = '');

-- Insert languages not yet in database
INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Walsa', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Walsa'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Dajub', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Dajub'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Sentani', 'Aman', 'Bahasa utama di Papua, EGIDS 5 (Developing)', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Sentani'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tagalisa', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tagalisa'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Aframa', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Aframa'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Gresi', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Gresi'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Kuri', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Kuri'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Meoswar', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Meoswar'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Senggi', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Senggi'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Somu', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Somu'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Modole', 'Rentan', 'Bahasa di Halmahera Utara', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Modole'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Marori', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Marori'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Seget', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Seget'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Hatam', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Hatam'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Dra', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Dra'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Karas', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Karas'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Ngguntar', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Ngguntar'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tehit', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tehit'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Arguni', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Arguni'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Bku', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Bku'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Dubu', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Dubu'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Irarutu', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Irarutu'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Kalabra', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Kalabra'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Mander', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Mander'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Namla', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Namla'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Podena', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Podena'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Benggaulu', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Benggaulu'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Mansim Borai', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Mansim Borai'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Mawes', 'Rentan', 'Bahasa di Papua, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Mawes'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tandia', 'Rentan', 'Bahasa di Papua Barat', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tandia'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Minahasa', 'Aman', 'Bahasa utama di Sulawesi Utara, EGIDS 5 (Developing)', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Minahasa'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Lemolang', 'Rentan', 'Bahasa di Sulawesi Selatan', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Lemolang'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Massenrengpulu', 'Rentan', 'Bahasa di Sulawesi Selatan', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Massenrengpulu'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Ponosakan', 'Rentan', 'Bahasa di Sulawesi Utara', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Ponosakan'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Sangihe Talaud', 'Aman', 'Bahasa regional di Sulawesi Utara, EGIDS 5 (Developing)', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Sangihe Talaud'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Pedamaran', 'Aman', 'Bahasa di Sumatera Selatan, EGIDS 6a (Vigorous)', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Pedamaran'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Enggano', 'Rentan', 'Bahasa di Pulau Enggano, Bengkulu', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Enggano'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Saleman', 'Rentan', 'Bahasa di Seram, Maluku', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Saleman'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Yalahatan', 'Rentan', 'Bahasa di Seram, Maluku', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Yalahatan'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Teon', 'Rentan', 'Bahasa di Maluku, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Teon'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Nedebang', 'Rentan', 'Bahasa di NTT (Alor)', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Nedebang'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Meher', 'Rentan', 'Bahasa di NTT, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Meher'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Tenggalan', 'Rentan', 'Bahasa di Kalimantan', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Tenggalan'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Bajau Tungkal Satu', 'Rentan', 'Bahasa Bajau di Sulawesi/Kalimantan', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Bajau Tungkal Satu'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Makleu', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Makleu'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Samasuru', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Samasuru'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Berangas', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Berangas'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Saponi', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Saponi'));

INSERT INTO bahasa (nama_bahasa, status_vitalitas, catatan, dibuat_pada, diperbarui_pada)
SELECT 'Kaiely', 'Rentan', 'Bahasa minoritas, dari Statistik Kebahasaan 2023', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM bahasa WHERE LOWER(nama_bahasa) = LOWER('Kaiely'));
