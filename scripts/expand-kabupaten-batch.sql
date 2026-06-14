-- Expand Kabupaten/Kota Data - Batch 1 (100+ entries)
-- Based on provinsi + wilayah mapping

-- ========== SUMATRA ==========

-- Aceh
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Besar' WHERE nama_bahasa = 'Aceh' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Barat' WHERE nama_bahasa = 'Aceh Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Timur' WHERE nama_bahasa = 'Aceh Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pidie' WHERE nama_bahasa = 'Pidie' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pidie Jaya' WHERE nama_bahasa = 'Pidie Jaya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bireuen' WHERE nama_bahasa = 'Bireuen' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Utara' WHERE nama_bahasa = 'Aceh Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Tamiang' WHERE nama_bahasa = 'Tamiang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Gayo Lues' WHERE nama_bahasa = 'Gayo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Tengah' WHERE nama_bahasa = 'Gayo Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bener Meriah' WHERE nama_bahasa = 'Gayo Bener Meriah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Singkil' WHERE nama_bahasa = 'Singkil' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Selatan' WHERE nama_bahasa = 'Aceh Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Barat Daya' WHERE nama_bahasa = 'Aceh Barat Daya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nagan Raya' WHERE nama_bahasa = 'Nagan Raya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Jaya' WHERE nama_bahasa = 'Aceh Jaya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Simeulue' WHERE nama_bahasa = 'Simeulue' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Aceh Tenggara' WHERE nama_bahasa = 'Aceh Tenggara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Lhokseumawe' WHERE nama_bahasa = 'Lhokseumawe' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Sabang' WHERE nama_bahasa = 'Sabang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Simeulue' WHERE nama_bahasa = 'Sigulai' AND kabupaten IS NULL;

-- Sumatera Utara
UPDATE bahasa SET kabupaten = 'Kabupaten Deli Serdang' WHERE nama_bahasa = 'Melayu Deli' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Medan' WHERE nama_bahasa = 'Melayu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Dairi' WHERE nama_bahasa = 'Pakpak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Dairi' WHERE nama_bahasa = 'Pakpak Dairi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Humbang Hasundutan' WHERE nama_bahasa = 'Batak Humbang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Toba Samosir' WHERE nama_bahasa = 'Batak Toba' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Samosir' WHERE nama_bahasa = 'Batak Samosir' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tapanuli Utara' WHERE nama_bahasa = 'Batak Tapanuli' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tapanuli Tengah' WHERE nama_bahasa = 'Batak Tapanuli Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tapanuli Selatan' WHERE nama_bahasa = 'Batak Angkola' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mandailing Natal' WHERE nama_bahasa = 'Mandailing' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nias' WHERE nama_bahasa = 'Nias' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nias Selatan' WHERE nama_bahasa = 'Nias Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nias Utara' WHERE nama_bahasa = 'Nias Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nias Barat' WHERE nama_bahasa = 'Nias Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Asahan' WHERE nama_bahasa = 'Melayu Asahan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Langkat' WHERE nama_bahasa = 'Melayu Langkat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Serdang Bedagai' WHERE nama_bahasa = 'Melayu Serdang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Binjai' WHERE nama_bahasa = 'Melayu Binjai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Tebing Tinggi' WHERE nama_bahasa = 'Melayu Tebing Tinggi' AND kabupaten IS NULL;

-- Sumatera Barat
UPDATE bahasa SET kabupaten = 'Kabupaten Tanah Datar' WHERE nama_bahasa = 'Minangkabau Tanah Datar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Agam' WHERE nama_bahasa = 'Minangkabau Agam' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lima Puluh Kota' WHERE nama_bahasa = 'Minangkabau Lima Puluh Kota' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Solok' WHERE nama_bahasa = 'Minangkabau Solok' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Solok Selatan' WHERE nama_bahasa = 'Minangkabau Solok Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pasaman' WHERE nama_bahasa = 'Minangkabau Pasaman' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pasaman Barat' WHERE nama_bahasa = 'Minangkabau Pasaman Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pesisir Selatan' WHERE nama_bahasa = 'Minangkabau Pesisir Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sijunjung' WHERE nama_bahasa = 'Minangkabau Sijunjung' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Dharmasraya' WHERE nama_bahasa = 'Minangkabau Dharmasraya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Padang Pariaman' WHERE nama_bahasa = 'Minangkabau Padang Pariaman' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Mentawai' WHERE nama_bahasa = 'Mentawai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Bukittinggi' WHERE nama_bahasa = 'Minangkabau Bukittinggi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Padang Panjang' WHERE nama_bahasa = 'Minangkabau Padang Panjang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Payakumbuh' WHERE nama_bahasa = 'Minangkabau Payakumbuh' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Pariaman' WHERE nama_bahasa = 'Minangkabau Pariaman' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Sawahlunto' WHERE nama_bahasa = 'Minangkabau Sawahlunto' AND kabupaten IS NULL;

