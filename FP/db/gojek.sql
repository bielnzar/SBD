-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jun 2024 pada 21.49
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

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDriver` (IN `p_Nama_Driver` VARCHAR(255), IN `p_Alamat_Driver` TEXT, IN `p_Foto_Driver` BLOB, IN `p_No_Telepon_Driver` VARCHAR(15), IN `p_Status_Aktif_Driver` TINYINT, IN `p_Email_Driver` VARCHAR(255))   BEGIN
    INSERT INTO driver (Nama_Driver, Alamat_Driver, Foto_Driver, No_Telepon_Driver, Status_Aktif_Driver, Email_Driver)
    VALUES (p_Nama_Driver, p_Alamat_Driver, p_Foto_Driver, p_No_Telepon_Driver, p_Status_Aktif_Driver, p_Email_Driver);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddKonsumen` (IN `p_Nama_Konsumen` VARCHAR(255), IN `p_Alamat_Konsumen` VARCHAR(255), IN `p_No_Telepon_Konsumen` VARCHAR(15), IN `p_Email_Konsumen` VARCHAR(255), IN `p_Tanggal_Lahir_Konsumen` DATE)   BEGIN
    INSERT INTO konsumen (Nama_Konsumen, Alamat_Konsumen, No_Telepon_Konsumen, Email_Konsumen, Tanggal_Lahir_Konsumen)
    VALUES (p_Nama_Konsumen, p_Alamat_Konsumen, p_No_Telepon_Konsumen, p_Email_Konsumen, p_Tanggal_Lahir_Konsumen);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDriver` (IN `p_ID_Driver` INT)   BEGIN
    DELETE FROM penilaian 
    WHERE ID_Order_Penilaian IN (SELECT ID_Order FROM `order` WHERE ID_Driver_Order = p_ID_Driver);
    
    DELETE FROM pembayaran 
    WHERE ID_Order_Pembayaran IN (SELECT ID_Order FROM `order` WHERE ID_Driver_Order = p_ID_Driver);

    DELETE FROM `order` WHERE ID_Driver_Order = p_ID_Driver;

    DELETE FROM driver WHERE ID_Driver = p_ID_Driver;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteKonsumen` (IN `p_ID_Konsumen` INT)   BEGIN
    DELETE FROM konsumen
    WHERE ID_Konsumen = p_ID_Konsumen;
END$$

--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `CountActiveDrivers` () RETURNS INT(11)  BEGIN
    DECLARE total_active INT;
    SET total_active = (SELECT COUNT(*) FROM driver WHERE Status_Aktif_Driver = 1);
    RETURN total_active;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `GetDriverName` (`driver_id` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
    DECLARE full_name VARCHAR(255);
    SELECT Nama_Driver INTO full_name FROM driver WHERE ID_Driver = driver_id;
    RETURN full_name;
END$$

DELIMITER ;

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
  `Tarif_Order` int(11) DEFAULT NULL,
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
(1, 1, 1, 1, 10.50, 50000, 'COMPLETED', '2024-06-20 08:00:00', '2024-06-20 08:30:00', 1, 2),
(2, 2, 2, 2, 5.00, 25000, 'PENDING', '2024-06-21 09:00:00', NULL, 3, 4),
(3, 3, 3, 3, 7.50, 35000, 'IN_PROGRESS', '2024-06-22 10:00:00', NULL, 5, 6),
(4, 4, 4, 4, 3.00, 15000, 'CANCELLED', '2024-06-23 11:00:00', NULL, 7, 1),
(5, 5, 5, 5, 12.00, 60000, 'COMPLETED', '2024-06-24 12:00:00', '2024-06-24 12:45:00', 2, 3),
(6, 6, 6, 6, 4.50, 22500, 'PENDING', '2024-06-25 13:00:00', NULL, 4, 5),
(7, 7, 7, 7, 8.00, 40000, 'IN_PROGRESS', '2024-06-26 14:00:00', NULL, 6, 7);

--
-- Trigger `order`
--
DELIMITER $$
CREATE TRIGGER `update_status_driver` AFTER INSERT ON `order` FOR EACH ROW BEGIN
  DECLARE pending_in_progress_count INT;

  SELECT COUNT(*)
  INTO pending_in_progress_count
  FROM `Order`
  WHERE ID_Driver_Order = NEW.ID_Driver_Order
    AND Status_Order IN ('PENDING', 'IN_PROGRESS');

  IF pending_in_progress_count >= 2 THEN
    UPDATE Driver
    SET Status_Aktif_Driver = 0
    WHERE ID_Driver = NEW.ID_Driver_Order;
  END IF;
END
$$
DELIMITER ;

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
  `Jumlah_Pembayaran` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`ID_Pembayaran`, `ID_Order_Pembayaran`, `ID_Promosi_Pembayaran`, `Metode_Pembayaran`, `Status_Pembayaran`, `Waktu_Pembayaran`, `Jumlah_Pembayaran`) VALUES
