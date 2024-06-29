-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 10:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myits_mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `NIP_Dosen` int(11) NOT NULL,
  `Nama_Dosen` varchar(255) DEFAULT NULL,
  `Departemen_Dosen` varchar(255) DEFAULT NULL,
  `Alamat_Dosen` text DEFAULT NULL,
  `No_Telp_Dosen` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`NIP_Dosen`, `Nama_Dosen`, `Departemen_Dosen`, `Alamat_Dosen`, `No_Telp_Dosen`) VALUES
(101, 'Asnawi Mangkualam', 'Teknologi Informasi', 'Perumdos Blok A No. 12', '0812-3456-7890'),
(102, 'Pratama Arhan', 'Teknologi Informasi', 'Bumi Marina Emas Blok B No. 21', '0831-4567-8901'),
(103, 'Bambang Pamungkas', 'Teknologi Informasi', 'Keputih Tegal Timur No. 9', '0852-6789-0123'),
(104, 'Egy Maulana Vikri', 'Teknologi Informasi', 'Bumi Marina Emas Blok A No. 3', '0896-7890-1234'),
(201, 'Witan Sulaeman', 'Matematika', 'Keputih Tegal No. 45', '0821-2345-6789'),
(301, 'Evan Dimas', 'Informatika', 'Perumdos Blok C No. 8', '0813-5678-9012'),
(401, 'Rachmat Irianto', 'Sistem Informasi', 'Kejawan Gebang No. 11', '0878-8901-2345');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_Jadwal` int(11) NOT NULL,
  `Date_Jadwal` date DEFAULT NULL,
  `Ruang_Jadwal` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`ID_Jadwal`, `Date_Jadwal`, `Ruang_Jadwal`) VALUES
(1, '2024-05-01', 'TW 2 - 703'),
(2, '2024-05-02', 'TW 1 - 301'),
(3, '2024-05-03', 'TW 2 - 702'),
(4, '2024-05-04', 'TW 2 - 705'),
(5, '2024-05-05', 'Lab - KCKS'),
(6, '2024-05-06', 'TW 2 - 701'),
(7, '2024-05-07', 'TW 1 - 501');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `ID_Kelas` varchar(255) NOT NULL,
  `ID_Matkul` varchar(255) DEFAULT NULL,
  `NRP_Mhs` bigint(20) DEFAULT NULL,
  `NIP_Dosen` int(11) DEFAULT NULL,
  `ID_Jadwal` int(11) DEFAULT NULL,
  `ID_Presensi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`ID_Kelas`, `ID_Matkul`, `NRP_Mhs`, `NIP_Dosen`, `ID_Jadwal`, `ID_Presensi`) VALUES