-- Riau
UPDATE bahasa SET kabupaten = 'Kota Pekanbaru' WHERE nama_bahasa = 'Melayu Riau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kampar' WHERE nama_bahasa = 'Melayu Kampar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Rokan Hilir' WHERE nama_bahasa = 'Melayu Rokan Hilir' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Rokan Hulu' WHERE nama_bahasa = 'Melayu Rokan Hulu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Indragiri Hulu' WHERE nama_bahasa = 'Melayu Indragiri Hulu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Indragiri Hilir' WHERE nama_bahasa = 'Melayu Indragiri Hilir' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bengkalis' WHERE nama_bahasa = 'Melayu Bengkalis' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pelalawan' WHERE nama_bahasa = 'Melayu Pelalawan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Siak' WHERE nama_bahasa = 'Melayu Siak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kuantan Singingi' WHERE nama_bahasa = 'Melayu Kuantan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Meranti' WHERE nama_bahasa = 'Melayu Meranti' AND kabupaten IS NULL;

-- Jambi
UPDATE bahasa SET kabupaten = 'Kota Jambi' WHERE nama_bahasa = 'Melayu Jambi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Batanghari' WHERE nama_bahasa = 'Melayu Batanghari' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Muaro Jambi' WHERE nama_bahasa = 'Melayu Muaro Jambi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tanjung Jabung Barat' WHERE nama_bahasa = 'Melayu Tanjung Jabung Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tanjung Jabung Timur' WHERE nama_bahasa = 'Melayu Tanjung Jabung Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bungo' WHERE nama_bahasa = 'Melayu Bungo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tebo' WHERE nama_bahasa = 'Melayu Tebo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sarolangun' WHERE nama_bahasa = 'Melayu Sarolangun' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merangin' WHERE nama_bahasa = 'Melayu Merangin' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kerinci' WHERE nama_bahasa = 'Kerinci' AND kabupaten IS NULL;

-- Sumatera Selatan
UPDATE bahasa SET kabupaten = 'Kota Palembang' WHERE nama_bahasa = 'Melayu Palembang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ogan Komering Ulu' WHERE nama_bahasa = 'Komering' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ogan Komering Ulu Timur' WHERE nama_bahasa = 'Komering Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ogan Komering Ulu Selatan' WHERE nama_bahasa = 'Komering Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ogan Komering Ilir' WHERE nama_bahasa = 'Melayu Ogan Komering Ilir' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ogan Ilir' WHERE nama_bahasa = 'Melayu Ogan Ilir' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Muara Enim' WHERE nama_bahasa = 'Melayu Muara Enim' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lahat' WHERE nama_bahasa = 'Melayu Lahat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Musi Rawas' WHERE nama_bahasa = 'Melayu Musi Rawas' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Musi Banyuasin' WHERE nama_bahasa = 'Melayu Musi Banyuasin' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Banyuasin' WHERE nama_bahasa = 'Melayu Banyuasin' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Empat Lawang' WHERE nama_bahasa = 'Melayu Empat Lawang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Penukal Abab Lematang Ilir' WHERE nama_bahasa = 'Melayu PALI' AND kabupaten IS NULL;

-- Bengkulu
UPDATE bahasa SET kabupaten = 'Kota Bengkulu' WHERE nama_bahasa = 'Melayu Bengkulu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bengkulu Utara' WHERE nama_bahasa = 'Rejang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Rejang Lebong' WHERE nama_bahasa = 'Rejang Lebong' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepahiang' WHERE nama_bahasa = 'Rejang Kepahiang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lebong' WHERE nama_bahasa = 'Rejang Lebong Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bengkulu Selatan' WHERE nama_bahasa = 'Melayu Bengkulu Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kaur' WHERE nama_bahasa = 'Melayu Kaur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Seluma' WHERE nama_bahasa = 'Melayu Seluma' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mukomuko' WHERE nama_bahasa = 'Melayu Mukomuko' AND kabupaten IS NULL;

-- Lampung
UPDATE bahasa SET kabupaten = 'Kota Bandar Lampung' WHERE nama_bahasa = 'Lampung Bandar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lampung Selatan' WHERE nama_bahasa = 'Lampung Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lampung Timur' WHERE nama_bahasa = 'Lampung Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lampung Tengah' WHERE nama_bahasa = 'Lampung Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lampung Barat' WHERE nama_bahasa = 'Lampung Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tanggamus' WHERE nama_bahasa = 'Lampung Tanggamus' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Way Kanan' WHERE nama_bahasa = 'Lampung Way Kanan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tulang Bawang' WHERE nama_bahasa = 'Lampung Tulang Bawang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tulang Bawang Barat' WHERE nama_bahasa = 'Lampung Tulang Bawang Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mesuji' WHERE nama_bahasa = 'Lampung Mesuji' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pesawaran' WHERE nama_bahasa = 'Lampung Pesawaran' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pringsewu' WHERE nama_bahasa = 'Lampung Pringsewu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pesisir Barat' WHERE nama_bahasa = 'Lampung Pesisir Barat' AND kabupaten IS NULL;

