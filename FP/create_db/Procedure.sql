DELIMITER //
CREATE PROCEDURE AddDriver(
    IN p_Nama_Driver VARCHAR(255),
    IN p_Alamat_Driver TEXT,
    IN p_Foto_Driver BLOB,
    IN p_No_Telepon_Driver VARCHAR(15),
    IN p_Status_Aktif_Driver TINYINT,
    IN p_Email_Driver VARCHAR(255)
)
BEGIN
    INSERT INTO driver (Nama_Driver, Alamat_Driver, Foto_Driver, No_Telepon_Driver, Status_Aktif_Driver, Email_Driver)
    VALUES (p_Nama_Driver, p_Alamat_Driver, p_Foto_Driver, p_No_Telepon_Driver, p_Status_Aktif_Driver, p_Email_Driver);
END //
DELIMITER ;
-- test
CALL AddDriver('Fikri Aulia', 'Perumdos ITS Blok U 34', NULL, '089619212996', 1, 'fikrisaad14@gmail.com');

DELIMITER //
CREATE PROCEDURE DeleteDriver(
    IN p_ID_Driver INT
)
BEGIN
    DELETE FROM penilaian 
    WHERE ID_Order_Penilaian IN (SELECT ID_Order FROM `order` WHERE ID_Driver_Order = p_ID_Driver);
    
    DELETE FROM pembayaran 
    WHERE ID_Order_Pembayaran IN (SELECT ID_Order FROM `order` WHERE ID_Driver_Order = p_ID_Driver);

    DELETE FROM `order` WHERE ID_Driver_Order = p_ID_Driver;

    DELETE FROM driver WHERE ID_Driver = p_ID_Driver;
END //
DELIMITER ;
-- test
CALL DeleteDriver(8);

DELIMITER //
CREATE PROCEDURE DeleteKonsumen(
    IN p_ID_Konsumen INT
)
BEGIN
    DELETE FROM konsumen
    WHERE ID_Konsumen = p_ID_Konsumen;
END //
DELIMITER ;
-- test
CALL DeleteKonsumen(3); 

DELIMITER //
CREATE PROCEDURE AddKonsumen(
    IN p_Nama_Konsumen VARCHAR(255),
    IN p_Alamat_Konsumen VARCHAR(255),
    IN p_No_Telepon_Konsumen VARCHAR(15),
    IN p_Email_Konsumen VARCHAR(255),
    IN p_Tanggal_Lahir_Konsumen DATE
)
BEGIN
    INSERT INTO konsumen (Nama_Konsumen, Alamat_Konsumen, No_Telepon_Konsumen, Email_Konsumen, Tanggal_Lahir_Konsumen)
    VALUES (p_Nama_Konsumen, p_Alamat_Konsumen, p_No_Telepon_Konsumen, p_Email_Konsumen, p_Tanggal_Lahir_Konsumen);
END//
DELIMITER ;
-- test
CALL AddKonsumen('Muhammad Sumbul', 'Perumdos ITS Blok U 36', '085774859990', 'sumbul.asik@yahoo.com', '1999-12-12');