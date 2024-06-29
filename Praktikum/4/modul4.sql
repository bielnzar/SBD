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
-- Database: `modul4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `appointment`
--

CREATE TABLE `appointment` (
  `id_appointment` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `jenis_appointment` varchar(50) DEFAULT NULL,
  `tanggal_mulai_appointment` date DEFAULT current_timestamp(),
  `tanggal_selesai_appointment` date DEFAULT current_timestamp(),
  `jam_mulai_appointment` time DEFAULT NULL,
  `jam_selesai_appointment` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `appointment`
--

INSERT INTO `appointment` (`id_appointment`, `id_pasien`, `jenis_appointment`, `tanggal_mulai_appointment`, `tanggal_selesai_appointment`, `jam_mulai_appointment`, `jam_selesai_appointment`) VALUES
(1, 1, 'check-up', '0000-00-00', '0000-00-00', '10:00:00', '11:30:00'),
(2, 2, 'diagnosis', '0000-00-00', '0000-00-00', '12:00:00', '13:00:00'),
(3, 3, 'konsultasi', '0000-00-00', '0000-00-00', '08:00:00', '08:30:00'),
(4, 4, 'diagnosis', '0000-00-00', '0000-00-00', '09:00:00', '11:00:00'),
(5, 3, 'diagnosis', '0000-00-00', '0000-00-00', '12:00:00', '13:00:00'),
(6, 10, 'therapy', '0000-00-00', '0000-00-00', '13:30:00', '15:00:00'),
(7, 7, 'konsultasi', '0000-00-00', '0000-00-00', '09:00:00', '09:30:00'),
(8, 1, 'check-up', '0000-00-00', '0000-00-00', '08:30:00', '09:30:00'),
(9, 6, 'check-up', '0000-00-00', '0000-00-00', '10:00:00', '11:00:00'),
(10, 9, 'diagnosis', '0000-00-00', '0000-00-00', '14:00:00', '15:00:00'),
(11, 3, 'konsultasi', '0000-00-00', '0000-00-00', '08:30:00', '09:00:00'),
(12, 5, 'diagnosis', '0000-00-00', '0000-00-00', '09:30:00', '11:00:00'),
(13, 6, 'diagnosis', '0000-00-00', '0000-00-00', '12:00:00', '13:00:00'),
(14, 4, 'therapy', '0000-00-00', '0000-00-00', '13:30:00', '15:00:00'),
(15, 7, 'konsultasi', '0000-00-00', '0000-00-00', '09:00:00', '09:30:00'),
(16, 8, 'check-up', '0000-00-00', '0000-00-00', '08:30:00', '09:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_appointment`
--

CREATE TABLE `detail_appointment` (
  `id_detail_appointment` int(11) NOT NULL,
  `id_appointment` int(11) DEFAULT NULL,
  `id_tenaga_medis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id_diagnosis` int(11) NOT NULL,
  `id_detail_appointment` int(11) DEFAULT NULL,
  `id_tenaga_medis` int(11) DEFAULT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `gejala` varchar(50) DEFAULT NULL,
  `penyakit` varchar(50) DEFAULT NULL,
  `obat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(80) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') DEFAULT NULL,
  `alamat_pasien` varchar(50) DEFAULT NULL,
  `no_telp_pasien` int(11) DEFAULT NULL,
  `email_pasien` varchar(30) DEFAULT NULL,
  `no_BPJS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `tanggal_lahir`, `jenis_kelamin`, `alamat_pasien`, `no_telp_pasien`, `email_pasien`, `no_BPJS`) VALUES
(1, 'Putri Sari', '1995-03-12', 'perempuan', 'Jl. Surya No. 12', 81, 'putri@gmail.com', 119074326),
(2, 'Budi Santoso', '2001-11-05', 'laki-laki', 'Jl. Merdeka No. 40', 83, 'budi@gmail.com', 142356897),
(3, 'Dewi Utami', '2001-04-23', 'perempuan', 'Jl. Diponegoro No. 78', 89, 'dewi@gmail.com', 138902467),
(4, 'Ahmad Rizky', '1992-09-17', 'laki-laki', 'Jl. Pahlawan No. 23', 82, 'ahmad@gmail.com', 167524098),
(5, 'Nia Cahaya', '1997-07-08', 'perempuan', 'Jl. Gatot Subroto No. 57', 81, 'nia@gmail.com', 156843702),
(6, 'Aditya Pratama', '2002-02-20', 'laki-laki', 'Jl. Ahmad Yani No. 89', 87, 'aditya@gmail.com', 126735908),
(7, 'Andi Kusuma', '1996-06-18', 'laki-laki', 'Jl. Sudirman No. 32', 83, 'andi@gmail.com', 178236094),
(8, 'Ratna Dewi', '1998-09-07', 'perempuan', 'Jl. Imam Bonjol No. 65', 85, 'ratna@gmail.com', 194356781),
(9, 'Irfan Hakim', '2001-03-25', 'laki-laki', 'Jl. Jenderal Sudirman No. 13', 81, 'irfan@gmail.com', 189467213),
(10, 'Siska Putri', '2000-11-12', 'perempuan', 'Jl. Hayam Wuruk No. 29', 81, 'siska@gmail.com', 110578432);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tenaga_medis`
--

CREATE TABLE `tenaga_medis` (
  `id_tenaga_medis` int(11) NOT NULL,
  `nama_tenaga_medis` varchar(80) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamat_tenaga_medis` varchar(50) DEFAULT NULL,
  `no_telp_tenaga_medis` int(11) DEFAULT NULL,
  `email_tenaga_medis` varchar(30) DEFAULT NULL,
  `departemen_tenaga_medis` varchar(30) DEFAULT NULL,
  `spesialis_tenaga_medis` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id_appointment`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indeks untuk tabel `detail_appointment`
--
ALTER TABLE `detail_appointment`
  ADD PRIMARY KEY (`id_detail_appointment`),
  ADD KEY `id_appointment` (`id_appointment`),
  ADD KEY `id_tenaga_medis` (`id_tenaga_medis`);

--
-- Indeks untuk tabel `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id_diagnosis`),
  ADD KEY `id_detail_appointment` (`id_detail_appointment`),
  ADD KEY `id_tenaga_medis` (`id_tenaga_medis`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `tenaga_medis`
--
ALTER TABLE `tenaga_medis`
  ADD PRIMARY KEY (`id_tenaga_medis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id_appointment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `detail_appointment`
--
ALTER TABLE `detail_appointment`
  MODIFY `id_detail_appointment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id_diagnosis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tenaga_medis`
--
ALTER TABLE `tenaga_medis`
  MODIFY `id_tenaga_medis` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);

--
-- Ketidakleluasaan untuk tabel `detail_appointment`
--
ALTER TABLE `detail_appointment`
  ADD CONSTRAINT `detail_appointment_ibfk_1` FOREIGN KEY (`id_appointment`) REFERENCES `appointment` (`id_pasien`),
  ADD CONSTRAINT `detail_appointment_ibfk_2` FOREIGN KEY (`id_tenaga_medis`) REFERENCES `tenaga_medis` (`id_tenaga_medis`);

--
-- Ketidakleluasaan untuk tabel `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`id_detail_appointment`) REFERENCES `detail_appointment` (`id_detail_appointment`),
  ADD CONSTRAINT `diagnosis_ibfk_2` FOREIGN KEY (`id_tenaga_medis`) REFERENCES `tenaga_medis` (`id_tenaga_medis`),
  ADD CONSTRAINT `diagnosis_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