-- Bangka Belitung
UPDATE bahasa SET kabupaten = 'Kota Pangkal Pinang' WHERE nama_bahasa = 'Melayu Bangka' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bangka' WHERE nama_bahasa = 'Melayu Bangka Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bangka Barat' WHERE nama_bahasa = 'Melayu Bangka Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bangka Selatan' WHERE nama_bahasa = 'Melayu Bangka Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bangka Tengah' WHERE nama_bahasa = 'Melayu Bangka Tengah Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Belitung' WHERE nama_bahasa = 'Melayu Belitung' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Belitung Timur' WHERE nama_bahasa = 'Melayu Belitung Timur' AND kabupaten IS NULL;

-- Riau Islands
UPDATE bahasa SET kabupaten = 'Kota Batam' WHERE nama_bahasa = 'Melayu Batam' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Tanjung Pinang' WHERE nama_bahasa = 'Melayu Tanjung Pinang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bintan' WHERE nama_bahasa = 'Melayu Bintan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Karimun' WHERE nama_bahasa = 'Melayu Karimun' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lingga' WHERE nama_bahasa = 'Melayu Lingga' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Natuna' WHERE nama_bahasa = 'Melayu Natuna' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Anambas' WHERE nama_bahasa = 'Melayu Anambas' AND kabupaten IS NULL;

-- ========== KALIMANTAN ==========

-- Kalimantan Barat
UPDATE bahasa SET kabupaten = 'Kabupaten Sintang' WHERE nama_bahasa = 'Dayak Sintang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kapuas Hulu' WHERE nama_bahasa = 'Dayak Kapuas Hulu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sanggau' WHERE nama_bahasa = 'Dayak Sanggau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sekadau' WHERE nama_bahasa = 'Dayak Sekadau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Melawi' WHERE nama_bahasa = 'Dayak Melawi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Landak' WHERE nama_bahasa = 'Dayak Landak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bengkayang' WHERE nama_bahasa = 'Dayak Bengkayang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sambas' WHERE nama_bahasa = 'Melayu Sambas' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mempawah' WHERE nama_bahasa = 'Melayu Mempawah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kubu Raya' WHERE nama_bahasa = 'Melayu Kubu Raya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kayong Utara' WHERE nama_bahasa = 'Melayu Kayong Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ketapang' WHERE nama_bahasa = 'Melayu Ketapang' AND kabupaten IS NULL;

-- Kalimantan Tengah
UPDATE bahasa SET kabupaten = 'Kota Palangka Raya' WHERE nama_bahasa = 'Dayak Ngaju Palangka Raya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kapuas' WHERE nama_bahasa = 'Dayak Kapuas' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pulang Pisau' WHERE nama_bahasa = 'Dayak Pulang Pisau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Gunung Mas' WHERE nama_bahasa = 'Dayak Gunung Mas' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Katingan' WHERE nama_bahasa = 'Dayak Katingan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Seruyan' WHERE nama_bahasa = 'Dayak Seruyan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kotawaringin Timur' WHERE nama_bahasa = 'Dayak Kotawaringin Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kotawaringin Barat' WHERE nama_bahasa = 'Dayak Kotawaringin Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lamandau' WHERE nama_bahasa = 'Dayak Lamandau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sukamara' WHERE nama_bahasa = 'Dayak Sukamara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Barito Timur' WHERE nama_bahasa = 'Dayak Barito Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Barito Utara' WHERE nama_bahasa = 'Dayak Barito Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Murung Raya' WHERE nama_bahasa = 'Dayak Murung Raya' AND kabupaten IS NULL;

-- Kalimantan Selatan
UPDATE bahasa SET kabupaten = 'Kabupaten Banjar' WHERE nama_bahasa = 'Banjar Banjar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Barito Kuala' WHERE nama_bahasa = 'Banjar Barito Kuala' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Hulu Sungai Utara' WHERE nama_bahasa = 'Banjar Hulu Sungai Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Hulu Sungai Tengah' WHERE nama_bahasa = 'Banjar Hulu Sungai Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Hulu Sungai Selatan' WHERE nama_bahasa = 'Banjar Hulu Sungai Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tapin' WHERE nama_bahasa = 'Banjar Tapin' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tanah Laut' WHERE nama_bahasa = 'Banjar Tanah Laut' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kotabaru' WHERE nama_bahasa = 'Banjar Kotabaru' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tabalong' WHERE nama_bahasa = 'Banjar Tabalong' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Balangan' WHERE nama_bahasa = 'Banjar Balangan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tanah Bumbu' WHERE nama_bahasa = 'Banjar Tanah Bumbu' AND kabupaten IS NULL;

