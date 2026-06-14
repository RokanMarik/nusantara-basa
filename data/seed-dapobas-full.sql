-- DapoBas Import Script
-- Generated: 2026-06-14T11:11:03.349Z
-- Matched: 107, New: 603

-- ============================================================
-- UPDATE existing languages with DapoBas wilayah/provinsi
-- ============================================================
UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'd6afc9f2-dc28-47ec-b1f9-8ff71d212d86';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Aceh'
  ),
  diperbarui_pada = NOW()
WHERE id = '1033d7ce-5b00-444f-9cc0-d896739d8050';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '5fa74840-5489-4a7d-ae27-6d3ff6f62813';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '6ce6d347-2f87-46e7-8d03-0867b7922c70';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '3264ca01-dd8e-4107-9a7d-c73faa794b05';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '150b9f85-1fee-44aa-bd45-a41f64d1e36d';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Tengah,  Kalimantan Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = 'c4f8d6bf-87b8-4531-a6b2-7c76ab72dd28';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra, Jawa dan Bali, Kalimantan, Sulawesi, Nusa Tenggara Barat | Provinsi DapoBas: Lampung,  Bali,  Kalimantan Tengah,  Sulawesi Tenggara,  Nusa Tenggara Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '95d6dbca-e66b-478e-af5f-d5e2dcc1e68f';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = '80c3357c-c298-49c2-8e26-9c39d65fbfae';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = 'f37d4f1b-8205-4b59-88a9-e587cac804d7';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra, Kalimantan | Provinsi DapoBas: Riau,  Jambi,  Kalimantan Tengah,  Kalimantan Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = '69dcf918-a599-4515-a42d-51193e1631fc';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '9b365147-ab2f-4fec-bad9-d57c4f686274';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = 'f7b153e6-a268-4c22-90c0-f47092e57abf';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = 'f69c4721-2f91-47fe-8267-ba65f362e48b';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra, Jawa dan Bali, Kalimantan, Sulawesi, Nusa Tenggara Barat | Provinsi DapoBas: Riau,  Jambi,  Lampung,  DKI Jakarta,  Kalimantan Selatan,  Kalimantan Timur,  Kalimantan Utara,  Sulawesi Tengah,  Sulawesi Selatan,  Nusa Tenggara Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '862a2f92-dc9d-49aa-a434-5427411bc9fd';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '0eabe8ec-d614-4f82-bf45-65aaa134bcdf';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '1acb1639-6ef3-486c-b45d-6a28e11f4bb4';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = '3e2ba49c-0665-4a2f-b412-67244a864ca4';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '1e5f1403-d942-47a0-9956-d0a027aa45ac';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '5849f474-5e30-4f78-b547-fbc8240b6e27';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = 'af6ed1de-c0cc-4686-ab03-69561824ac03';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '64c327a5-5277-442a-ba6e-7a48d7d14560';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '3367758e-af2a-4686-b261-10e3828fd07a';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Aceh'
  ),
  diperbarui_pada = NOW()
WHERE id = 'dc2ea814-ba4b-4ac5-a232-002833495cb5';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '0f96e761-5171-4dc1-b6df-54e7838e8d2b';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = 'a14ad6f3-70e0-4b57-8da0-0d3f9fc0c450';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = 'dadf00b4-6429-435c-9cdd-ce3e9eda148d';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = '0559628c-90e8-4b94-a8f4-035a0038295c';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '421b59ee-960b-4bf0-8c29-af0c3e95eef6';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = 'ffc0e58a-d546-411c-ae44-f983d0bf8725';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Aceh'
  ),
  diperbarui_pada = NOW()
WHERE id = '75e4b7b4-ac9f-4f2f-88a3-675a705048f6';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Utara,  Gorontalo'
  ),
  diperbarui_pada = NOW()
