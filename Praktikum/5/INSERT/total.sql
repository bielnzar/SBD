2.update interval Waktu:
UPDATE appointment
SET jam_selesai_appointment = ADDTIME(jam_mulai_appointment, '00:30:00');

3.ganti yang citra dewi ke temen:
UPDATE detail_appointment
SET id_tenaga_medis = 5
WHERE id_tenaga_medis = 6;

UPDATE diagnosis
SET id_tenaga_medis = 5
WHERE id_tenaga_medis = 6;

DELETE FROM tenaga_medis
WHERE nama_tenaga_medis = 'Citra Dewi';

4.tambah staff baru:
INSERT INTO tenaga_medis (nama_tenaga_medis, jabatan, alamat_tenaga_medis, no_telp_tenaga_medis, email_tenaga_medis, departemen_tenaga_medis, spesialis_tenaga_medis)
VALUES ('Tom Holland', 'Kepala Divisi', 'Jl. Nowayhome No. 97', '081235726749', 'tomholland@gmail.com', 'Kardiologi', 'Ahli Jantung');

5.liatin pasien lahiran 2001:
SELECT * FROM pasien
WHERE YEAR(tanggal_lahir) = 2001;

6.liatin appointment pd 16 April 2024:
SELECT * FROM appointment
WHERE tanggal_mulai_appointment = '2024-04-16';

7.liatin yang neurologi:
SELECT * FROM tenaga_medis
WHERE departemen_tenaga_medis = 'Neurologi';

8.liatin appointment ditangani tenaga medis id 2:
SELECT * FROM appointment
WHERE id_appointment IN (SELECT id_appointment FROM detail_appointment WHERE id_tenaga_medis = 2);