-- Kalimantan Timur
UPDATE bahasa SET kabupaten = 'Kota Samarinda' WHERE nama_bahasa = 'Dayak Samarinda' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Bontang' WHERE nama_bahasa = 'Dayak Bontang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kutai Kartanegara' WHERE nama_bahasa = 'Kutai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kutai Barat' WHERE nama_bahasa = 'Kutai Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kutai Timur' WHERE nama_bahasa = 'Kutai Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Berau' WHERE nama_bahasa = 'Dayak Berau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Paser' WHERE nama_bahasa = 'Dayak Paser' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Penajam Paser Utara' WHERE nama_bahasa = 'Dayak Penajam Paser Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mahakam Ulu' WHERE nama_bahasa = 'Dayak Mahakam Ulu' AND kabupaten IS NULL;

-- Kalimantan Utara
UPDATE bahasa SET kabupaten = 'Kota Tarakan' WHERE nama_bahasa = 'Dayak Tarakan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bulungan' WHERE nama_bahasa = 'Dayak Bulungan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Malinau' WHERE nama_bahasa = 'Dayak Malinau' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nunukan' WHERE nama_bahasa = 'Dayak Nunukan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tana Tidung' WHERE nama_bahasa = 'Tidung' AND kabupaten IS NULL;

-- ========== SULAWESI ==========

-- Sulawesi Utara
UPDATE bahasa SET kabupaten = 'Kabupaten Bolaang Mongondow' WHERE nama_bahasa = 'Mongondow' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bolaang Mongondow Utara' WHERE nama_bahasa = 'Mongondow Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bolaang Mongondow Timur' WHERE nama_bahasa = 'Mongondow Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bolaang Mongondow Selatan' WHERE nama_bahasa = 'Mongondow Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Minahasa Selatan' WHERE nama_bahasa = 'Minahasa Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Minahasa Tenggara' WHERE nama_bahasa = 'Minahasa Tenggara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Minahasa Utara' WHERE nama_bahasa = 'Minahasa Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Sangihe' WHERE nama_bahasa = 'Sangihe' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Talaud' WHERE nama_bahasa = 'Talaud' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bolaang Mongondow' WHERE nama_bahasa = 'Minahasa Tonsawang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Minahasa Utara' WHERE nama_bahasa = 'Minahasa Tonsea' AND kabupaten IS NULL;

-- Gorontalo
UPDATE bahasa SET kabupaten = 'Kabupaten Gorontalo' WHERE nama_bahasa = 'Gorontalo Kota' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Gorontalo Utara' WHERE nama_bahasa = 'Gorontalo Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bone Bolango' WHERE nama_bahasa = 'Gorontalo Bone Bolango' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Boalemo' WHERE nama_bahasa = 'Gorontalo Boalemo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pohuwato' WHERE nama_bahasa = 'Gorontalo Pohuwato' AND kabupaten IS NULL;

-- Sulawesi Tengah
UPDATE bahasa SET kabupaten = 'Kabupaten Donggala' WHERE nama_bahasa = 'Kaili Donggala' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Poso' WHERE nama_bahasa = 'Pamona' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Toli-Toli' WHERE nama_bahasa = 'Toli-Toli' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buol' WHERE nama_bahasa = 'Buol' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Morowali' WHERE nama_bahasa = 'Morowali' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Morowali Utara' WHERE nama_bahasa = 'Morowali Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Banggai' WHERE nama_bahasa = 'Banggai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Banggai Kepulauan' WHERE nama_bahasa = 'Banggai Kepulauan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Banggai Laut' WHERE nama_bahasa = 'Banggai Laut' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Parigi Moutong' WHERE nama_bahasa = 'Kaili Parigi Moutong' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sigi' WHERE nama_bahasa = 'Kaili Sigi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tojo Una-Una' WHERE nama_bahasa = 'Una-Una' AND kabupaten IS NULL;

-- Sulawesi Barat
UPDATE bahasa SET kabupaten = 'Kabupaten Mamuju' WHERE nama_bahasa = 'Mamuju' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mamuju Tengah' WHERE nama_bahasa = 'Mamuju Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mamasa' WHERE nama_bahasa = 'Mamasa' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Majene' WHERE nama_bahasa = 'Majene' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pasangkayu' WHERE nama_bahasa = 'Pasangkayu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Polewali Mandar' WHERE nama_bahasa = 'Mandar Polewali' AND kabupaten IS NULL;

