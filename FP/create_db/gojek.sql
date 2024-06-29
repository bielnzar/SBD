-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2024 pada 07.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gojek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `driver`
--

CREATE TABLE `driver` (
  `ID_Driver` int(11) NOT NULL,
  `Nama_Driver` varchar(255) DEFAULT NULL,
  `Alamat_Driver` text DEFAULT NULL,
  `Foto_Driver` blob DEFAULT NULL,
  `No_Telepon_Driver` varchar(15) DEFAULT NULL,
  `Status_Aktif_Driver` tinyint(1) DEFAULT NULL,
  `Email_Driver` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `driver`
--

INSERT INTO `driver` (`ID_Driver`, `Nama_Driver`, `Alamat_Driver`, `Foto_Driver`, `No_Telepon_Driver`, `Status_Aktif_Driver`, `Email_Driver`) VALUES
(1, 'Hasan Adiwena', 'Perumahan Darmo Permai Blok A1 No. 10, Surabaya', NULL, '081234567890', 1, 'hasan.doe@gmail.com'),
(2, 'Galeno Yunus', 'Jl. Keputih Tegal Timur VI/15, Surabaya', NULL, '081234567891', 0, 'galeno.star156@gmail.com'),
(3, 'Johannes Salim', 'Mulyosari Baru I Blok C2 No. 8, Surabaya', NULL, '081234567892', 1, 'jo.asik345@gmail.com'),
(4, 'Rama Rasendriya', 'Jl. Keputih Barat I No. 5, Surabaya', NULL, '081234567893', 1, 'owarianto.al@gmail.com'),
(5, 'Arya Aulia', 'Perumahan Sidoarjo Indah Blok D3 No. 12, Sidoarjo', NULL, '081234567894', 0, 'aulia123@gmail.com'),
(6, 'Aisyah Azzahra', 'Jl. Margorejo Indah V No. 7, Surabaya', NULL, '081234567895', 1, 'azzzz173@gmail.com'),
(7, 'Siti Salsabila', 'Perumahan Darmo Permai Blok B2 No. 15, Surabaya', NULL, '081234567896', 1, 'siti.bila78@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `ID_Kendaraan` int(11) NOT NULL,
  `ID_Layanan` int(11) DEFAULT NULL,
  `Jenis_Kendaraan` varchar(50) DEFAULT NULL,
  `No_Plat_Kendaraan` varchar(15) DEFAULT NULL,
  `Merk_Kendaraan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`ID_Kendaraan`, `ID_Layanan`, `Jenis_Kendaraan`, `No_Plat_Kendaraan`, `Merk_Kendaraan`) VALUES
(1, 1, 'Motor', 'B1234XYZ', 'Beat'),
(2, 2, 'Mobil', 'B5678XYZ', 'Pajero'),
(3, 3, 'Motor', 'B9101XYZ', 'Jupiter'),
(4, 4, 'Mobil', 'B1121XYZ', 'Tesla'),
(5, 5, 'Motor', 'B3141XYZ', 'Aerox'),
(6, 6, 'Mobil', 'B5161XYZ', 'Xenia'),
(7, 7, 'Motor', 'B7181XYZ', 'Mio');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsumen`
--

CREATE TABLE `konsumen` (
  `ID_Konsumen` int(11) NOT NULL,
  `Nama_Konsumen` varchar(255) DEFAULT NULL,
  `Alamat_Konsumen` varchar(255) DEFAULT NULL,
  `No_Telepon_Konsumen` varchar(15) DEFAULT NULL,
  `Email_Konsumen` varchar(255) DEFAULT NULL,
  `Tanggal_Lahir_Konsumen` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konsumen`
--

INSERT INTO `konsumen` (`ID_Konsumen`, `Nama_Konsumen`, `Alamat_Konsumen`, `No_Telepon_Konsumen`, `Email_Konsumen`, `Tanggal_Lahir_Konsumen`) VALUES
(1, 'Lina Tan', 'Jl. Darmo Permai Selatan No. 10, Surabaya', '081234567800', 'lina.tan@gmail.com', '1990-05-15'),
(2, 'Andre Liem', 'Jl. Keputih Timur No. 20, Surabaya', '081234567801', 'andre.liem@gmail.com', '1985-08-20'),
(3, 'Cindy Hartanto', 'Jl. Mulyosari Baru No. 30, Surabaya', '081234567802', 'cindy.hartanto@gmail.com', '1992-11-30'),
(4, 'Yudi Chen', 'Jl. Ngagel Jaya Selatan No. 40, Surabaya', '081234567803', 'yudi.chen@gmail.com', '1988-07-12'),
(5, 'Bambang Wang', 'Jl. Gubeng Kertajaya No. 50, Surabaya', '081234567804', 'bambang.wang@gmail.com', '1995-09-25'),
(6, 'Siska Huang', 'Jl. Darmo Permai Utara No. 60, Surabaya', '081234567805', 'siska.huang@gmail.com', '1991-12-05'),
(7, 'Anton Wu', 'Jl. Diponegoro No. 70, Surabaya', '081234567806', 'anton.wu@gmail.com', '1987-03-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `ID_Layanan` int(11) NOT NULL,
  `Nama_Layanan` varchar(255) DEFAULT NULL,
  `Deskripsi_Layanan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`ID_Layanan`, `Nama_Layanan`, `Deskripsi_Layanan`) VALUES
(1, 'GoRide', 'Layanan ojek untuk perjalanan cepat'),
(2, 'GoCar', 'Layanan taksi online dengan mobil'),
(3, 'GoFood', 'Layanan pesan antar makanan'),
(4, 'GoSend', 'Layanan pengiriman barang cepat'),
(5, 'GoMart', 'Layanan belanja kebutuhan sehari-hari'),
(6, 'GoPulsa', 'Layanan pembelian pulsa dan paket data'),
(7, 'GoPlay', 'Layanan streaming video dan musik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `ID_Lokasi` int(11) NOT NULL,
  `Nama_Lokasi` varchar(255) DEFAULT NULL,
  `Latitude_Lokasi` decimal(10,8) DEFAULT NULL,
  `Longitude_Lokasi` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`ID_Lokasi`, `Nama_Lokasi`, `Latitude_Lokasi`, `Longitude_Lokasi`) VALUES
(1, 'Jl. Ketintang Baru No. 10, Surabaya', -6.20876340, 106.80550860),
(2, 'Jl. Arief Rahman Hakim No. 20, Surabaya', -6.19170810, 106.82364450),
(3, 'Jl. Dharmawangsa No. 30, Surabaya', -6.22781700, 106.80826330),
(4, 'Jl. Panglima Sudirman No. 40, Surabaya', -6.19359270, 106.82231350),
(5, 'Jl. Darmo Permai Utara No. 50, Surabaya', -6.19463610, 106.80273270),
(6, 'Jl. Jenderal Sudirman', -6.20882700, 106.80444340),
(7, 'Jl. Diponegoro No. 70, Surabaya', -6.21960330, 106.82710940),
(8, 'Jl. Airlangga No. 60, Surabaya', -6.13751380, 106.82448340),
(9, 'Jl. Raya ITS, Sukolilo, Surabaya', -6.19428250, 106.77465440);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `ID_Order` int(11) NOT NULL,
  `ID_Driver_Order` int(11) DEFAULT NULL,
  `ID_Kendaraan_Order` int(11) DEFAULT NULL,
  `ID_Konsumen_Order` int(11) DEFAULT NULL,
  `Jarak_Order` decimal(5,2) DEFAULT NULL,
  `Tarif_Order` decimal(10,2) DEFAULT NULL,
  `Status_Order` enum('PENDING','IN_PROGRESS','COMPLETED','CANCELLED') DEFAULT NULL,
  `Waktu_Pesan_Order` datetime DEFAULT NULL,
  `Waktu_Selesai_Order` datetime DEFAULT NULL,
  `ID_Lokasi_Asal_Order` int(11) DEFAULT NULL,
  `ID_Lokasi_Tujuan_Order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`ID_Order`, `ID_Driver_Order`, `ID_Kendaraan_Order`, `ID_Konsumen_Order`, `Jarak_Order`, `Tarif_Order`, `Status_Order`, `Waktu_Pesan_Order`, `Waktu_Selesai_Order`, `ID_Lokasi_Asal_Order`, `ID_Lokasi_Tujuan_Order`) VALUES
(1, 1, 1, 1, 10.50, 50000.00, 'COMPLETED', '2024-06-20 08:00:00', '2024-06-20 08:30:00', 1, 2),
(2, 2, 2, 2, 5.00, 25000.00, 'PENDING', '2024-06-21 09:00:00', NULL, 3, 4),
(3, 3, 3, 3, 7.50, 35000.00, 'IN_PROGRESS', '2024-06-22 10:00:00', NULL, 5, 6),
(4, 4, 4, 4, 3.00, 15000.00, 'CANCELLED', '2024-06-23 11:00:00', NULL, 7, 1),
(5, 5, 5, 5, 12.00, 60000.00, 'COMPLETED', '2024-06-24 12:00:00', '2024-06-24 12:45:00', 2, 3),
(6, 6, 6, 6, 4.50, 22500.00, 'PENDING', '2024-06-25 13:00:00', NULL, 4, 5),
(7, 7, 7, 7, 8.00, 40000.00, 'IN_PROGRESS', '2024-06-26 14:00:00', NULL, 6, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_Pembayaran` int(11) NOT NULL,
  `ID_Order_Pembayaran` int(11) DEFAULT NULL,
  `ID_Promosi_Pembayaran` int(11) DEFAULT NULL,
  `Metode_Pembayaran` enum('CASH','CREDIT_CARD','EWALLET') DEFAULT NULL,
  `Status_Pembayaran` enum('PENDING','PAID','CANCELLED') DEFAULT NULL,
  `Waktu_Pembayaran` datetime DEFAULT NULL,
  `Jumlah_Pembayaran` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`ID_Pembayaran`, `ID_Order_Pembayaran`, `ID_Promosi_Pembayaran`, `Metode_Pembayaran`, `Status_Pembayaran`, `Waktu_Pembayaran`, `Jumlah_Pembayaran`) VALUES
(1, 1, 1, 'CASH', 'PAID', '2024-06-20 08:35:00', 45000.00),
(2, 2, 2, 'CREDIT_CARD', 'PENDING', NULL, 22500.00),
(3, 3, 3, 'EWALLET', 'PENDING', NULL, 31500.00),
(4, 4, 4, 'CASH', 'CANCELLED', '2024-06-23 11:05:00', 0.00),
(5, 5, 5, 'CREDIT_CARD', 'PAID', '2024-06-24 12:50:00', 54000.00),
(6, 6, 6, 'EWALLET', 'PENDING', NULL, 20250.00),
(7, 7, 7, 'CASH', 'PENDING', NULL, 36000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `ID_Penilaian` int(11) NOT NULL,
  `ID_Order_Penilaian` int(11) DEFAULT NULL,
  `ID_Driver_Penilaian` int(11) DEFAULT NULL,
  `Rating_Penilaian` decimal(2,1) DEFAULT NULL CHECK (`Rating_Penilaian` between 1.0 and 5.0),
  `Ulasan_Penilaian` text DEFAULT NULL,
  `Tanggal_Penilaian` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`ID_Penilaian`, `ID_Order_Penilaian`, `ID_Driver_Penilaian`, `Rating_Penilaian`, `Ulasan_Penilaian`, `Tanggal_Penilaian`) VALUES
(1, 1, 1, 4.5, 'Pelayanan sangat ramah dan kendaraan bersih.', '2024-06-20 09:00:00'),
(2, 2, 2, 3.0, 'Driver terlambat datang menjemput.', '2024-06-21 10:00:00'),
(3, 3, 3, 5.0, 'Sangat puas dengan pelayanan dan kecepatan pengiriman.', '2024-06-22 11:00:00'),
(4, 4, 4, 2.5, 'Order dibatalkan tanpa pemberitahuan sebelumnya.', '2024-06-23 12:00:00'),
(5, 5, 5, 4.0, 'Driver ramah dan tepat waktu.', '2024-06-24 13:00:00'),
(6, 6, 6, 3.5, 'Kendaraan kotor dan tidak nyaman.', '2024-06-25 14:00:00'),
(7, 7, 7, 4.5, 'Driver membantu membawa barang dengan baik.', '2024-06-26 15:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promosi`
--

CREATE TABLE `promosi` (
  `ID_Promosi` int(11) NOT NULL,
  `Nama_Promosi` varchar(255) DEFAULT NULL,
  `Deskripsi_Promosi` text DEFAULT NULL,
  `Potongan_Harga_Promosi` decimal(5,2) DEFAULT NULL,
  `Tanggal_Mulai_Promosi` datetime DEFAULT NULL,
  `Tanggal_Selesai_Promosi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `promosi`
--

INSERT INTO `promosi` (`ID_Promosi`, `Nama_Promosi`, `Deskripsi_Promosi`, `Potongan_Harga_Promosi`, `Tanggal_Mulai_Promosi`, `Tanggal_Selesai_Promosi`) VALUES
(1, 'Promo Ramadhan', 'Diskon spesial selama bulan Ramadhan', 10.00, '2024-03-23 00:00:00', '2024-04-23 23:59:59'),
(2, 'Promo Merdeka', 'Diskon untuk merayakan hari kemerdekaan', 15.00, '2024-08-01 00:00:00', '2024-08-31 23:59:59'),
(3, 'Promo Natal', 'Diskon khusus Natal', 20.00, '2024-12-01 00:00:00', '2024-12-25 23:59:59'),
(4, 'Promo Tahun Baru', 'Diskon untuk tahun baru', 25.00, '2024-12-26 00:00:00', '2025-01-01 23:59:59'),
(5, 'Promo Imlek', 'Diskon spesial Imlek', 12.00, '2024-02-01 00:00:00', '2024-02-15 23:59:59'),
(6, 'Promo Valentine', 'Diskon untuk Hari Valentine', 14.00, '2024-02-14 00:00:00', '2024-02-14 23:59:59'),
(7, 'Promo Lebaran', 'Diskon untuk merayakan Lebaran', 18.00, '2024-04-24 00:00:00', '2024-05-24 23:59:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`ID_Driver`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`ID_Kendaraan`),
  ADD KEY `ID_Layanan` (`ID_Layanan`);

--
-- Indeks untuk tabel `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`ID_Konsumen`);

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`ID_Layanan`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`ID_Lokasi`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID_Order`),
  ADD KEY `ID_Driver_Order` (`ID_Driver_Order`),
  ADD KEY `ID_Kendaraan_Order` (`ID_Kendaraan_Order`),
  ADD KEY `ID_Konsumen_Order` (`ID_Konsumen_Order`),
  ADD KEY `ID_Lokasi_Asal_Order` (`ID_Lokasi_Asal_Order`),
  ADD KEY `ID_Lokasi_Tujuan_Order` (`ID_Lokasi_Tujuan_Order`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD KEY `ID_Order_Pembayaran` (`ID_Order_Pembayaran`),
  ADD KEY `ID_Promosi_Pembayaran` (`ID_Promosi_Pembayaran`);

--
-- Indeks untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`ID_Penilaian`),
  ADD KEY `ID_Order_Penilaian` (`ID_Order_Penilaian`),
  ADD KEY `ID_Driver_Penilaian` (`ID_Driver_Penilaian`);

--
-- Indeks untuk tabel `promosi`
--
ALTER TABLE `promosi`
  ADD PRIMARY KEY (`ID_Promosi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `driver`
--
ALTER TABLE `driver`
  MODIFY `ID_Driver` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `ID_Kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `konsumen`
--
ALTER TABLE `konsumen`
  MODIFY `ID_Konsumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `layanan`
--
ALTER TABLE `layanan`
  MODIFY `ID_Layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `ID_Lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `ID_Order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `ID_Pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `ID_Penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `promosi`
--
ALTER TABLE `promosi`
  MODIFY `ID_Promosi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`ID_Layanan`) REFERENCES `layanan` (`ID_Layanan`);

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`ID_Driver_Order`) REFERENCES `driver` (`ID_Driver`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`ID_Kendaraan_Order`) REFERENCES `kendaraan` (`ID_Kendaraan`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`ID_Konsumen_Order`) REFERENCES `konsumen` (`ID_Konsumen`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`ID_Lokasi_Asal_Order`) REFERENCES `lokasi` (`ID_Lokasi`),
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`ID_Lokasi_Tujuan_Order`) REFERENCES `lokasi` (`ID_Lokasi`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_Order_Pembayaran`) REFERENCES `order` (`ID_Order`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`ID_Promosi_Pembayaran`) REFERENCES `promosi` (`ID_Promosi`);

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`ID_Order_Penilaian`) REFERENCES `order` (`ID_Order`),
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`ID_Driver_Penilaian`) REFERENCES `driver` (`ID_Driver`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
