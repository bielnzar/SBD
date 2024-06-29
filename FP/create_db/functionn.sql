-- FUNGSI UNTUK MENCARI NAMA DRIVER BERDASARKAN ID
DELIMITER //
CREATE FUNCTION GetDriverName(driver_id INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE full_name VARCHAR(255);
    SELECT Nama_Driver INTO full_name FROM driver WHERE ID_Driver = driver_id;
    RETURN full_name;
END;
//
DELIMITER ;

TEST
SELECT GetDriverName(2) AS DriverName;
    
-- FUNGSI UNTUK MENGECEK JUMLAH DRIVER AKTIF
DELIMITER //
CREATE FUNCTION CountActiveDrivers() RETURNS INT
BEGIN
    DECLARE total_active INT;
    SET total_active = (SELECT COUNT(*) FROM driver WHERE Status_Aktif_Driver = 1);
    RETURN total_active;
END //
DELIMITER ;

TEST
SELECT CountActiveDrivers() AS TotalActiveDrivers;