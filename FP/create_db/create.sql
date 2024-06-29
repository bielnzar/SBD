CREATE TABLE Driver (
    ID_Driver INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Driver VARCHAR(255),
    Alamat_Driver TEXT,
    Foto_Driver BLOB,
    No_Telepon_Driver VARCHAR(15),
    Status_Aktif_Driver BOOLEAN,
    Email_Driver VARCHAR(255)
);

CREATE TABLE Konsumen (
    ID_Konsumen INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Konsumen VARCHAR(255),
    Alamat_Konsumen VARCHAR(255),
    No_Telepon_Konsumen VARCHAR(15),
    Email_Konsumen VARCHAR(255),
    Tanggal_Lahir_Konsumen DATE
);

CREATE TABLE Layanan (
    ID_Layanan INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Layanan VARCHAR(255),
    Deskripsi_Layanan TEXT
);

CREATE TABLE Kendaraan (
    ID_Kendaraan INT AUTO_INCREMENT PRIMARY KEY,
    ID_Layanan INT,
    Jenis_Kendaraan VARCHAR(50),
    No_Plat_Kendaraan VARCHAR(15),
    Merk_Kendaraan VARCHAR(50),
    FOREIGN KEY (ID_Layanan) REFERENCES Layanan(ID_Layanan)
);

CREATE TABLE Lokasi (
    ID_Lokasi INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Lokasi VARCHAR(255),
    Latitude_Lokasi DECIMAL(10, 8),
    Longitude_Lokasi DECIMAL(11, 8)
);

CREATE TABLE `Order` (
    ID_Order INT AUTO_INCREMENT PRIMARY KEY,
    ID_Driver_Order INT,
    ID_Kendaraan_Order INT,
    ID_Konsumen_Order INT,
    Jarak_Order DECIMAL(5, 2),
    Tarif_Order DECIMAL(10, 2),
    Status_Order ENUM('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED'),
    Waktu_Pesan_Order DATETIME,
    Waktu_Selesai_Order DATETIME,
    ID_Lokasi_Asal_Order INT,
    ID_Lokasi_Tujuan_Order INT,
    FOREIGN KEY (ID_Driver_Order) REFERENCES Driver(ID_Driver),
    FOREIGN KEY (ID_Kendaraan_Order) REFERENCES Kendaraan(ID_Kendaraan),
    FOREIGN KEY (ID_Konsumen_Order) REFERENCES Konsumen(ID_Konsumen),
    FOREIGN KEY (ID_Lokasi_Asal_Order) REFERENCES Lokasi(ID_Lokasi),
    FOREIGN KEY (ID_Lokasi_Tujuan_Order) REFERENCES Lokasi(ID_Lokasi)
);

CREATE TABLE Promosi (
    ID_Promosi INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Promosi VARCHAR(255),
    Deskripsi_Promosi TEXT,
    Potongan_Harga_Promosi DECIMAL(5, 2),
    Tanggal_Mulai_Promosi DATETIME,
    Tanggal_Selesai_Promosi DATETIME
);

CREATE TABLE Pembayaran (
    ID_Pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    ID_Order_Pembayaran INT,
    ID_Promosi_Pembayaran INT,
    Metode_Pembayaran ENUM('CASH', 'CREDIT_CARD', 'EWALLET'),
    Status_Pembayaran ENUM('PENDING', 'PAID', 'CANCELLED'),
    Waktu_Pembayaran DATETIME,
    Jumlah_Pembayaran DECIMAL(10, 2),
    FOREIGN KEY (ID_Order_Pembayaran) REFERENCES `Order`(ID_Order),
    FOREIGN KEY (ID_Promosi_Pembayaran) REFERENCES Promosi(ID_Promosi)
);

CREATE TABLE Penilaian (
    ID_Penilaian INT AUTO_INCREMENT PRIMARY KEY,
    ID_Order_Penilaian INT,
    ID_Driver_Penilaian INT,
    Rating_Penilaian DECIMAL(2, 1) CHECK (Rating_Penilaian BETWEEN 1.0 AND 5.0),
    Ulasan_Penilaian TEXT,
    Tanggal_Penilaian DATETIME,
    FOREIGN KEY (ID_Order_Penilaian) REFERENCES `Order`(ID_Order),
    FOREIGN KEY (ID_Driver_Penilaian) REFERENCES Driver(ID_Driver)
);