(1, 1, 1, 'CASH', 'PAID', '2024-06-20 08:35:00', 45000),
(2, 2, 2, 'CREDIT_CARD', 'PENDING', NULL, 22500),
(3, 3, 3, 'EWALLET', 'PENDING', NULL, 31500),
(4, 4, 4, 'CASH', 'CANCELLED', '2024-06-23 11:05:00', 0),
(5, 5, 5, 'CREDIT_CARD', 'PAID', '2024-06-24 12:50:00', 54000),
(6, 6, 6, 'EWALLET', 'PENDING', NULL, 20250),
(7, 7, 7, 'CASH', 'PENDING', NULL, 36000);

--
-- Trigger `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `update_status_order` AFTER UPDATE ON `pembayaran` FOR EACH ROW BEGIN
  IF NEW.Status_Pembayaran = 'PAID' THEN
    UPDATE `Order`
    SET Status_Order = 'COMPLETED',
        Waktu_Selesai_Order = NEW.Waktu_Pembayaran
    WHERE ID_Order = NEW.ID_Order_Pembayaran;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_pay` BEFORE INSERT ON `pembayaran` FOR EACH ROW BEGIN
  DECLARE discount DECIMAL(5,2);
  
  IF NEW.ID_Promosi_Pembayaran IS NOT NULL THEN
    SELECT Potongan_Harga_Promosi
    INTO discount
    FROM Promosi
    WHERE ID_Promosi = NEW.ID_Promosi_Pembayaran;
  ELSE
    SET discount = 0;
  END IF;
  
  SET NEW.Jumlah_Pembayaran = NEW.Jumlah_Pembayaran - (NEW.Jumlah_Pembayaran * discount / 100);
END
$$
DELIMITER ;

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

--
-- Trigger `penilaian`
--
DELIMITER $$
CREATE TRIGGER `update_rate_driver` AFTER INSERT ON `penilaian` FOR EACH ROW BEGIN
  DECLARE avg_rating DECIMAL(2,1);

  SELECT AVG(Rating_Penilaian)
  INTO avg_rating
  FROM Penilaian
  WHERE ID_Driver_Penilaian = NEW.ID_Driver_Penilaian;

  UPDATE Driver
  SET Rating_Driver = avg_rating
  WHERE ID_Driver = NEW.ID_Driver_Penilaian;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `promosi`
--