-- Sulawesi Selatan
UPDATE bahasa SET kabupaten = 'Kabupaten Gowa' WHERE nama_bahasa = 'Makassar Gowa' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Takalar' WHERE nama_bahasa = 'Makassar Takalar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jeneponto' WHERE nama_bahasa = 'Makassar Jeneponto' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bantaeng' WHERE nama_bahasa = 'Makassar Bantaeng' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bulukumba' WHERE nama_bahasa = 'Makassar Bulukumba' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sinjai' WHERE nama_bahasa = 'Makassar Sinjai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Soppeng' WHERE nama_bahasa = 'Bugis Soppeng' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Wajo' WHERE nama_bahasa = 'Bugis Wajo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sidrap' WHERE nama_bahasa = 'Bugis Sidrap' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pinrang' WHERE nama_bahasa = 'Bugis Pinrang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Enrekang' WHERE nama_bahasa = 'Bugis Enrekang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Barru' WHERE nama_bahasa = 'Bugis Barru' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pangkep' WHERE nama_bahasa = 'Makassar Pangkep' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Takalar' WHERE nama_bahasa = 'Makassar Takalar Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Maros' WHERE nama_bahasa = 'Makassar Maros' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bone' WHERE nama_bahasa = 'Bugis Bone' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Luwu' WHERE nama_bahasa = 'Bugis Luwu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Luwu Utara' WHERE nama_bahasa = 'Bugis Luwu Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Luwu Timur' WHERE nama_bahasa = 'Bugis Luwu Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Toraja Utara' WHERE nama_bahasa = 'Toraja Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Selayar' WHERE nama_bahasa = 'Makassar Selayar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Enrekang' WHERE nama_bahasa = 'Massenrengpulu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Selayar' WHERE nama_bahasa = 'Bonerate' AND kabupaten IS NULL;

-- Sulawesi Tenggara
UPDATE bahasa SET kabupaten = 'Kabupaten Kolaka' WHERE nama_bahasa = 'Tolaki Kolaka' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kolaka Utara' WHERE nama_bahasa = 'Tolaki Kolaka Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kolaka Timur' WHERE nama_bahasa = 'Tolaki Kolaka Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Konawe' WHERE nama_bahasa = 'Tolaki Konawe' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Konawe Selatan' WHERE nama_bahasa = 'Tolaki Konawe Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Konawe Utara' WHERE nama_bahasa = 'Tolaki Konawe Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Konawe Kepulauan' WHERE nama_bahasa = 'Tolaki Konawe Kepulauan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Muna' WHERE nama_bahasa = 'Muna Raha' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Muna Barat' WHERE nama_bahasa = 'Muna Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buton' WHERE nama_bahasa = 'Buton' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buton Utara' WHERE nama_bahasa = 'Buton Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buton Selatan' WHERE nama_bahasa = 'Buton Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buton Tengah' WHERE nama_bahasa = 'Buton Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bombana' WHERE nama_bahasa = 'Tolaki Bombana' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Wakatobi' WHERE nama_bahasa = 'Tolaki Wakatobi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bau-Bau' WHERE nama_bahasa = 'Tolaki Bau-Bau' AND kabupaten IS NULL;

-- ========== MALUKU ==========

-- Maluku
UPDATE bahasa SET kabupaten = 'Kabupaten Maluku Tengah' WHERE nama_bahasa = 'Ambon Maluku Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Seram Bagian Barat' WHERE nama_bahasa = 'Seram Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Seram Bagian Timur' WHERE nama_bahasa = 'Seram Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buru' WHERE nama_bahasa = 'Buru' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buru Selatan' WHERE nama_bahasa = 'Buru Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Aru' WHERE nama_bahasa = 'Aru' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Tanimbar' WHERE nama_bahasa = 'Tanimbar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Maluku Tenggara' WHERE nama_bahasa = 'Kei' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Maluku Tenggara Barat' WHERE nama_bahasa = 'Tanimbar Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Maluku Barat Daya' WHERE nama_bahasa = 'Maluku Barat Daya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Tanimbar' WHERE nama_bahasa = 'Yamdena' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Seram Bagian Timur' WHERE nama_bahasa = 'Piru' AND kabupaten IS NULL;

-- Maluku Utara
UPDATE bahasa SET kabupaten = 'Kota Ternate' WHERE nama_bahasa = 'Ternate' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Tidore Kepulauan' WHERE nama_bahasa = 'Tidore' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Halmahera Selatan' WHERE nama_bahasa = 'Halmahera Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Halmahera Utara' WHERE nama_bahasa = 'Halmahera Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Halmahera Tengah' WHERE nama_bahasa = 'Halmahera Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Halmahera Timur' WHERE nama_bahasa = 'Halmahera Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Halmahera Barat' WHERE nama_bahasa = 'Halmahera Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kepulauan Sula' WHERE nama_bahasa = 'Sula' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pulau Morotai' WHERE nama_bahasa = 'Morotai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pulau Taliabu' WHERE nama_bahasa = 'Taliabu' AND kabupaten IS NULL;

-- ========== NUSA TENGGARA ==========