WHERE id = '8a0535f4-0e4f-4f66-8a88-f8612b68d145';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = 'b51e9096-9032-40d2-a0e5-717db360fb4e';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = '2cf2d23a-4cd2-4d6f-a24f-1d7c335b558c';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = 'ad623abe-ab7e-4f8c-8057-cfee693851a3';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra, Jawa dan Bali, Kalimantan, Sulawesi, Nusa Tenggara Barat | Provinsi DapoBas: Aceh,  Sumatra Utara,  Jambi,  Sumatra Selatan,  Bengkulu,  Lampung,  Jawa Barat,  Jawa Tengah,  Daerah Istimewa Yogyakarta,  Jawa Timur,  Banten,  Bali,  Kalimantan Selatan,  Kalimantan Timur,  Sulawesi Tenggara,  Nusa Tenggara Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '7489e0dd-7df3-4a06-b1fb-79f97186c5ce';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '62ff1ba3-aa1f-476e-a6fb-18c96f60b26e';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '8f33b004-b2e7-4b65-9baf-11ca384cbfd1';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = 'd4480bc2-4c49-4c81-a8a7-cc0930dcb5fa';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '5e772371-1c3b-4f78-bc45-cadea1d5a78a';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = 'e8359523-1ced-4759-96f1-dfa2f269d505';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '58bf655c-bbfc-40cd-85c6-633bdd80956e';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '2f9baab0-71f1-46c6-a010-4d808a9d79b6';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '92d3e6d2-468a-440e-bc58-bd1bcc5cb6f3';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '5d95cad0-c9fe-4333-ad42-c11843de154c';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Jambi'
  ),
  diperbarui_pada = NOW()
WHERE id = '531a1bea-3284-4486-a123-058198ce88d0';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '61a0b7d1-6c72-4ad6-9345-e9add5ef24f6';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '2fea518c-9a6d-4ca3-a1f6-691dd0c11b42';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = 'eb9920fc-bf24-485c-9aad-7731f87a9d15';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Sumatra Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = '783a40c2-0de1-412f-8688-334082ebb4c4';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = '78ee3ed4-2c5f-4bdf-85c5-8c57eb40a484';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tenggara'
  ),
  diperbarui_pada = NOW()
WHERE id = '6aa250b5-0492-4642-808e-871293ee1d45';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = '7ff48138-e3bf-4453-9384-69216ff7a44b';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = 'f21ee1ee-79dd-4bfe-ab38-40192dc5ea29';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '6cf3ad5b-719b-4c70-829b-0361d5fa2549';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Sumatra Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = 'e7e80c7c-1369-47bd-a140-335caeace819';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = '61e6cd2d-04e0-45b6-86de-5ee84e809aae';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = 'dc1351ce-9d08-42c3-9b1a-ab492c9add42';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Jawa dan Bali, Nusa Tenggara Barat | Provinsi DapoBas: Jawa Timur,  Bali,  Nusa Tenggara Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '4d241198-414f-4118-b2e0-34076ac8dd35';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi, Nusa Tenggara Barat | Provinsi DapoBas: Sulawesi Selatan,  Nusa Tenggara Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '5d05df7f-2de8-498e-afe4-091faa02e9f5';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'a90c249e-2899-4db7-a6cf-d761f686a371';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Selatan,  Sulawesi Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'ff4f28b9-982e-4285-8976-f7bac57197d4';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '8a2ed5d1-9d21-4308-807e-3ec799830442';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra, Jawa dan Bali, Kalimantan, Sulawesi, Nusa Tenggara Barat, Nusa Tenggara Timur, Maluku, Papua | Provinsi DapoBas: Sumatra Utara,  Riau,  Jambi,  Sumatra Selatan,  Kepulauan Bangka Belitung,  DKI Jakarta,  Bali,  Kalimantan Barat,  Kalimantan Tengah,  Kalimantan Timur,  Sulawesi Utara,  Nusa Tenggara Barat,  Nusa Tenggara Timur,  Maluku,  Maluku Utara,  Papua,  Kepulauan Riau'
  ),
  diperbarui_pada = NOW()
WHERE id = '6661f6cd-9456-4092-b7f7-b1530d7c8afd';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Sumatra Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '6170785c-c994-4119-a10a-1c916d76b47e';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'a1aa5e00-e1e5-4d04-90d1-4cd3cff54faa';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Aceh,  Sumatra Utara,  Sumatra Barat,  Riau,  Jambi,  Bengkulu'
  ),
  diperbarui_pada = NOW()
WHERE id = '47812bf9-e96b-4bc3-aacc-a3827c4c15f6';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = '6975d8b1-ad30-482c-8ede-56396f927481';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'f4e6abca-f94b-4e81-8fdc-fee3718cc31b';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'e60f0fd1-ff65-4bf6-8dfe-6b38dce9b68b';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tenggara'
  ),
  diperbarui_pada = NOW()
