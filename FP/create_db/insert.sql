INSERT INTO Driver (Nama_Driver, Alamat_Driver, Foto_Driver, No_Telepon_Driver, Status_Aktif_Driver, Email_Driver)
VALUES
('Hasan Adiwena', 'Perumahan Darmo Permai Blok A1 No. 10, Surabaya', NULL, '081234567890', TRUE, 'hasan.doe@gmail.com'),
('Galeno Yunus', 'Jl. Keputih Tegal Timur VI/15, Surabaya', NULL, '081234567891', FALSE, 'galeno.star156@gmail.com'),
('Johannes Salim', 'Mulyosari Baru I Blok C2 No. 8, Surabaya', NULL, '081234567892', TRUE, 'jo.asik345@gmail.com'),
('Rama Rasendriya', 'Jl. Keputih Barat I No. 5, Surabaya', NULL, '081234567893', TRUE, 'owarianto.al@gmail.com'),
('Arya Aulia', 'Perumahan Sidoarjo Indah Blok D3 No. 12, Sidoarjo', NULL, '081234567894', FALSE, 'aulia123@gmail.com'),
('Aisyah Azzahra', 'Jl. Margorejo Indah V No. 7, Surabaya', NULL, '081234567895', TRUE, 'azzzz173@gmail.com'),
('Siti Salsabila', 'Perumahan Darmo Permai Blok B2 No. 15, Surabaya', NULL, '081234567896', TRUE, 'siti.bila78@gmail.com');

INSERT INTO Layanan (Nama_Layanan, Deskripsi_Layanan)
VALUES
('GoRide', 'Layanan ojek untuk perjalanan cepat'),
('GoCar', 'Layanan taksi online dengan mobil'),
('GoFood', 'Layanan pesan antar makanan'),
('GoSend', 'Layanan pengiriman barang cepat'),
('GoMart', 'Layanan belanja kebutuhan sehari-hari'),
('GoPulsa', 'Layanan pembelian pulsa dan paket data'),
('GoPlay', 'Layanan streaming video dan musik');

INSERT INTO Kendaraan (ID_Layanan, Jenis_Kendaraan, No_Plat_Kendaraan, Merk_Kendaraan)
VALUES
(1, 'Motor', 'B1234XYZ', 'Beat'),
(2, 'Mobil', 'B5678XYZ', 'Pajero'),
(3, 'Motor', 'B9101XYZ', 'Jupiter'),
(4, 'Mobil', 'B1121XYZ', 'Tesla'),
(5, 'Motor', 'B3141XYZ', 'Aerox'),
(6, 'Mobil', 'B5161XYZ', 'Xenia'),
(7, 'Motor', 'B7181XYZ', 'Mio');

INSERT INTO Konsumen (Nama_Konsumen, Alamat_Konsumen, No_Telepon_Konsumen, Email_Konsumen, Tanggal_Lahir_Konsumen)
VALUES
('Lina Tan', 'Jl. Darmo Permai Selatan No. 10, Surabaya', '081234567800', 'lina.tan@gmail.com', '1990-05-15'),
('Andre Liem', 'Jl. Keputih Timur No. 20, Surabaya', '081234567801', 'andre.liem@gmail.com', '1985-08-20'),
('Cindy Hartanto', 'Jl. Mulyosari Baru No. 30, Surabaya', '081234567802', 'cindy.hartanto@gmail.com', '1992-11-30'),
('Yudi Chen', 'Jl. Ngagel Jaya Selatan No. 40, Surabaya', '081234567803', 'yudi.chen@gmail.com', '1988-07-12'),
('Bambang Wang', 'Jl. Gubeng Kertajaya No. 50, Surabaya', '081234567804', 'bambang.wang@gmail.com', '1995-09-25'),
('Siska Huang', 'Jl. Darmo Permai Utara No. 60, Surabaya', '081234567805', 'siska.huang@gmail.com', '1991-12-05'),
('Anton Wu', 'Jl. Diponegoro No. 70, Surabaya', '081234567806', 'anton.wu@gmail.com', '1987-03-14');

INSERT INTO Lokasi (Nama_Lokasi, Latitude_Lokasi, Longitude_Lokasi)
VALUES
('Jl. Ketintang Baru No. 10, Surabaya', -6.2087634, 106.8055086),
('Jl. Arief Rahman Hakim No. 20, Surabaya', -6.1917081, 106.8236445),
('Jl. Dharmawangsa No. 30, Surabaya', -6.227817, 106.8082633),
('Jl. Panglima Sudirman No. 40, Surabaya', -6.1935927, 106.8223135),
('Jl. Darmo Permai Utara No. 50, Surabaya', -6.1946361, 106.8027327),
('Jl. Jenderal Sudirman', -6.208827, 106.8044434),
('Jl. Diponegoro No. 70, Surabaya', -6.2196033, 106.8271094),
('Jl. Airlangga No. 60, Surabaya', -6.1375138, 106.8244834),
('Jl. Raya ITS, Sukolilo, Surabaya', -6.1942825, 106.7746544);

