INSERT INTO pasien (nama_pasien, tanggal_lahir, jenis_kelamin, alamat_pasien, no_telp_pasien, email_pasien, no_bpjs_pasien) 
VALUES
    ('Putri Sari', '1995-03-12', 'Perempuan', 'Jl. Surya No. 12', '081-221-784-355', 'putri@gmail.com', '119074326'),
    ('Budi Santoso', '2001-11-05', 'Laki-laki', 'Jl. Merdeka No. 40', '083-781-334-112', 'budi@gmail.com', '142356897'),
    ('Dewi Utami', '2001-04-23', 'Perempuan', 'Jl. Diponegoro No. 78', '089-788-234-987', 'dewi@gmail.com', '138902467'),
    ('Ahmad Rizky', '1992-09-17', 'Laki-laki', 'Jl. Pahlawan No. 23', '082-345-987-687', 'ahmad@gmail.com', '167524098'),
    ('Nia Cahaya', '1997-07-08', 'Perempuan', 'Jl. Gatot Subroto No. 57', '081-234-986-435', 'nia@gmail.com', '156843702'),
    ('Aditya Pratama', '2002-02-20', 'Laki-laki', 'Jl. Ahmad Yani No. 89', '087-876-543-219', 'aditya@gmail.com', '126735908'),
    ('Andi Kusuma', '1996-06-18', 'Laki-laki', 'Jl. Sudirman No. 32', '083-237-726-123', 'andi@gmail.com', '178236094'),
    ('Ratna Dewi', '1998-09-07', 'Perempuan', 'Jl. Imam Bonjol No. 65', '085-221-432-847', 'ratna@gmail.com', '194356781'),
    ('Irfan Hakim', '2001-03-25', 'Laki-laki', 'Jl. Jenderal Sudirman No. 13', '081-412-478-271', 'irfan@gmail.com', '189467213'),
    ('Siska Putri', '2000-11-12', 'Perempuan', 'Jl. Hayam Wuruk No. 29', '081-632-547-812', 'siska@gmail.com', '110578432');

INSERT INTO tenaga_medis (nama_tenaga_medis, jabatan, alamat_tenaga_medis, no_telp_tenaga_medis, email_tenaga_medis, departemen_tenaga_medis, spesialis_tenaga_medis)
VALUES
    ('Anisa Fitriani', 'Direktur', 'Jl. Mangga No. 123', '081376529840', 'anisa@gmail.com', 'Bedah', 'Bedah Plastik'),
    ('Dian Purnama', 'Kepala Divisi', 'Jl. Apel No. 456', '082964137508', 'dian@gmail.com', 'Kesehatan Keluarga', 'Dokter Umum'),
    ('Rizki Setiawan', 'Staff Dvisi', 'Jl. Pisang No. 789', '085721983046', 'rizki@gmail.com', 'Neurologi', 'Ahli Saraf'),
    ('Siti Aisyah', 'Staff Divisi', 'Jl. Anggur No. 234', '087503186924', 'siti@gmail.com', 'Neurologi', 'Ahli Saraf'),
    ('Fajar Nugraha', 'Staff Divisi', 'Jl. Jeruk No. 567', '081690325847', 'fajar@gmail.com', 'Kesehatan Keluarga', 'Dokter Umum'),
    ('Citra Dewi', 'Staff Divisi', 'Jl. Durian No. 890', '082415970863', 'citra@gmail.com', 'Kesehatan Keluarga', 'Dokter Umum'),
    ('Bayu Pratama', 'Kepala Divisi', 'Jl. Semangka No. 321', '085836102794', 'bayu@gmail.com', 'Kesehatan Jiwa', 'Psikiater'),
    ('Nita Wulandari', 'Kepala Divisi', 'Jl. Nanas No. 654', '087249571306', 'nita@gmail.com', 'Bedah', 'Bedah Saraf'),
    ('Fahmi Ramadhan', 'Koas', 'Jl. Manggis No. 987', '081728405693', 'fahmi@gmail.com', 'Kesehatan Keluarga', 'Dokter Umum'),
    ('Dini Rahayu', 'Koas', 'Jl. Alpukat No. 210', '082357916084', 'dini@gmail.com', 'Neurologi', 'Ahli Stroke');

INSERT INTO appointment (id_appointment, id_pasien, jenis_appointment, tanggal_mulai_appointment, tanggal_selesai_appointment, jam_mulai_appointment, jam_selesai_appointment)
VALUES
    (1, 1, 'check-up', '2024-04-11', '2024-04-11', '10:00:00', '11:30:00'),
    (2, 2, 'diagnosis', '2024-04-11', '2024-04-11', '12:00:00', '13:00:00'),
    (3, 3, 'konsultasi', '2024-04-13', '2024-04-13', '08:00:00', '08:30:00'),
    (4, 4, 'diagnosis', '2024-04-14', '2024-04-14', '09:00:00', '11:00:00'),
    (5, 3, 'diagnosis', '2024-04-16', '2024-04-16', '12:00:00', '13:00:00'),
    (6, 10, 'therapy', '2024-04-16', '2024-04-16', '13:30:00', '15:00:00'),
    (7, 7, 'konsultasi', '2024-04-20', '2024-04-20', '09:00:00', '09:30:00'),
    (8, 1, 'check-up', '2024-04-21', '2024-04-21', '08:30:00', '09:30:00'),
    (9, 6, 'check-up', '2024-04-25', '2024-04-25', '10:00:00', '11:00:00'),
    (10, 9, 'diagnosis', '2024-04-26', '2024-04-26', '14:00:00', '15:00:00'),
    (11, 3, 'konsultasi', '2024-04-27', '2024-04-27', '08:30:00', '09:00:00'),
    (12, 5, 'diagnosis', '2024-04-28', '2024-04-28', '09:30:00', '11:00:00'),
    (13, 6, 'diagnosis', '2024-04-29', '2024-04-29', '12:00:00', '13:00:00'),
    (14, 4, 'therapy', '2024-04-30', '2024-04-30', '13:30:00', '15:00:00'),
    (15, 7, 'konsultasi', '2024-05-01', '2024-05-01', '09:00:00', '09:30:00'),
    (16, 8, 'check-up', '2024-05-02', '2024-05-02', '08:30:00', '09:30:00');

INSERT INTO detail_appointment (id_appointment, id_tenaga_medis)
VALUES
    (1, 1),
    (2, 2),
    (3, 8),
    (4, 4),
    (5, 7),
    (6, 9),
    (7, 6),
    (8, 3),
    (9, 10),
    (10, 3),
    (11, 7),
    (12, 2),
    (13, 6),
    (14, 8),
    (15, 5),
    (16, 9);

INSERT INTO diagnosis (id_diagnosis, id_detail_appointment, id_tenaga_medis, id_pasien, gejala, penyakit, obat)
VALUES
    (1, 2, 2, 2, 'sakit kepala dan demam tinggi', 'demam', 'Paracetamol'),
    (2, 4, 4, 4, 'kaki nyeri saat berjalan', 'asam urat', 'Alluric'),
    (3, 5, 7, 3, 'sakit kepala dan panik', 'gangguan kecemasan', 'Xanax'),
    (4, 10, 3, 9, 'badan nyeri', 'radang sendi', 'Orinox'),
    (5, 12, 2, 5, 'perut kembung', 'maag', 'Promag'),
    (6, 13, 6, 6, 'sesak napas', 'asma', 'Teofilin');