('E501-01', 'E501', 5027231073, 101, 1, 5101),
('E501-02', 'E501', 5027231074, 101, 1, 5102),
('E501-03', 'E501', 5027231075, 101, 1, 5103),
('E501-04', 'E501', 5027231076, 101, 1, 5104),
('E501-05', 'E501', 5027231077, 101, 1, 5105),
('E501-06', 'E501', 5027231078, 101, 1, 5106),
('E501-07', 'E501', 5027231079, 101, 1, 5107),
('E502-01', 'E502', 5027231073, 201, 2, 5201),
('E502-02', 'E502', 5027231074, 201, 2, 5202),
('E502-03', 'E502', 5027231075, 201, 2, 5203),
('E502-04', 'E502', 5027231076, 201, 2, 5204),
('E502-05', 'E502', 5027231077, 201, 2, 5205),
('E502-06', 'E502', 5027231078, 201, 2, 5206),
('E502-07', 'E502', 5027231079, 201, 2, 5207),
('E503-01', 'E503', 5027231073, 102, 3, 5301),
('E503-02', 'E503', 5027231074, 102, 3, 5302),
('E503-03', 'E503', 5027231075, 102, 3, 5303),
('E503-04', 'E503', 5027231076, 102, 3, 5304),
('E503-05', 'E503', 5027231077, 102, 3, 5305),
('E503-06', 'E503', 5027231078, 102, 3, 5306),
('E503-07', 'E503', 5027231079, 102, 3, 5307),
('E504-01', 'E504', 5027231073, 301, 4, 5401),
('E504-02', 'E504', 5027231074, 301, 4, 5402),
('E504-03', 'E504', 5027231075, 301, 4, 5403),
('E504-04', 'E504', 5027231076, 301, 4, 5404),
('E504-05', 'E504', 5027231077, 301, 4, 5405),
('E504-06', 'E504', 5027231078, 301, 4, 5406),
('E504-07', 'E504', 5027231079, 301, 4, 5407),
('E505-01', 'E505', 5027231073, 103, 5, 5501),
('E505-02', 'E505', 5027231074, 103, 5, 5502),
('E505-03', 'E505', 5027231075, 103, 5, 5503),
('E505-04', 'E505', 5027231076, 103, 5, 5504),
('E505-05', 'E505', 5027231077, 103, 5, 5505),
('E505-06', 'E505', 5027231078, 103, 5, 5506),
('E505-07', 'E505', 5027231079, 103, 5, 5507),
('E506-01', 'E506', 5027231073, 104, 6, 5601),
('E506-02', 'E506', 5027231074, 104, 6, 5602),
('E506-03', 'E506', 5027231075, 104, 6, 5603),
('E506-04', 'E506', 5027231076, 104, 6, 5604),
('E506-05', 'E506', 5027231077, 104, 6, 5605),
('E506-06', 'E506', 5027231078, 104, 6, 5606),
('E506-07', 'E506', 5027231079, 104, 6, 5607),
('E507-01', 'E507', 5027231073, 401, 7, 5701),
('E507-02', 'E507', 5027231074, 401, 7, 5702),
('E507-03', 'E507', 5027231075, 401, 7, 5703),
('E507-04', 'E507', 5027231076, 401, 7, 5704),
('E507-05', 'E507', 5027231077, 401, 7, 5705),
('E507-06', 'E507', 5027231078, 401, 7, 5706),
('E507-07', 'E507', 5027231079, 401, 7, 5707);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NRP_Mhs` bigint(20) NOT NULL,
  `ID_Tagihan` int(11) DEFAULT NULL,
  `ID_Transkrip` int(11) DEFAULT NULL,
  `Nama_Mhs` varchar(255) DEFAULT NULL,
  `Departemen_Mhs` varchar(255) DEFAULT NULL,
  `TTL_Mhs` date DEFAULT NULL,
  `Alamat_Mhs` text DEFAULT NULL,
  `Email_Mhs` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NRP_Mhs`, `ID_Tagihan`, `ID_Transkrip`, `Nama_Mhs`, `Departemen_Mhs`, `TTL_Mhs`, `Alamat_Mhs`, `Email_Mhs`) VALUES