CREATE TABLE `promosi` (
  `ID_Promosi` int(11) NOT NULL,
  `Nama_Promosi` varchar(255) DEFAULT NULL,
  `Deskripsi_Promosi` text DEFAULT NULL,
  `Potongan_Harga_Promosi` int(11) DEFAULT NULL,
  `Tanggal_Mulai_Promosi` datetime DEFAULT NULL,
  `Tanggal_Selesai_Promosi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `promosi`
--

INSERT INTO `promosi` (`ID_Promosi`, `Nama_Promosi`, `Deskripsi_Promosi`, `Potongan_Harga_Promosi`, `Tanggal_Mulai_Promosi`, `Tanggal_Selesai_Promosi`) VALUES
(1, 'Promo Ramadhan', 'Diskon spesial selama bulan Ramadhan', 10, '2024-03-23 00:00:00', '2024-04-23 23:59:59'),
(2, 'Promo Merdeka', 'Diskon untuk merayakan hari kemerdekaan', 15, '2024-06-01 00:00:00', '2024-08-31 23:59:59'),
(3, 'Promo Natal', 'Diskon khusus Natal', 20, '2024-12-01 00:00:00', '2024-12-25 23:59:59'),
(4, 'Promo Tahun Baru', 'Diskon untuk tahun baru', 25, '2024-12-26 00:00:00', '2025-01-01 23:59:59'),
(5, 'Promo Imlek', 'Diskon spesial Imlek', 12, '2024-02-01 00:00:00', '2024-02-15 23:59:59'),
(6, 'Promo Valentine', 'Diskon untuk Hari Valentine', 14, '2024-02-14 00:00:00', '2024-02-14 23:59:59'),
(7, 'Qurban', 'Diskon untuk merayakan Idul Adha', 18, '2024-04-24 00:00:00', '2024-06-30 23:59:59');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_active_drivers`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_active_drivers` (
`ID_Driver` int(11)
,`Nama_Driver` varchar(255)
,`Alamat_Driver` text
,`No_Telepon_Driver` varchar(15)
,`Email_Driver` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_active_promotions`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_active_promotions` (
`ID_Promosi` int(11)
,`Nama_Promosi` varchar(255)
,`Deskripsi_Promosi` text
,`Potongan_Harga_Promosi` int(11)
,`Tanggal_Mulai_Promosi` datetime
,`Tanggal_Selesai_Promosi` datetime
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_driver_ratings`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_driver_ratings` (
`ID_Driver` int(11)
,`Nama_Driver` varchar(255)
,`Jumlah_Penilaian` bigint(21)
,`Rata_Rata_Rating` decimal(4,2)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_order_details`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_order_details` (
`ID_Order` int(11)
,`ID_Driver_Order` int(11)
,`Nama_Driver` varchar(255)
,`ID_Kendaraan_Order` int(11)
,`Jenis_Kendaraan` varchar(50)
,`No_Plat_Kendaraan` varchar(15)
,`ID_Konsumen_Order` int(11)
,`Nama_Konsumen` varchar(255)
,`Jarak_Order` decimal(5,2)
,`Tarif_Order` int(11)
,`Status_Order` enum('PENDING','IN_PROGRESS','COMPLETED','CANCELLED')
,`Waktu_Pesan_Order` datetime
,`Waktu_Selesai_Order` datetime
,`ID_Lokasi_Asal_Order` int(11)
,`Lokasi_Asal` varchar(255)
,`ID_Lokasi_Tujuan_Order` int(11)
,`Lokasi_Tujuan` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_payment_details`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_payment_details` (
`ID_Order` int(11)
,`Jarak_Order` decimal(5,2)
,`Tarif_Order` int(11)
,`Potongan_Harga_Promosi` int(11)
,`Total_Tagihan_Setelah_Promosi` decimal(24,2)
,`Metode_Pembayaran` enum('CASH','CREDIT_CARD','EWALLET')
,`Status_Pembayaran` enum('PENDING','PAID','CANCELLED')
,`Waktu_Pembayaran` datetime
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_ratings`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_ratings` (
`ID_Penilaian` int(11)
,`ID_Order_Penilaian` int(11)
,`ID_Driver_Penilaian` int(11)
,`Nama_Driver` varchar(255)
,`Rating_Penilaian` decimal(2,1)
,`Ulasan_Penilaian` text
,`Tanggal_Penilaian` datetime
,`ID_Konsumen_Order` int(11)
,`Nama_Konsumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_status_orders`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_status_orders` (
`ID_Order` int(11)
,`ID_Driver_Order` int(11)
,`Nama_Driver` varchar(255)
,`ID_Kendaraan_Order` int(11)
,`Jenis_Kendaraan` varchar(50)
,`ID_Konsumen_Order` int(11)
,`Nama_Konsumen` varchar(255)
,`Jarak_Order` decimal(5,2)
,`Tarif_Order` int(11)
,`Status_Order` enum('PENDING','IN_PROGRESS','COMPLETED','CANCELLED')
,`Waktu_Pesan_Order` datetime
,`ID_Lokasi_Asal_Order` int(11)
,`Lokasi_Asal` varchar(255)
,`ID_Lokasi_Tujuan_Order` int(11)
,`Lokasi_Tujuan` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_active_drivers`
--
DROP TABLE IF EXISTS `view_active_drivers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_active_drivers`  AS SELECT `d`.`ID_Driver` AS `ID_Driver`, `d`.`Nama_Driver` AS `Nama_Driver`, `d`.`Alamat_Driver` AS `Alamat_Driver`, `d`.`No_Telepon_Driver` AS `No_Telepon_Driver`, `d`.`Email_Driver` AS `Email_Driver` FROM `driver` AS `d` WHERE `d`.`Status_Aktif_Driver` = 1 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_active_promotions`
--
DROP TABLE IF EXISTS `view_active_promotions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_active_promotions`  AS SELECT `pr`.`ID_Promosi` AS `ID_Promosi`, `pr`.`Nama_Promosi` AS `Nama_Promosi`, `pr`.`Deskripsi_Promosi` AS `Deskripsi_Promosi`, `pr`.`Potongan_Harga_Promosi` AS `Potongan_Harga_Promosi`, `pr`.`Tanggal_Mulai_Promosi` AS `Tanggal_Mulai_Promosi`, `pr`.`Tanggal_Selesai_Promosi` AS `Tanggal_Selesai_Promosi` FROM `promosi` AS `pr` WHERE current_timestamp() between `pr`.`Tanggal_Mulai_Promosi` and `pr`.`Tanggal_Selesai_Promosi` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_driver_ratings`
--
DROP TABLE IF EXISTS `view_driver_ratings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_driver_ratings`  AS SELECT `d`.`ID_Driver` AS `ID_Driver`, `d`.`Nama_Driver` AS `Nama_Driver`, count(`p`.`ID_Penilaian`) AS `Jumlah_Penilaian`, round(avg(`p`.`Rating_Penilaian`),2) AS `Rata_Rata_Rating` FROM (`driver` `d` left join `penilaian` `p` on(`d`.`ID_Driver` = `p`.`ID_Driver_Penilaian`)) GROUP BY `d`.`ID_Driver`, `d`.`Nama_Driver` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_order_details`
--
DROP TABLE IF EXISTS `view_order_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_details`  AS SELECT `o`.`ID_Order` AS `ID_Order`, `o`.`ID_Driver_Order` AS `ID_Driver_Order`, `d`.`Nama_Driver` AS `Nama_Driver`, `o`.`ID_Kendaraan_Order` AS `ID_Kendaraan_Order`, `k`.`Jenis_Kendaraan` AS `Jenis_Kendaraan`, `k`.`No_Plat_Kendaraan` AS `No_Plat_Kendaraan`, `o`.`ID_Konsumen_Order` AS `ID_Konsumen_Order`, `c`.`Nama_Konsumen` AS `Nama_Konsumen`, `o`.`Jarak_Order` AS `Jarak_Order`, `o`.`Tarif_Order` AS `Tarif_Order`, `o`.`Status_Order` AS `Status_Order`, `o`.`Waktu_Pesan_Order` AS `Waktu_Pesan_Order`, `o`.`Waktu_Selesai_Order` AS `Waktu_Selesai_Order`, `o`.`ID_Lokasi_Asal_Order` AS `ID_Lokasi_Asal_Order`, `la`.`Nama_Lokasi` AS `Lokasi_Asal`, `o`.`ID_Lokasi_Tujuan_Order` AS `ID_Lokasi_Tujuan_Order`, `lt`.`Nama_Lokasi` AS `Lokasi_Tujuan` FROM (((((`order` `o` join `driver` `d` on(`o`.`ID_Driver_Order` = `d`.`ID_Driver`)) join `kendaraan` `k` on(`o`.`ID_Kendaraan_Order` = `k`.`ID_Kendaraan`)) join `konsumen` `c` on(`o`.`ID_Konsumen_Order` = `c`.`ID_Konsumen`)) join `lokasi` `la` on(`o`.`ID_Lokasi_Asal_Order` = `la`.`ID_Lokasi`)) join `lokasi` `lt` on(`o`.`ID_Lokasi_Tujuan_Order` = `lt`.`ID_Lokasi`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_payment_details`
--
DROP TABLE IF EXISTS `view_payment_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_payment_details`  AS SELECT `o`.`ID_Order` AS `ID_Order`, `o`.`Jarak_Order` AS `Jarak_Order`, `o`.`Tarif_Order` AS `Tarif_Order`, ifnull(`pr`.`Potongan_Harga_Promosi`,0) AS `Potongan_Harga_Promosi`, round(ifnull(`o`.`Tarif_Order` - `o`.`Tarif_Order` * (`pr`.`Potongan_Harga_Promosi` / 100),0),2) AS `Total_Tagihan_Setelah_Promosi`, `p`.`Metode_Pembayaran` AS `Metode_Pembayaran`, `p`.`Status_Pembayaran` AS `Status_Pembayaran`, `p`.`Waktu_Pembayaran` AS `Waktu_Pembayaran` FROM ((`order` `o` left join `pembayaran` `p` on(`o`.`ID_Order` = `p`.`ID_Order_Pembayaran`)) left join `promosi` `pr` on(`p`.`ID_Promosi_Pembayaran` = `pr`.`ID_Promosi`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_ratings`
--
DROP TABLE IF EXISTS `view_ratings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ratings`  AS SELECT `pen`.`ID_Penilaian` AS `ID_Penilaian`, `pen`.`ID_Order_Penilaian` AS `ID_Order_Penilaian`, `pen`.`ID_Driver_Penilaian` AS `ID_Driver_Penilaian`, `d`.`Nama_Driver` AS `Nama_Driver`, `pen`.`Rating_Penilaian` AS `Rating_Penilaian`, `pen`.`Ulasan_Penilaian` AS `Ulasan_Penilaian`, `pen`.`Tanggal_Penilaian` AS `Tanggal_Penilaian`, `o`.`ID_Konsumen_Order` AS `ID_Konsumen_Order`, `c`.`Nama_Konsumen` AS `Nama_Konsumen` FROM (((`penilaian` `pen` join `order` `o` on(`pen`.`ID_Order_Penilaian` = `o`.`ID_Order`)) join `driver` `d` on(`pen`.`ID_Driver_Penilaian` = `d`.`ID_Driver`)) join `konsumen` `c` on(`o`.`ID_Konsumen_Order` = `c`.`ID_Konsumen`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_status_orders`
--
DROP TABLE IF EXISTS `view_status_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_status_orders`  AS SELECT `o`.`ID_Order` AS `ID_Order`, `o`.`ID_Driver_Order` AS `ID_Driver_Order`, `d`.`Nama_Driver` AS `Nama_Driver`, `o`.`ID_Kendaraan_Order` AS `ID_Kendaraan_Order`, `k`.`Jenis_Kendaraan` AS `Jenis_Kendaraan`, `o`.`ID_Konsumen_Order` AS `ID_Konsumen_Order`, `c`.`Nama_Konsumen` AS `Nama_Konsumen`, `o`.`Jarak_Order` AS `Jarak_Order`, `o`.`Tarif_Order` AS `Tarif_Order`, `o`.`Status_Order` AS `Status_Order`, `o`.`Waktu_Pesan_Order` AS `Waktu_Pesan_Order`, `o`.`ID_Lokasi_Asal_Order` AS `ID_Lokasi_Asal_Order`, `la`.`Nama_Lokasi` AS `Lokasi_Asal`, `o`.`ID_Lokasi_Tujuan_Order` AS `ID_Lokasi_Tujuan_Order`, `lt`.`Nama_Lokasi` AS `Lokasi_Tujuan` FROM (((((`order` `o` join `driver` `d` on(`o`.`ID_Driver_Order` = `d`.`ID_Driver`)) join `kendaraan` `k` on(`o`.`ID_Kendaraan_Order` = `k`.`ID_Kendaraan`)) join `konsumen` `c` on(`o`.`ID_Konsumen_Order` = `c`.`ID_Konsumen`)) join `lokasi` `la` on(`o`.`ID_Lokasi_Asal_Order` = `la`.`ID_Lokasi`)) join `lokasi` `lt` on(`o`.`ID_Lokasi_Tujuan_Order` = `lt`.`ID_Lokasi`)) WHERE `o`.`Status_Order` in ('PENDING','IN_PROGRESS') ;

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
  MODIFY `ID_Driver` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