-- Nusa Tenggara Barat
UPDATE bahasa SET kabupaten = 'Kabupaten Lombok Barat' WHERE nama_bahasa = 'Sasak Lombok Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lombok Tengah' WHERE nama_bahasa = 'Sasak Lombok Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lombok Timur' WHERE nama_bahasa = 'Sasak Lombok Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lombok Utara' WHERE nama_bahasa = 'Sasak Lombok Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumbawa' WHERE nama_bahasa = 'Sumbawa Sumbawa' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumbawa Barat' WHERE nama_bahasa = 'Sumbawa Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Dompu' WHERE nama_bahasa = 'Bima Dompu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bima' WHERE nama_bahasa = 'Bima Bima' AND kabupaten IS NULL;

-- Nusa Tenggara Timur
UPDATE bahasa SET kabupaten = 'Kabupaten Manggarai' WHERE nama_bahasa = 'Manggarai Ruteng' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Manggarai Barat' WHERE nama_bahasa = 'Manggarai Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Manggarai Timur' WHERE nama_bahasa = 'Manggarai Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ngada' WHERE nama_bahasa = 'Ngada' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nagekeo' WHERE nama_bahasa = 'Nagekeo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ende' WHERE nama_bahasa = 'Ende' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sikka' WHERE nama_bahasa = 'Sikka Maumere' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Flores Timur' WHERE nama_bahasa = 'Lamaholot Larantuka' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lembata' WHERE nama_bahasa = 'Lamaholot Lembata' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Alor' WHERE nama_bahasa = 'Alor Kalabahi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumba Barat' WHERE nama_bahasa = 'Sumba Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumba Timur' WHERE nama_bahasa = 'Sumba Timur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumba Barat Daya' WHERE nama_bahasa = 'Sumba Barat Daya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumba Tengah' WHERE nama_bahasa = 'Sumba Tengah' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Timor Tengah Utara' WHERE nama_bahasa = 'Timor TTU' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Timor Tengah Selatan' WHERE nama_bahasa = 'Timor TTS' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Belu' WHERE nama_bahasa = 'Tetun Belu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Malaka' WHERE nama_bahasa = 'Tetun Malaka' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kupang' WHERE nama_bahasa = 'Kupang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Rote Ndao' WHERE nama_bahasa = 'Rote' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sabu Raijua' WHERE nama_bahasa = 'Sabu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Alor' WHERE nama_bahasa = 'Adang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Alor' WHERE nama_bahasa = 'Alor' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sikka' WHERE nama_bahasa = 'Sikka' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumba Barat' WHERE nama_bahasa = 'Sar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumba Timur' WHERE nama_bahasa = 'So a' AND kabupaten IS NULL;

-- ========== BALI ==========

UPDATE bahasa SET kabupaten = 'Kabupaten Badung' WHERE nama_bahasa = 'Bali Badung' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Gianyar' WHERE nama_bahasa = 'Bali Gianyar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tabanan' WHERE nama_bahasa = 'Bali Tabanan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Klungkung' WHERE nama_bahasa = 'Bali Klungkung' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bangli' WHERE nama_bahasa = 'Bali Bangli' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Karangasem' WHERE nama_bahasa = 'Bali Karangasem' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buleleng' WHERE nama_bahasa = 'Bali Buleleng' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jembrana' WHERE nama_bahasa = 'Bali Jembrana' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Buleleng' WHERE nama_bahasa = 'Sasak Bali' AND kabupaten IS NULL;

-- ========== PAPUA ==========

-- Papua
UPDATE bahasa SET kabupaten = 'Kabupaten Jayapura' WHERE nama_bahasa = 'Sentani Jayapura' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayapura' WHERE nama_bahasa = 'Skou' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayapura' WHERE nama_bahasa = 'Namblong' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sarmi' WHERE nama_bahasa = 'Sobey Wakde' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sarmi' WHERE nama_bahasa = 'Marita' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Waropen' WHERE nama_bahasa = 'Waropen' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Yapen' WHERE nama_bahasa = 'Yapen' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Biak Numfor' WHERE nama_bahasa = 'Biak Numfor' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Supiori' WHERE nama_bahasa = 'Supiori' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nabire' WHERE nama_bahasa = 'Nabire' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Dogiyai' WHERE nama_bahasa = 'Dogiyai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Deiyai' WHERE nama_bahasa = 'Deiyai' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Intan Jaya' WHERE nama_bahasa = 'Intan Jaya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Puncak' WHERE nama_bahasa = 'Puncak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Puncak Jaya' WHERE nama_bahasa = 'Puncak Jaya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lanny Jaya' WHERE nama_bahasa = 'Lanny Jaya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nduga' WHERE nama_bahasa = 'Nduga' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Yalimo' WHERE nama_bahasa = 'Yalimo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Yahukimo' WHERE nama_bahasa = 'Yahukimo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pegunungan Bintang' WHERE nama_bahasa = 'Pegunungan Bintang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Boven Digoel' WHERE nama_bahasa = 'Boven Digoel' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mappi' WHERE nama_bahasa = 'Mappi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Asmat' WHERE nama_bahasa = 'Asmat Agats' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merauke' WHERE nama_bahasa = 'Marind Merauke' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merauke' WHERE nama_bahasa = 'Sawi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Mimika' WHERE nama_bahasa = 'Mimika' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Silimo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Sipisi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Sikari' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Saurisirami' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Sasawa' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Sause-Ures' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Sowari' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jayawijaya' WHERE nama_bahasa = 'Smarki Kanum' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merauke' WHERE nama_bahasa = 'Namas' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merauke' WHERE nama_bahasa = 'Namla' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merauke' WHERE nama_bahasa = 'Saman' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Merauke' WHERE nama_bahasa = 'Mnanggi' AND kabupaten IS NULL;