(5027231073, 73, 173, 'Hasan Adiwena', 'Teknologi Informasi', '2003-02-25', 'Jl. Gajah Mada No. 10, Surabaya', 'hasan.adiwena@gmail.com'),
(5027231074, 74, 174, 'Udin Prawandha', 'Teknologi Informasi', '2002-10-17', 'Jl. Darmo No. 15, Surabaya', 'udin.prawandha02@gmail.com'),
(5027231075, 75, 175, 'Joko Owarianto', 'Teknologi Informasi', '2004-01-26', 'Jl. Raya ITS No. 5, Surabaya', 'joko.owarianto04@gmail.com'),
(5027231076, 76, 176, 'Ahmad Maulana', 'Teknologi Informasi', '2004-12-28', 'Jl. Mulyorejo No. 8, Surabaya', 'ahmad.maulana2004@gmail.com'),
(5027231077, 77, 177, 'Naufal Nasution', 'Teknologi Informasi', '2005-04-13', 'Jl. Ketintang No. 25, Surabaya', 'naufal_nasution.05@gmail.com'),
(5027231078, 78, 178, 'Prasetio', 'Teknologi Informasi', '2006-05-26', 'Jl. Lidah Kulon No. 12, Surabaya', 'prasetio0606@gmail.com'),
(5027231079, 79, 179, 'Krisna Khansa', 'Teknologi Informasi', '2004-04-16', 'Jl. Mayjen Sungkono No. 30, Surabaya', 'krisna.khansa84@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `ID_Matkul` varchar(255) NOT NULL,
  `Nama_Matkul` varchar(255) DEFAULT NULL,
  `SKS_Matkul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`ID_Matkul`, `Nama_Matkul`, `SKS_Matkul`) VALUES
('E501', 'Arsitektur Enterprise', 3),
('E502', 'Kalkulus 2', 3),
('E503', 'Sistem Basis Data', 4),
('E504', 'Sistem Operasi', 4),
('E505', 'Struktur Data dan Pemrograman Berorientasi Objek', 3),
('E506', 'Teknologi Komputasi Awan', 4),
('E507', 'Interaksi Manusia dan Komputer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `ID_Presensi` int(11) NOT NULL,
  `Date_Presensi` date DEFAULT NULL,
  `Status_Presensi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`ID_Presensi`, `Date_Presensi`, `Status_Presensi`) VALUES
(5101, '2024-05-01', 'Hadir'),
(5102, '2024-05-01', 'Hadir'),
(5103, '2024-05-01', 'Hadir'),
(5104, '2024-05-01', 'Sakit'),
(5105, '2024-05-01', 'Hadir'),
(5106, '2024-05-01', 'Hadir'),
(5107, '2024-05-01', 'Hadir'),
(5201, '2024-05-02', 'Alpa'),
(5202, '2024-05-02', 'Hadir'),
(5203, '2024-05-02', 'Hadir'),
(5204, '2024-05-02', 'Sakit'),
(5205, '2024-05-02', 'Hadir'),
(5206, '2024-05-02', 'Hadir'),
(5207, '2024-05-02', 'Hadir'),
(5301, '2024-05-03', 'Hadir'),
(5302, '2024-05-03', 'Hadir'),
(5303, '2024-05-03', 'Izin'),
(5304, '2024-05-03', 'Hadir'),
(5305, '2024-05-03', 'Hadir'),
(5306, '2024-05-03', 'Hadir'),
(5307, '2024-05-03', 'Hadir'),
(5401, '2024-05-04', 'Hadir'),
(5402, '2024-05-04', 'Hadir'),
(5403, '2024-05-04', 'Hadir'),
(5404, '2024-05-04', 'Hadir'),
(5405, '2024-05-04', 'Hadir'),
(5406, '2024-05-04', 'Hadir'),
(5407, '2024-05-04', 'Alpa'),
(5501, '2024-05-05', 'Hadir'),
(5502, '2024-05-05', 'Hadir'),
(5503, '2024-05-05', 'Hadir'),
(5504, '2024-05-05', 'Hadir'),
(5505, '2024-05-05', 'Alpa'),
(5506, '2024-05-05', 'Hadir'),
(5507, '2024-05-05', 'Hadir'),
(5601, '2024-05-06', 'Hadir'),
(5602, '2024-05-06', 'Hadir'),
(5603, '2024-05-06', 'Hadir'),
(5604, '2024-05-06', 'Sakit'),
(5605, '2024-05-06', 'Hadir'),
(5606, '2024-05-06', 'Hadir'),
(5607, '2024-05-06', 'Hadir'),
(5701, '2024-05-07', 'Hadir'),
(5702, '2024-05-07', 'Hadir'),
(5703, '2024-05-07', 'Hadir'),
(5704, '2024-05-07', 'Hadir'),
(5705, '2024-05-07', 'Hadir'),
(5706, '2024-05-07', 'Hadir'),
(5707, '2024-05-07', 'Hadir');

-- --------------------------------------------------------

