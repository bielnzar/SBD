-- Trigger untuk memperbarui status driver ketika order baru diinsert
DELIMITER //
CREATE TRIGGER update_status_driver
AFTER INSERT ON `Order`
FOR EACH ROW
BEGIN
  DECLARE pending_in_progress_count INT;

  SELECT COUNT(*)
  INTO pending_in_progress_count
  FROM `Order`
  WHERE ID_Driver_Order = NEW.ID_Driver_Order
    AND Status_Order IN ('PENDING', 'IN_PROGRESS');

  IF pending_in_progress_count >= 2 THEN
    UPDATE Driver
    SET Status_Aktif_Driver = 0
    WHERE ID_Driver = NEW.ID_Driver_Order;
  END IF;
END;
//
DELIMITER ;

-- Trigger untuk mengupdate total pembayaran saat pembayaran baru diinsert dan menerapkan diskon
DELIMITER //
CREATE TRIGGER update_total_pay
BEFORE INSERT ON Pembayaran
FOR EACH ROW
BEGIN
  DECLARE discount DECIMAL(5,2);
  
  IF NEW.ID_Promosi_Pembayaran IS NOT NULL THEN
    SELECT Potongan_Harga_Promosi
    INTO discount
    FROM Promosi
    WHERE ID_Promosi = NEW.ID_Promosi_Pembayaran;
  ELSE
    SET discount = 0;
  END IF;
  
  SET NEW.Jumlah_Pembayaran = NEW.Jumlah_Pembayaran - (NEW.Jumlah_Pembayaran * discount / 100);
END;
//
DELIMITER ;

-- Trigger untuk mengatur status_order menjadi COMPLETED dan memperbarui waktu_selesai_order ketika pembayaran sudah dibayar
DELIMITER //
CREATE TRIGGER update_status_order
AFTER UPDATE ON Pembayaran
FOR EACH ROW
BEGIN
  IF NEW.Status_Pembayaran = 'PAID' THEN
    UPDATE `Order`
    SET Status_Order = 'COMPLETED',
        Waktu_Selesai_Order = NEW.Waktu_Pembayaran
    WHERE ID_Order = NEW.ID_Order_Pembayaran;
  END IF;
END;
//
DELIMITER ;

-- Trigger untuk memperbarui rating driver ketika penilaian baru diinsert
DELIMITER //
CREATE TRIGGER update_rate_driver
AFTER INSERT ON Penilaian
FOR EACH ROW
BEGIN
  DECLARE avg_rating DECIMAL(2,1);

  SELECT AVG(Rating_Penilaian)
  INTO avg_rating
  FROM Penilaian
  WHERE ID_Driver_Penilaian = NEW.ID_Driver_Penilaian;

  UPDATE Driver
  SET Rating_Driver = avg_rating
  WHERE ID_Driver = NEW.ID_Driver_Penilaian;
END;
//
DELIMITER ;
