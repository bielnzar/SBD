CREATE TABLE Driver (
    ID_Driver INT PRIMARY KEY,
    Nama VARCHAR(255),
    Alamat TEXT,
    Foto VARCHAR(255),
    No_Telepon VARCHAR(20),
    Status_Aktif VARCHAR(20),
    Rating DECIMAL(3, 2),
    Email VARCHAR(255)
);

CREATE TABLE Konsumen (
    ID_Konsumen INT PRIMARY KEY,
    Nama VARCHAR(255),
    Alamat TEXT,
    No_Telepon VARCHAR(20),
    Email VARCHAR(255),
    Tanggal_Lahir DATE
);

CREATE TABLE Layanan (
    ID_Layanan INT PRIMARY KEY,
    Nama_Layanan VARCHAR(255),
    Deskripsi TEXT
);

CREATE TABLE Kendaraan (
    ID_Kendaraan INT PRIMARY KEY,
    Jenis_Kendaraan VARCHAR(255),
    ID_Layanan INT,
    No_Plat VARCHAR(50),
    Merk VARCHAR(255),
    FOREIGN KEY (ID_Layanan) REFERENCES Layanan(ID_Layanan)
);

CREATE TABLE Promosi (
    ID_Promosi INT PRIMARY KEY,
    Nama_Promosi VARCHAR(255),
    Deskripsi TEXT,
    Potongan_Harga DECIMAL(10, 2),
    Tanggal_Mulai DATETIME,
    Tanggal_Selesai DATETIME
);

CREATE TABLE `Order` (
    ID_Order INT PRIMARY KEY,
    ID_Driver INT,
    ID_Kendaraan INT,
    ID_Konsumen INT,
    Jarak FLOAT,
    Asal VARCHAR(255),
    Tujuan VARCHAR(255),
    Tarif FLOAT,
    Status_Order ENUM('Pending', 'Completed', 'Cancelled'),
    Waktu_Pesan DATETIME,
    Waktu_Selesai DATETIME,
    Alamat VARCHAR(255),
    No_Telpon VARCHAR(20),
    FOREIGN KEY (ID_Driver) REFERENCES Driver(ID_Driver),
    FOREIGN KEY (ID_Kendaraan) REFERENCES Kendaraan(ID_Kendaraan),
    FOREIGN KEY (ID_Konsumen) REFERENCES Konsumen(ID_Konsumen)
);

CREATE TABLE Pembayaran (
    ID_Pembayaran INT PRIMARY KEY,
    ID_Order INT,
    Metode_Pembayaran VARCHAR(50),
    Status_Pembayaran ENUM('Pending', 'Completed', 'Failed'),
    Waktu_Pembayaran DATETIME,
    Jumlah FLOAT,
    ID_Promosi INT,
    FOREIGN KEY (ID_Order) REFERENCES `Order`(ID_Order),
    FOREIGN KEY (ID_Promosi) REFERENCES Promosi(ID_Promosi)
);