WHERE id = '455e675a-cfbf-43c8-9ee4-fefb94f8b2fd';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = 'a304af18-974f-42fd-9cc1-3ac30257791e';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Sumatra Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '482a8681-4e9c-4f3a-a58a-5474f82257bf';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Sumatra Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = '5c4a8956-a216-4994-a46e-b428401949a1';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '68d5478f-a48b-4137-89e7-27f35fece22c';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'b47b34c7-cc62-4890-b17c-c689454d9962';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '2aa21c16-2c59-4253-805b-f732e89c92ad';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '8f6510f5-088f-4a9f-9c6b-793ba83ab4cb';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = 'cbd9ad4e-037f-4526-9274-6e3e4d802373';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '6940dccd-9835-4ba5-ab7d-9b246bfeae54';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = '52d2bbe2-be5b-4230-beb9-4e5f298ee27c';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra | Provinsi DapoBas: Bengkulu'
  ),
  diperbarui_pada = NOW()
WHERE id = 'afb207e3-35fc-4d4f-9f06-fa95f0e9a163';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '6c9488d3-1db8-43a6-95c6-4b4749888009';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '3db00acb-e7a4-4d30-b540-0f3a347194cf';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '7cd87a67-d813-4649-b06d-930274989c82';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '69c628cc-cea4-4602-8940-8910be871e9e';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '6690315d-6116-48d7-bda6-4b8543d3e048';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi, Nusa Tenggara Barat | Provinsi DapoBas: Sulawesi Tenggara,  Nusa Tenggara Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '6384ca38-251d-437b-b918-1518016c5c12';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '3fd08112-2fea-4d70-9d1a-3cc5830c9045';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '91859ab4-269e-4748-b2e5-0364bfd6902f';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku'
  ),
  diperbarui_pada = NOW()
WHERE id = '11296819-9c77-4ecd-a7a1-b42f22019209';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = '82c21628-e3e2-4e5d-b0c3-7ff13f432749';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = 'c26ab07d-211a-467c-b08c-4ce71ade2fb8';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = 'fd90b1f8-0e2f-40ab-a875-dfca8c5d009d';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sumatra, Jawa dan Bali, Sulawesi | Provinsi DapoBas: Bengkulu,  Lampung,  DKI Jakarta,  Jawa Barat,  Jawa Tengah,  Banten,  Sulawesi Tenggara'
  ),
  diperbarui_pada = NOW()
WHERE id = 'd275b290-d527-46f3-a5e5-f9c98adb75d3';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = 'd43f031b-6965-43cd-b213-dc874d16b154';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '595966a0-156b-42dd-8a45-b293c0bff379';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Nusa Tenggara Timur | Provinsi DapoBas: Nusa Tenggara Timur'
  ),
  diperbarui_pada = NOW()
WHERE id = '57ef4b32-a336-4b8b-8168-43ef695e5a0e';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '319af0d9-7e27-4920-ade4-6186587d7092';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Kalimantan | Provinsi DapoBas: Kalimantan Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = '3c723b53-4472-45f7-b9a4-e74f4075e2e1';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Maluku | Provinsi DapoBas: Maluku Utara'
  ),
  diperbarui_pada = NOW()
WHERE id = 'd685ab83-7bd5-492c-8358-c88fd881ed8c';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tenggara'
  ),
  diperbarui_pada = NOW()
WHERE id = '46b4a223-0c75-4f06-9a17-56666140cab4';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Barat'
  ),
  diperbarui_pada = NOW()
WHERE id = '449bcb02-f3a7-467d-aa92-e6fc8390aeb6';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Selatan'
  ),
  diperbarui_pada = NOW()
WHERE id = '55be6698-43a4-4264-bb2c-dff044811d04';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tengah'
  ),
  diperbarui_pada = NOW()
WHERE id = '9a194e36-ab47-443c-8624-a2f2ad64c928';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Sulawesi | Provinsi DapoBas: Sulawesi Tenggara'
  ),
  diperbarui_pada = NOW()
WHERE id = 'beec6b6a-4f56-45f1-b168-02edee0be0bf';

UPDATE bahasa SET
  catatan = CONCAT(
    CASE WHEN catatan IS NOT NULL AND catatan != '' THEN catatan || ' | ' ELSE '' END,
    'Wilayah DapoBas: Papua | Provinsi DapoBas: Papua'
  ),
  diperbarui_pada = NOW()
WHERE id = 'c2d1d2db-5be8-4c7e-bce0-bb0c16a7774d';