--
-- Table structure for table `transkrip`
--

CREATE TABLE `transkrip` (
  `ID_Transkrip` int(11) NOT NULL,
  `IPK_Mhs` decimal(3,2) DEFAULT NULL,
  `SKS_Mhs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transkrip`
--

INSERT INTO `transkrip` (`ID_Transkrip`, `IPK_Mhs`, `SKS_Mhs`) VALUES
(173, 9.99, 39),
(174, 9.99, 39),
(175, 9.99, 39),
(176, 9.99, 43),
(177, 9.99, 43),
(178, 9.99, 43),
(179, 9.99, 39);

-- --------------------------------------------------------

--
-- Table structure for table `uang_kuliah`
--

CREATE TABLE `uang_kuliah` (
  `ID_Tagihan` int(11) NOT NULL,
  `Keterangan_Tagihan` varchar(255) DEFAULT NULL,
  `UKT_Kuliah` decimal(10,2) DEFAULT NULL,
  `SPI_Kuliah` decimal(10,2) DEFAULT NULL,
  `IKOMA_Kuliah` decimal(10,2) DEFAULT NULL,
  `Total_Tagihan` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uang_kuliah`
--

INSERT INTO `uang_kuliah` (`ID_Tagihan`, `Keterangan_Tagihan`, `UKT_Kuliah`, `SPI_Kuliah`, `IKOMA_Kuliah`, `Total_Tagihan`) VALUES
(73, 'Lunas', 7500000.00, 50000000.00, 400000.00, 0.00),
(74, 'Belum Lunas', 5000000.00, 0.00, 400000.00, 400000.00),
(75, 'Belum Lunas', 7500000.00, 75000000.00, 400000.00, 7500000.00),
(76, 'Lunas', 0.00, 0.00, 400000.00, 0.00),
(77, 'Lunas', 7500000.00, 75000000.00, 400000.00, 0.00),
(78, 'Lunas', 3000000.00, 0.00, 400000.00, 0.00),
(79, 'Belum Lunas', 5000000.00, 0.00, 400000.00, 5400000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP_Dosen`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_Jadwal`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`ID_Kelas`),
  ADD KEY `ID_Matkul` (`ID_Matkul`),
  ADD KEY `NRP_Mhs` (`NRP_Mhs`),
  ADD KEY `NIP_Dosen` (`NIP_Dosen`),
  ADD KEY `ID_Jadwal` (`ID_Jadwal`),
  ADD KEY `ID_Presensi` (`ID_Presensi`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NRP_Mhs`),
  ADD KEY `ID_Tagihan` (`ID_Tagihan`),
  ADD KEY `ID_Transkrip` (`ID_Transkrip`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`ID_Matkul`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`ID_Presensi`);

--
-- Indexes for table `transkrip`
--
ALTER TABLE `transkrip`
  ADD PRIMARY KEY (`ID_Transkrip`);

--
-- Indexes for table `uang_kuliah`
--
ALTER TABLE `uang_kuliah`
  ADD PRIMARY KEY (`ID_Tagihan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`ID_Matkul`) REFERENCES `mata_kuliah` (`ID_Matkul`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`NRP_Mhs`) REFERENCES `mahasiswa` (`NRP_Mhs`),
  ADD CONSTRAINT `kelas_ibfk_3` FOREIGN KEY (`NIP_Dosen`) REFERENCES `dosen` (`NIP_Dosen`),
  ADD CONSTRAINT `kelas_ibfk_4` FOREIGN KEY (`ID_Jadwal`) REFERENCES `jadwal` (`ID_Jadwal`),
  ADD CONSTRAINT `kelas_ibfk_5` FOREIGN KEY (`ID_Presensi`) REFERENCES `presensi` (`ID_Presensi`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`ID_Tagihan`) REFERENCES `uang_kuliah` (`ID_Tagihan`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`ID_Transkrip`) REFERENCES `transkrip` (`ID_Transkrip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