-- Papua Barat
UPDATE bahasa SET kabupaten = 'Kabupaten Manokwari' WHERE nama_bahasa = 'Manokwari' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Manokwari Selatan' WHERE nama_bahasa = 'Manokwari Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pegunungan Arfak' WHERE nama_bahasa = 'Arfak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Teluk Wondama' WHERE nama_bahasa = 'Wondama' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Teluk Bintuni' WHERE nama_bahasa = 'Bintuni' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Fakfak' WHERE nama_bahasa = 'Fakfak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kaimana' WHERE nama_bahasa = 'Kaimana' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Sorong' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong Selatan' WHERE nama_bahasa = 'Sorong Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Raja Ampat' WHERE nama_bahasa = 'Raja Ampat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Maybrat' WHERE nama_bahasa = 'Maybrat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tambrauw' WHERE nama_bahasa = 'Tambrauw' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Raja Ampat' WHERE nama_bahasa = 'Matbat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Raja Ampat' WHERE nama_bahasa = 'Salafen Matbat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Salas' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Saleman' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Salkma' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Somu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Soon' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Sou' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Sough' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Sough Bohon' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Sowiwa' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Sorabi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Tandia' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Miere' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Mare' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sorong' WHERE nama_bahasa = 'Maraw' AND kabupaten IS NULL;

-- ========== JAVA ==========

-- Jawa Barat
UPDATE bahasa SET kabupaten = 'Kabupaten Bogor' WHERE nama_bahasa = 'Sunda Bogor' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sukabumi' WHERE nama_bahasa = 'Sunda Sukabumi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Cianjur' WHERE nama_bahasa = 'Sunda Cianjur' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bandung' WHERE nama_bahasa = 'Sunda Bandung' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bandung Barat' WHERE nama_bahasa = 'Sunda Bandung Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Garut' WHERE nama_bahasa = 'Sunda Garut' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tasikmalaya' WHERE nama_bahasa = 'Sunda Tasikmalaya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ciamis' WHERE nama_bahasa = 'Sunda Ciamis' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pangandaran' WHERE nama_bahasa = 'Sunda Pangandaran' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumedang' WHERE nama_bahasa = 'Sunda Sumedang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Majalengka' WHERE nama_bahasa = 'Sunda Majalengka' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kuningan' WHERE nama_bahasa = 'Sunda Kuningan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Cirebon' WHERE nama_bahasa = 'Sunda Cirebon' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Indramayu' WHERE nama_bahasa = 'Sunda Indramayu' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Subang' WHERE nama_bahasa = 'Sunda Subang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Purwakarta' WHERE nama_bahasa = 'Sunda Purwakarta' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Karawang' WHERE nama_bahasa = 'Sunda Karawang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bekasi' WHERE nama_bahasa = 'Sunda Bekasi' AND kabupaten IS NULL;

