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
-- Database: `modul7`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `appointment`
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

--
-- Dumping data untuk tabel `appointment`
--

INSERT INTO `appointment` (`id_appointment`, `id_pasien`, `jenis_appointment`, `jam_mulai_appointment`, `jam_selesai_appointment`, `tanggal_mulai_appointment`, `tanggal_selesai_appointment`) VALUES
(1, 1, 'check-up', '10:00:00', '10:30:00', '2024-04-11', '2024-04-11'),
(2, 2, 'diagnosis', '12:00:00', '12:30:00', '2024-04-11', '2024-04-11'),
(3, 3, 'konsultasi', '08:00:00', '08:30:00', '2024-04-13', '2024-04-13'),
(4, 4, 'diagnosis', '09:00:00', '09:30:00', '2024-04-14', '2024-04-14'),
(5, 3, 'diagnosis', '12:00:00', '12:30:00', '2024-04-16', '2024-04-16'),
(6, 10, 'therapy', '13:30:00', '14:00:00', '2024-04-16', '2024-04-16'),
(7, 7, 'konsultasi', '09:00:00', '09:30:00', '2024-04-20', '2024-04-20'),
(8, 1, 'check-up', '08:30:00', '09:00:00', '2024-04-21', '2024-04-21'),
(9, 6, 'check-up', '10:00:00', '10:30:00', '2024-04-25', '2024-04-25'),
(10, 9, 'diagnosis', '14:00:00', '14:30:00', '2024-04-26', '2024-04-26'),
(11, 3, 'konsultasi', '08:30:00', '09:00:00', '2024-04-27', '2024-04-27'),
(12, 5, 'diagnosis', '09:30:00', '10:00:00', '2024-04-28', '2024-04-28'),
(13, 6, 'diagnosis', '12:00:00', '12:30:00', '2024-04-29', '2024-04-29'),
(14, 4, 'therapy', '13:30:00', '14:00:00', '2024-04-30', '2024-04-30'),
(15, 7, 'konsultasi', '09:00:00', '09:30:00', '2024-05-01', '2024-05-01'),
(16, 8, 'check-up', '08:30:00', '09:00:00', '2024-05-02', '2024-05-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_appointment`
--

CREATE TABLE `detail_appointment` (
  `id_detail_appointment` int(11) NOT NULL,
  `id_appointment` int(11) DEFAULT NULL,
  `id_tenaga_medis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_appointment`
--

INSERT INTO `detail_appointment` (`id_detail_appointment`, `id_appointment`, `id_tenaga_medis`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 8),
(4, 4, 4),
(5, 5, 7),
(6, 6, 9),
(7, 7, 5),
(8, 8, 3),
(9, 9, 10),
(10, 10, 3),
(11, 11, 7),
(12, 12, 2),
(13, 13, 5),
(14, 14, 8),
(15, 15, 5),
(16, 16, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosis`
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

--
-- Dumping data untuk tabel `diagnosis`
--

INSERT INTO `diagnosis` (`id_diagnosis`, `id_detail_appointment`, `id_tenaga_medis`, `id_pasien`, `gejala`, `penyakit`, `obat`) VALUES
(1, 2, 2, 2, 'sakit kepala dan demam tinggi', 'demam', 'Paracetamol'),
(2, 4, 4, 4, 'kaki nyeri saat berjalan', 'asam urat', 'Alluric'),
(3, 5, 7, 3, 'sakit kepala dan panik', 'gangguan kecemasan', 'Xanax'),
(4, 10, 3, 9, 'badan nyeri', 'radang sendi', 'Orinox'),
(5, 12, 2, 5, 'perut kembung', 'maag', 'Promag'),
(6, 13, 5, 6, 'sesak napas', 'asma', 'Teofilin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
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

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `tanggal_lahir`, `jenis_kelamin`, `alamat_pasien`, `no_telp_pasien`, `email_pasien`, `no_bpjs_pasien`) VALUES
(1, 'Putri Sari', '1995-03-12', 'Perempuan', 'Jl. Surya No. 12', '081-221-784-355', 'putri@gmail.com', 119074326),
(2, 'Budi Santoso', '2001-11-05', 'Laki-laki', 'Jl. Merdeka No. 40', '083-781-334-112', 'budi@gmail.com', 142356897),
(3, 'Dewi Utami', '2001-04-23', 'Perempuan', 'Jl. Diponegoro No. 78', '089-788-234-987', 'dewi@gmail.com', 138902467),
(4, 'Ahmad Rizky', '1992-09-17', 'Laki-laki', 'Jl. Pahlawan No. 23', '082-345-987-687', 'ahmad@gmail.com', 167524098),
(5, 'Nia Cahaya', '1997-07-08', 'Perempuan', 'Jl. Gatot Subroto No. 57', '081-234-986-435', 'nia@gmail.com', 156843702),
(6, 'Aditya Pratama', '2002-02-20', 'Laki-laki', 'Jl. Ahmad Yani No. 89', '087-876-543-219', 'aditya@gmail.com', 126735908),
(7, 'Andi Kusuma', '1996-06-18', 'Laki-laki', 'Jl. Sudirman No. 32', '083-237-726-123', 'andi@gmail.com', 178236094),
(8, 'Ratna Dewi', '1998-09-07', 'Perempuan', 'Jl. Imam Bonjol No. 65', '085-221-432-847', 'ratna@gmail.com', 194356781),
(9, 'Irfan Hakim', '2001-03-25', 'Laki-laki', 'Jl. Jenderal Sudirman No. 13', '081-412-478-271', 'irfan@gmail.com', 189467213),
(10, 'Siska Putri', '2000-11-12', 'Perempuan', 'Jl. Hayam Wuruk No. 29', '081-632-547-812', 'siska@gmail.com', 110578432);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tenaga_medis`
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
-- Dumping data untuk tabel `tenaga_medis`
--

INSERT INTO `tenaga_medis` (`id_tenaga_medis`, `nama_tenaga_medis`, `jabatan`, `alamat_tenaga_medis`, `email_tenaga_medis`, `no_telp_tenaga_medis`, `departemen_tenaga_medis`, `spesialis_tenaga_medis`) VALUES
(1, 'Anisa Fitriani', 'Direktur', 'Jl. Mangga No. 123', 'anisa@gmail.com', '081376529840', 'Bedah', 'Bedah Plastik'),
(2, 'Dian Purnama', 'Kepala Divisi', 'Jl. Apel No. 456', 'dian@gmail.com', '082964137508', 'Kesehatan Keluarga', 'Dokter Umum'),
(3, 'Rizki Setiawan', 'Staff Dvisi', 'Jl. Pisang No. 789', 'rizki@gmail.com', '085721983046', 'Neurologi', 'Ahli Saraf'),
(4, 'Siti Aisyah', 'Staff Divisi', 'Jl. Anggur No. 234', 'siti@gmail.com', '087503186924', 'Neurologi', 'Ahli Saraf'),
(5, 'Fajar Nugraha', 'Staff Divisi', 'Jl. Jeruk No. 567', 'fajar@gmail.com', '081690325847', 'Kesehatan Keluarga', 'Dokter Umum'),
(7, 'Bayu Pratama', 'Kepala Divisi', 'Jl. Semangka No. 321', 'bayu@gmail.com', '085836102794', 'Kesehatan Jiwa', 'Psikiater'),
(8, 'Nita Wulandari', 'Kepala Divisi', 'Jl. Nanas No. 654', 'nita@gmail.com', '087249571306', 'Bedah', 'Bedah Saraf'),
(9, 'Fahmi Ramadhan', 'Koas', 'Jl. Manggis No. 987', 'fahmi@gmail.com', '081728405693', 'Kesehatan Keluarga', 'Dokter Umum'),
(10, 'Dini Rahayu', 'Koas', 'Jl. Alpukat No. 210', 'dini@gmail.com', '082357916084', 'Neurologi', 'Ahli Stroke'),
(11, 'Tom Holland', 'Kepala Divisi', 'Jl. Nowayhome no. 97', 'tomholland@gmail.com', '081235726749', 'Kardiologi', 'Ahli Jantung');

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
  MODIFY `id_detail_appointment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tenaga_medis`
--
ALTER TABLE `tenaga_medis`
  MODIFY `id_tenaga_medis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  ADD CONSTRAINT `detail_appointment_ibfk_1` FOREIGN KEY (`id_appointment`) REFERENCES `appointment` (`id_appointment`),
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