INSERT INTO `Order` (ID_Driver_Order, ID_Kendaraan_Order, ID_Konsumen_Order, Jarak_Order, Tarif_Order, Status_Order, Waktu_Pesan_Order, Waktu_Selesai_Order, ID_Lokasi_Asal_Order, ID_Lokasi_Tujuan_Order)
VALUES
(1, 1, 1, 10.5, 50000, 'COMPLETED', '2024-06-20 08:00:00', '2024-06-20 08:30:00', 1, 2),
(2, 2, 2, 5.0, 25000, 'PENDING', '2024-06-21 09:00:00', NULL, 3, 4),
(3, 3, 3, 7.5, 35000, 'IN_PROGRESS', '2024-06-22 10:00:00', NULL, 5, 6),
(4, 4, 4, 3.0, 15000, 'CANCELLED', '2024-06-23 11:00:00', NULL, 7, 1),
(5, 5, 5, 12.0, 60000, 'COMPLETED', '2024-06-24 12:00:00', '2024-06-24 12:45:00', 2, 3),
(6, 6, 6, 4.5, 22500, 'PENDING', '2024-06-25 13:00:00', NULL, 4, 5),
(7, 7, 7, 8.0, 40000, 'IN_PROGRESS', '2024-06-26 14:00:00', NULL, 6, 7);

INSERT INTO Promosi (Nama_Promosi, Deskripsi_Promosi, Potongan_Harga_Promosi, Tanggal_Mulai_Promosi, Tanggal_Selesai_Promosi)
VALUES
('Promo Ramadhan', 'Diskon spesial selama bulan Ramadhan', 10.0, '2024-03-23 00:00:00', '2024-04-23 23:59:59'),
('Promo Merdeka', 'Diskon untuk merayakan hari kemerdekaan', 15.0, '2024-08-01 00:00:00', '2024-08-31 23:59:59'),
('Promo Natal', 'Diskon khusus Natal', 20.0, '2024-12-01 00:00:00', '2024-12-25 23:59:59'),
('Promo Tahun Baru', 'Diskon untuk tahun baru', 25.0, '2024-12-26 00:00:00', '2025-01-01 23:59:59'),
('Promo Imlek', 'Diskon spesial Imlek', 12.0, '2024-02-01 00:00:00', '2024-02-15 23:59:59'),
('Promo Valentine', 'Diskon untuk Hari Valentine', 14.0, '2024-02-14 00:00:00', '2024-02-14 23:59:59'),
('Promo Lebaran', 'Diskon untuk merayakan Lebaran', 18.0, '2024-04-24 00:00:00', '2024-05-24 23:59:59');

INSERT INTO Pembayaran (ID_Order_Pembayaran, ID_Promosi_Pembayaran, Metode_Pembayaran, Status_Pembayaran, Waktu_Pembayaran, Jumlah_Pembayaran)
VALUES
(1, 1, 'CASH', 'PAID', '2024-06-20 08:35:00', 45000),
(2, 2, 'CREDIT_CARD', 'PENDING', NULL, 22500),
(3, 3, 'EWALLET', 'PENDING', NULL, 31500),
(4, 4, 'CASH', 'CANCELLED', '2024-06-23 11:05:00', 0),
(5, 5, 'CREDIT_CARD', 'PAID', '2024-06-24 12:50:00', 54000),
(6, 6, 'EWALLET', 'PENDING', NULL, 20250),
(7, 7, 'CASH', 'PENDING', NULL, 36000);

INSERT INTO Penilaian (ID_Order_Penilaian, ID_Driver_Penilaian, Rating_Penilaian, Ulasan_Penilaian, Tanggal_Penilaian)
VALUES
(1, 1, 4.5, 'Pelayanan sangat ramah dan kendaraan bersih.', '2024-06-20 09:00:00'),
(2, 2, 3.0, 'Driver terlambat datang menjemput.', '2024-06-21 10:00:00'),
(3, 3, 5.0, 'Sangat puas dengan pelayanan dan kecepatan pengiriman.', '2024-06-22 11:00:00'),
(4, 4, 2.5, 'Order dibatalkan tanpa pemberitahuan sebelumnya.', '2024-06-23 12:00:00'),
(5, 5, 4.0, 'Driver ramah dan tepat waktu.', '2024-06-24 13:00:00'),
(6, 6, 3.5, 'Kendaraan kotor dan tidak nyaman.', '2024-06-25 14:00:00'),
(7, 7, 4.5, 'Driver membantu membawa barang dengan baik.', '2024-06-26 15:00:00');