-- Jawa Tengah
UPDATE bahasa SET kabupaten = 'Kabupaten Semarang' WHERE nama_bahasa = 'Jawa Semarang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kendal' WHERE nama_bahasa = 'Jawa Kendal' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Demak' WHERE nama_bahasa = 'Jawa Demak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Grobogan' WHERE nama_bahasa = 'Jawa Grobogan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Blora' WHERE nama_bahasa = 'Jawa Blora' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Rembang' WHERE nama_bahasa = 'Jawa Rembang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pati' WHERE nama_bahasa = 'Jawa Pati' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kudus' WHERE nama_bahasa = 'Jawa Kudus' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jepara' WHERE nama_bahasa = 'Jawa Jepara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pekalongan' WHERE nama_bahasa = 'Jawa Pekalongan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Batang' WHERE nama_bahasa = 'Jawa Batang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pemalang' WHERE nama_bahasa = 'Jawa Pemalang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tegal' WHERE nama_bahasa = 'Jawa Tegal' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Brebes' WHERE nama_bahasa = 'Jawa Brebes' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Cilacap' WHERE nama_bahasa = 'Jawa Cilacap' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Banyumas' WHERE nama_bahasa = 'Jawa Banyumas' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Purbalingga' WHERE nama_bahasa = 'Jawa Purbalingga' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Banjarnegara' WHERE nama_bahasa = 'Jawa Banjarnegara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kebumen' WHERE nama_bahasa = 'Jawa Kebumen' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Purworejo' WHERE nama_bahasa = 'Jawa Purworejo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Wonosobo' WHERE nama_bahasa = 'Jawa Wonosobo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Magelang' WHERE nama_bahasa = 'Jawa Magelang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Temanggung' WHERE nama_bahasa = 'Jawa Temanggung' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Klaten' WHERE nama_bahasa = 'Jawa Klaten' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Boyolali' WHERE nama_bahasa = 'Jawa Boyolali' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sukoharjo' WHERE nama_bahasa = 'Jawa Sukoharjo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Wonogiri' WHERE nama_bahasa = 'Jawa Wonogiri' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Karanganyar' WHERE nama_bahasa = 'Jawa Karanganyar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sragen' WHERE nama_bahasa = 'Jawa Sragen' AND kabupaten IS NULL;

-- Jawa Timur
UPDATE bahasa SET kabupaten = 'Kabupaten Surabaya' WHERE nama_bahasa = 'Jawa Surabaya' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sidoarjo' WHERE nama_bahasa = 'Jawa Sidoarjo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Gresik' WHERE nama_bahasa = 'Jawa Gresik' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lamongan' WHERE nama_bahasa = 'Jawa Lamongan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tuban' WHERE nama_bahasa = 'Jawa Tuban' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bojonegoro' WHERE nama_bahasa = 'Jawa Bojonegoro' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ngawi' WHERE nama_bahasa = 'Jawa Ngawi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Magetan' WHERE nama_bahasa = 'Jawa Magetan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Madiun' WHERE nama_bahasa = 'Jawa Madiun' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Nganjuk' WHERE nama_bahasa = 'Jawa Nganjuk' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Kediri' WHERE nama_bahasa = 'Jawa Kediri' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tulungagung' WHERE nama_bahasa = 'Jawa Tulungagung' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Blitar' WHERE nama_bahasa = 'Jawa Blitar' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Malang' WHERE nama_bahasa = 'Jawa Malang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pasuruan' WHERE nama_bahasa = 'Jawa Pasuruan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Probolinggo' WHERE nama_bahasa = 'Jawa Probolinggo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lumajang' WHERE nama_bahasa = 'Jawa Lumajang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Jember' WHERE nama_bahasa = 'Jawa Jember' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Banyuwangi' WHERE nama_bahasa = 'Jawa Banyuwangi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bondowoso' WHERE nama_bahasa = 'Jawa Bondowoso' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Situbondo' WHERE nama_bahasa = 'Jawa Situbondo' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pamekasan' WHERE nama_bahasa = 'Madura Pamekasan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sampang' WHERE nama_bahasa = 'Madura Sampang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Sumenep' WHERE nama_bahasa = 'Madura Sumenep' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Bangkalan' WHERE nama_bahasa = 'Madura Bangkalan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pacitan' WHERE nama_bahasa = 'Jawa Pacitan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Ponorogo' WHERE nama_bahasa = 'Jawa Ponorogo' AND kabupaten IS NULL;

-- Banten
UPDATE bahasa SET kabupaten = 'Kabupaten Serang' WHERE nama_bahasa = 'Sunda Serang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Pandeglang' WHERE nama_bahasa = 'Sunda Pandeglang' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Lebak' WHERE nama_bahasa = 'Sunda Lebak' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kabupaten Tangerang' WHERE nama_bahasa = 'Sunda Tangerang' AND kabupaten IS NULL;

-- DKI Jakarta
UPDATE bahasa SET kabupaten = 'Kota Jakarta Pusat' WHERE nama_bahasa = 'Betawi' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Jakarta Utara' WHERE nama_bahasa = 'Betawi Utara' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Jakarta Barat' WHERE nama_bahasa = 'Betawi Barat' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Jakarta Selatan' WHERE nama_bahasa = 'Betawi Selatan' AND kabupaten IS NULL;
UPDATE bahasa SET kabupaten = 'Kota Jakarta Timur' WHERE nama_bahasa = 'Betawi Timur' AND kabupaten IS NULL;

-- Verify results
SELECT 
  provinsi,
  COUNT(kabupaten) as jumlah_dengan_kabupaten,
  COUNT(*) as total_bahasa
FROM bahasa 
WHERE provinsi IS NOT NULL
GROUP BY provinsi
ORDER BY jumlah_dengan_kabupaten DESC;