-- ============================================================
-- INSERT new languages from DapoBas
-- ============================================================
INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Abai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Abrap',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Abui',
  'Aboa',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Abun Gii',
  'Abun Jii',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Abun Ji',
  'Karon Pantai',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Adagum',
  'Citak Wagabus',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Afilaup',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Aframa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Air Matoa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Airo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Airoran',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ale',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Alune',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Amathamit',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ambai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ambalau',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ambel',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Amber',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Amungkal',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Anakalang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Anasi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ansus-Papuma',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Anus',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Aoheng',
  'Penihing',
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Arakam',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Arandai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Are',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Arguni',
  'Taver',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Armati Sarma',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Arubos',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Arui-Mor',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'As',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Asmat Bets Mbup',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Asmat Safan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Asmat Sawa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Asmat Sirat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Asmat Unir Sirau',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Asmat Waijens',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Atam',
  'Temma',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Auye',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awban',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awe',
  'Maweyo, Kaburi',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awera',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awyu Anggai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awyu Darat Kotiak',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awyu Darat Yagatsu-Kiki',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awyu Laut',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awyu Meto',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Awyu Tokompatu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Baedate',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Baham',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bahau Diaq Lay',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bahau Ujoh Bilang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bajau Pondong',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bajau Semayap',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bajau Tungkal Satu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Jambi',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bajo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Jawa dan Bali, Sulawesi, Nusa Tenggara Barat, Nusa Tenggara Timur, Maluku | Provinsi: Jawa Timur,  Sulawesi Tengah,  Sulawesi Selatan,  Sulawesi Tenggara,  Gorontalo,  Nusa Tenggara Barat,  Nusa Tenggara Timur,  Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bajo Delang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bakatik',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Balaesang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Balai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Balantak',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Balkewan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bantik',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Barakai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Barapasi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Baras',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Basap',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Basemah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Lampung',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Batak',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Aceh,  Sumatra Utara,  Sumatra Barat,  Riau',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Batanta',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Batero',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Batu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Batuley',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bawija',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bayan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bedoanas',
  'Baruan-Erokwanas',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Beneraf',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Benggaulu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bengkulu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Bengkulu',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Benuaq',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Berangas',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Berbai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Berik',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Beser',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Beser Swaimbon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Besoa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Beyaboa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bian Marind Deg',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bima',
  'Mbojo',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Barat | Provinsi: Nusa Tenggara Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Biritai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Biyekwok',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bku',
  'Bgu',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Blagar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Blue Klesi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bobar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Boi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Boing',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bolaang Mongondow',
  'Bolmong',
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bonoi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bora-Bora',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bouram',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Buagani',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Budong-Budong',
  'Tangkou',
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bugis De',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Buli',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Bulungan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Buna',
  'Bunak',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Buol',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Burate',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Burukmakot',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Burumeso',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Busami',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Cia-Cia',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tenggara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Culambacu',
  'Tulambatu',
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tenggara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dabe',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dabra',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Daikat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dajub',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Damar Timur',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Damban',
  'Ndamban',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dani Atas',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dani Bawah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dani Bokondini',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dani Tengah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Daranto',
  'Deranto',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dasigo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dawan',
  'Timor',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dawelor',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dayak Bara Injey',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dayak Baream',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dayak Kapuas',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dayak Pulau Telo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dayak Sei Dusun',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Deing',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dem',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Diae',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dinana',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dintere',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Diuwe',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dobel',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dra',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dubu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dulolong',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dusner',
  'Usner',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dusun Deyah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Dusun Kalahien',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Duvle',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Efpan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Eik',
  'Foau',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Eipumek',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Elnama',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Elseng',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Elseng Koarjap',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Emem',
  'Emumu',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Enggano',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Bengkulu',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Engkalembu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Esaro',
  'Kawit',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Etik',
  'Barto,Maria',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Fakafuku',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Fayu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Fermanggem',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Fkour',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Fokri',
  'Hokli',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Fordata',
  'Iyaru',
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Galik',
  'Golik',
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Gaura',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Girimora',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Gorap',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Gua',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Gufinti',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Hatam',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Hatam Mole',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Helong',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Hewa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Hubla',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Iau',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ibu',
  'Ibo',
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Iha',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Illiun',
  'Il’iiuun',
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Imbuti',
  'Marind',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Imiyan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Inanwatan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Inora',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Intamaja',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Irarutu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Irarutu Bofuer',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Irawa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Irires',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Isirawa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Jair',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Jamor',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Jelako',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Jinak',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Joerat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Jorop',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Juvutek',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kadi',
  'Muyu Utara',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kadorih',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kaera',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kafoa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kaham',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kaiely',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kaigar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kais',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kaiya',
  'Kaiy',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kalabra',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kalamang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kalela',
  'Kawela',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kambera Pandawai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kamberau',
  'Bauana',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kambran',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kamindip',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kanum Barkari',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kapayap',
  'Soko Benanu',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kapori',
  'Kapauri',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kaptiau',
  'Kapitiau',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Karas',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Karey',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Karon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Karufo Auf',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kaureh',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kawera',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kawiyet',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kayaan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kayo Pulau',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kayu Agung',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Sumatra Selatan,  Kepulauan Bangka Belitung',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kei',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kejer Manirem',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kekawia',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kemberano',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kemtuk',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kenyah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur,  Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kenyam Niknene',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Keuw',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kimaam',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kimagima',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kimki',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kiraman',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kiri-Kiri',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kitum',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kiwai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Klamu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Klesi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Klon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Klufo',
  'Krowai Rawa, Krowai Umum',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kodi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kofey',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Koiwai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kokoda',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kola',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kolana',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kombai Kali',
  'Tajan',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Komela',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Komodo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Komolom',
  'Mombun',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kompane',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Komyandaret',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kone-Konee',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Konerau',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kopkaka',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kopkaka Seredela',
  'Kopkaga Seredela',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Korowai Baigun',
  'Atigun',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Korowai Karuwage',
  'Korowage',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Korowai Selatan',
  'Korowai Lumpur/Klufwo Auf Umbale',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kui',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kulatera',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kulawi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kur',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kuri',
  'Nabi',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kurudu',
  'Myobo',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kwari',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kwer',
  'Kofet/Kwet',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kwerba',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kwesten Arare',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Kwinsu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Labala',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lamatuka',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lamboya',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lampung',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Lampung',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lampung Cikoneng',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Jawa dan Bali | Provinsi: Banten',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lasalimu-Kamaru',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tenggara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lauje Malala',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lawangan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah,  Kalimantan Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Leinam',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lemolang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lepki',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Letti',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lewuka',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Liki',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lio',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lola',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lona',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Long Pulung',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Loon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Lura',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Maanyan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah,  Kalimantan Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Maibrat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mairasi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Maisomara',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Makatian',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Makean Dalam',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Makean Luar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Makleu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mamasa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mambora',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mandarin Ampenan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Barat | Provinsi: Nusa Tenggara Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mandarin DKI Jakarta',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Jawa dan Bali | Provinsi: DKI Jakarta',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mander',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mandobo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mandobo Bawah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mandobo Tengah',
  'Kop Kambo',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Manem',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mansim Borai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Manua',
  'Eritai',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Manulea',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Marap',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Maraw',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mare',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Marita',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Marlasi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Marori',
  'Morori',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Marsela Barat',
  'Masela Barat',
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Marsela Tengah',
  'Masela Tengah',
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Marsela Timur',
  'Masela Timur',
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Masarete',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Masep',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Masimasi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Massenrengpulu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Matbat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Matlow',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mawes Dey',
  'Mawesdey',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mawes Wares',
  'Maweswares',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Maya Legenyan-Kawei',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mee Ugia',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mee Wosokuno',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mek Kosarek',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mek Naica',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mek Nipsan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mentaya',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Miere',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Minahasa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara,  Gorontalo',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Minahasa Tonsawang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Minahasa Tonsea',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mnanggi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Modole',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Moi Maniwo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Moi Sigin',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Molof',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Momuna',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Moni Bibida',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Moni-Kegouda',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Monuna Samboga',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mooi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mor',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Moraid',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Morunene',
  'Moronene',
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tenggara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Motu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Mpur Pantai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Munggui',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Muri',
  'Mer',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Murkim',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Muyu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Muyu Selatan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nage',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nagi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nalik Selatan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Namak',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Namalu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Namas',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Namblong',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Namla',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Namut',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Napiti',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Napiti Pantai-Busama',
  'Napiti Pantai',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Narau',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nare',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Naulu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ndao',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ndarame',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ndauwa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ndom',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ndora',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nedebang',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ngada',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ngalum',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nggem',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ngguntar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ngkalembu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nila',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ningrum',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nobuk',
  'Kwerba',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nosaudare',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nubuai-Waren',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Numfor',
  'Mansinam',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Nyaw',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Obokuitai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Oedate',
  'Kerema',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Oirata',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Okpari',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Omesuri',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ormu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Oroyliye',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Orya',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Palamul',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Palu e',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pasan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pasir',
  'Paser',
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pedamaran',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Sumatra Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pigapu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pijin',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Piliana',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pipikoro',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pokoro',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ponosakan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pulo',
  'Wakatobi',
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tenggara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Punan Long Lamcin',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Punan Merah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Punan Paking',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pupis',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Pura',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Puragi-Saga',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Raijua',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Rarankwa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Retta',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Riantana',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ribun',
  'Rihun',
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ro',
  'Ru',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ron',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Roswar',
  'Saref',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Rote',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sabakor',
  'Buruwai',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Saban',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sabu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sagapu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Salafen Matbat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Salas',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Saleman',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Salkma',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Saman',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Samasuru',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Samate',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Samihin',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sangihe Talaud',
  'Satal',
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Utara,  Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Saponi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sasak Bali',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Jawa dan Bali | Provinsi: Bali',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sasawa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Saurisirami',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sause-Ures',
  'Barazre',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Saweru',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sawi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'See',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Segaai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Segar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Seget',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sekar-Onim',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Seko',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah,  Sulawesi Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Selegof',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Seluwarsa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Senggi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sentani',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Seram',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Serili',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Serua',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Serui Laut',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sigulai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sumatra | Provinsi: Aceh',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sikari',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sikka',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Silimo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sipisi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Skou',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Smarki Kanum',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'So a',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Soba',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sobey Wakde',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Somu',
  'Toro',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Soon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sorabi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sou',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sough',
  'Manikion',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sough Bohon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sowiwa',
  'Morowa',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Soytai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Srum',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sudate',
  'Sehudate',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sumba Barat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sumbawa',
  'Samawa',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Barat | Provinsi: Nusa Tenggara Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sumuri',
  'Sumuri',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Sunum',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Taa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tabahair',
  'Bipim, Bipin',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tabla',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tabundung',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tagalisa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Taliabu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tamakuri',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tamer Tunai',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tamuan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tandia',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tangko',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tapea',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tarangan Barat',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tarangan Timur',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tarfia',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tause',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tawu Ane',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tebako',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tefanma',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tefaro',
  'Demba',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tehit',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tehit Dit',
  'Tehit Tua',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Telaah Babar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Telepe',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tenggalan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Teon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tepin',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tetun',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tevera Pew',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tewa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tobati',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tombatu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tomor',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Torweja',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Totoberi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Towe',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Trimuris-Bagusa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tsaukwambo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Tunjung',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ulakin',
  'Ulakuno',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Uma Lung',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Utara',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Una',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Ure',
  'Mere',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Uruangnirin',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Uud Danum',
  'Ot Danum',
  'Sumber: DapoBas Kemdikbud | Wilayah: Kalimantan | Provinsi: Kalimantan Barat,  Kalimantan Tengah',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Vamin',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Vedan Nus',
  'Podena',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wabo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Waicen',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wairate',
  'Debra',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Walak',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Waliam',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Walsa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wambo Tawe Tirop',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wambon Kenondik',
  'Wombon, Womsi',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wamesa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wandamen',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wanggom',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wano',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wanukaka',
  'Wanokaka',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Warari Onate',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wardo',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Warembori',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wari',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Warlon',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Warry',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Waruri',
  'Ambumi',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wate',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wau Arak',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Weinami',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wemale',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wersing)',
  'Kolana (Wirasina',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wewewa',
  'Wejewa',
  'Sumber: DapoBas Kemdikbud | Wilayah: Nusa Tenggara Timur | Provinsi: Nusa Tenggara Timur',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Windesi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wiyagar',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Woda-Woda',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wolani',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wombon',
  'Womsi',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wonti',
  'Waropen',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wooi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Woria',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Wotu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Sulawesi | Provinsi: Sulawesi Selatan',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yabanda',
  'Away',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yabega',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yaben',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yafi',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yaghai Mur',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yaghai Wairu',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yahadian-Mugim',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yakapis',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yalahatan',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yali Anggruk',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yali Kosarek',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yali Ninia',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yali Pass Valley',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yamas',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yamueti',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yatoke',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Maluku | Provinsi: Maluku',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yaur',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yaur Rihegure',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yawa Onate',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yei Bawah',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yelmek',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yeresiam',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yeresiam Kiruru',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yeresiam Pedalaman',
  'Sirise',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yeretuar',
  'Umare',
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yetfa',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yokari',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yoke',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yonggom',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;

INSERT INTO bahasa (nama_bahasa, nama_lokal, catatan, dibuat_pada, diperbarui_pada)
VALUES (
  'Yuafeta',
  NULL,
  'Sumber: DapoBas Kemdikbud | Wilayah: Papua | Provinsi: Papua Barat',
  NOW(),
  NOW()
) ON CONFLICT DO NOTHING;
