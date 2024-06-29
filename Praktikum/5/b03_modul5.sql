-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 12:43 PM
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
-- Database: `b04_sbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id_appointment` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `jenis_appointment` varchar(40) DEFAULT NULL,
  `jam_mulai_appointment` time DEFAULT NULL,
  `jam_selesai_appointment` time DEFAULT NULL,
  `tanggal_mulai_appointment` date DEFAULT NULL,
  `tanggal_selesai_appointment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_appointment`
--

CREATE TABLE `detail_appointment` (
  `id_detail_appointment` int(11) NOT NULL,
  `id_appointment` int(11) DEFAULT NULL,
  `id_tenaga_medis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id_diagnosis` int(11) DEFAULT NULL,
  `id_detail_appointment` int(11) DEFAULT NULL,
  `id_tenaga_medis` int(11) DEFAULT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `gejala` varchar(250) DEFAULT NULL,
  `penyakit` varchar(50) DEFAULT NULL,
  `obat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(80) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `alamat_pasien` varchar(50) DEFAULT NULL,
  `no_telp_pasien` varchar(15) DEFAULT NULL,
  `email_pasien` varchar(20) DEFAULT NULL,
  `no_bpjs_pasien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_medis`
--

CREATE TABLE `tenaga_medis` (
  `id_tenaga_medis` int(11) NOT NULL,
  `nama_tenaga_medis` varchar(80) DEFAULT NULL,
  `jabatan` varchar(15) DEFAULT NULL,
  `alamat_tenaga_medis` varchar(50) DEFAULT NULL,
  `email_tenaga_medis` varchar(20) DEFAULT NULL,
  `no_telp_tenaga_medis` varchar(15) DEFAULT NULL,
  `departemen_tenaga_medis` varchar(20) DEFAULT NULL,
  `spesialis_tenaga_medis` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id_appointment`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `detail_appointment`
--
ALTER TABLE `detail_appointment`
  ADD PRIMARY KEY (`id_detail_appointment`),
  ADD KEY `id_appointment` (`id_appointment`),
  ADD KEY `id_tenaga_medis` (`id_tenaga_medis`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD KEY `id_detail_appointment` (`id_detail_appointment`),
  ADD KEY `id_tenaga_medis` (`id_tenaga_medis`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `tenaga_medis`
--
ALTER TABLE `tenaga_medis`
  ADD PRIMARY KEY (`id_tenaga_medis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id_appointment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_appointment`
--
ALTER TABLE `detail_appointment`
  MODIFY `id_detail_appointment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenaga_medis`
--
ALTER TABLE `tenaga_medis`
  MODIFY `id_tenaga_medis` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);

--
-- Constraints for table `detail_appointment`
--
ALTER TABLE `detail_appointment`
  ADD CONSTRAINT `detail_appointment_ibfk_1` FOREIGN KEY (`id_appointment`) REFERENCES `appointment` (`id_appointment`),
  ADD CONSTRAINT `detail_appointment_ibfk_2` FOREIGN KEY (`id_tenaga_medis`) REFERENCES `tenaga_medis` (`id_tenaga_medis`);

--
-- Constraints for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`id_detail_appointment`) REFERENCES `detail_appointment` (`id_detail_appointment`),
  ADD CONSTRAINT `diagnosis_ibfk_2` FOREIGN KEY (`id_tenaga_medis`) REFERENCES `tenaga_medis` (`id_tenaga_medis`),
  ADD CONSTRAINT `diagnosis_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
