-- melihat rincian order
CREATE VIEW view_order_details AS
SELECT 
    o.ID_Order,
    o.ID_Driver_Order,
    d.Nama_Driver,
    o.ID_Kendaraan_Order,
    k.Jenis_Kendaraan,
    k.No_Plat_Kendaraan,
    o.ID_Konsumen_Order,
    c.Nama_Konsumen,
    o.Jarak_Order,
    o.Tarif_Order,
    o.Status_Order,
    o.Waktu_Pesan_Order,
    o.Waktu_Selesai_Order,
    o.ID_Lokasi_Asal_Order,
    la.Nama_Lokasi AS Lokasi_Asal,
    o.ID_Lokasi_Tujuan_Order,
    lt.Nama_Lokasi AS Lokasi_Tujuan
FROM 
    `Order` o
JOIN 
    Driver d ON o.ID_Driver_Order = d.ID_Driver
JOIN 
    Kendaraan k ON o.ID_Kendaraan_Order = k.ID_Kendaraan
JOIN 
    Konsumen c ON o.ID_Konsumen_Order = c.ID_Konsumen
JOIN 
    Lokasi la ON o.ID_Lokasi_Asal_Order = la.ID_Lokasi
JOIN 
    Lokasi lt ON o.ID_Lokasi_Tujuan_Order = lt.ID_Lokasi;

-- melihat rincian pembayaran +promosi
CREATE VIEW view_payment_details AS
SELECT 
    o.ID_Order,
    o.Jarak_Order,
    o.Tarif_Order,
    IFNULL(pr.Potongan_Harga_Promosi, 0) AS Potongan_Harga_Promosi,
    ROUND(IFNULL((o.Tarif_Order - (o.Tarif_Order * (pr.Potongan_Harga_Promosi / 100))), 0), 2) AS Total_Tagihan_Setelah_Promosi,
    p.Metode_Pembayaran,
    p.Status_Pembayaran,
    p.Waktu_Pembayaran
FROM 
    `Order` o
LEFT JOIN 
    Pembayaran p ON o.ID_Order = p.ID_Order_Pembayaran
LEFT JOIN 
    Promosi pr ON p.ID_Promosi_Pembayaran = pr.ID_Promosi;

-- view rating keseluruhan
CREATE VIEW view_ratings AS
SELECT 
    pen.ID_Penilaian,
    pen.ID_Order_Penilaian,
    pen.ID_Driver_Penilaian,
    d.Nama_Driver,
    pen.Rating_Penilaian,
    pen.Ulasan_Penilaian,
    pen.Tanggal_Penilaian,
    o.ID_Konsumen_Order,
    c.Nama_Konsumen
FROM 
    Penilaian pen
JOIN 
    `Order` o ON pen.ID_Order_Penilaian = o.ID_Order
JOIN 
    Driver d ON pen.ID_Driver_Penilaian = d.ID_Driver
JOIN 
    Konsumen c ON o.ID_Konsumen_Order = c.ID_Konsumen;

-- view rating driver
CREATE VIEW view_driver_ratings AS
SELECT 
    d.ID_Driver,
    d.Nama_Driver,
    COUNT(p.ID_Penilaian) AS Jumlah_Penilaian,
    ROUND(AVG(p.Rating_Penilaian), 2) AS Rata_Rata_Rating
FROM 
    Driver d
LEFT JOIN 
    Penilaian p ON d.ID_Driver = p.ID_Driver_Penilaian
GROUP BY 
    d.ID_Driver, d.Nama_Driver;

-- view status order
CREATE VIEW view_status_orders AS
SELECT 
    o.ID_Order,
    o.ID_Driver_Order,
    d.Nama_Driver,
    o.ID_Kendaraan_Order,
    k.Jenis_Kendaraan,
    o.ID_Konsumen_Order,
    c.Nama_Konsumen,
    o.Jarak_Order,
    o.Tarif_Order,
    o.Status_Order,
    o.Waktu_Pesan_Order,
    o.ID_Lokasi_Asal_Order,
    la.Nama_Lokasi AS Lokasi_Asal,
    o.ID_Lokasi_Tujuan_Order,
    lt.Nama_Lokasi AS Lokasi_Tujuan
FROM 
    `Order` o
JOIN 
    Driver d ON o.ID_Driver_Order = d.ID_Driver
JOIN 
    Kendaraan k ON o.ID_Kendaraan_Order = k.ID_Kendaraan
JOIN 
    Konsumen c ON o.ID_Konsumen_Order = c.ID_Konsumen
JOIN 
    Lokasi la ON o.ID_Lokasi_Asal_Order = la.ID_Lokasi
JOIN 
    Lokasi lt ON o.ID_Lokasi_Tujuan_Order = lt.ID_Lokasi
WHERE 
    o.Status_Order IN ('PENDING', 'IN_PROGRESS');

CREATE VIEW view_active_drivers AS
SELECT 
    d.ID_Driver,
    d.Nama_Driver,
    d.Alamat_Driver,
    d.No_Telepon_Driver,
    d.Email_Driver
FROM 
    Driver d
WHERE 
    d.Status_Aktif_Driver = TRUE;

CREATE VIEW view_active_promotions AS
SELECT 
    pr.ID_Promosi,
    pr.Nama_Promosi,
    pr.Deskripsi_Promosi,
    pr.Potongan_Harga_Promosi,
    pr.Tanggal_Mulai_Promosi,
    pr.Tanggal_Selesai_Promosi
FROM 
    Promosi pr
WHERE 
    NOW() BETWEEN pr.Tanggal_Mulai_Promosi AND pr.Tanggal_Selesai_Promosi;
