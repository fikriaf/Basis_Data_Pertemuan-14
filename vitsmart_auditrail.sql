CREATE TABLE audit_trail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    old_data TEXT,
    new_data TEXT,
    performed_by VARCHAR(255) NOT NULL
);

SELECT * FROM Vitsmart.LogTable;

DELIMITER $$

-- Trigger untuk INSERT
CREATE TRIGGER AuditTrail_AfterInsertPengguna
AFTER INSERT ON Pengguna
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, new_data, performed_by)
    VALUES (
        'INSERT',
        'Pengguna',
        CONCAT('Data Baru: ID = ', NEW.ID_Pengguna, ', Nama = ', NEW.Nama, ', Berat = ', NEW.Berat_Badan),
        USER()
    );
END$$

-- Trigger untuk UPDATE
CREATE TRIGGER AuditTrail_AfterUpdatePengguna
AFTER UPDATE ON Pengguna
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, new_data, performed_by)
    VALUES (
        'UPDATE',
        'Pengguna',
        CONCAT('Sebelum: ID = ', OLD.ID_Pengguna, ', Nama = ', OLD.Nama, ', Berat = ', OLD.Berat_Badan),
        CONCAT('Sesudah: ID = ', NEW.ID_Pengguna, ', Nama = ', NEW.Nama, ', Berat = ', NEW.Berat_Badan),
        USER()
    );
END$$

-- Trigger untuk DELETE
CREATE TRIGGER AuditTrail_AfterDeletePengguna
AFTER DELETE ON Pengguna
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, performed_by)
    VALUES (
        'DELETE',
        'Pengguna',
        CONCAT('Data Dihapus: ID = ', OLD.ID_Pengguna, ', Nama = ', OLD.Nama, ', Berat = ', OLD.Berat_Badan),
        USER()
    );
END$$

-- ------------------------------------------------------------------------------------------------------------

-- Trigger untuk INSERT
CREATE TRIGGER AuditTrail_AfterInsertKebutuhanMakanan
AFTER INSERT ON Kebutuhan_Makanan
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, new_data, performed_by)
    VALUES (
        'INSERT',
        'Kebutuhan_Makanan',
        CONCAT('Data Baru: Kalori = ', NEW.Kalori, ', Jenis = ', NEW.Jenis_Makanan),
        USER()
    );
END$$

-- Trigger untuk UPDATE
CREATE TRIGGER AuditTrail_AfterUpdateKebutuhanMakanan
AFTER UPDATE ON Kebutuhan_Makanan
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, new_data, performed_by)
    VALUES (
        'UPDATE',
        'Kebutuhan_Makanan',
        CONCAT('Sebelum: Kalori = ', OLD.Kalori, ', Jenis = ', OLD.Jenis_Makanan),
        CONCAT('Sesudah: Kalori = ', NEW.Kalori, ', Jenis = ', NEW.Jenis_Makanan),
        USER()
    );
END$$

-- Trigger untuk DELETE
CREATE TRIGGER AuditTrail_AfterDeleteKebutuhanMakanan
AFTER DELETE ON Kebutuhan_Makanan
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, performed_by)
    VALUES (
        'DELETE',
        'Kebutuhan_Makanan',
        CONCAT('Data Dihapus: Kalori = ', OLD.Kalori, ', Jenis = ', OLD.Jenis_Makanan),
        USER()
    );
END$$

-- ------------------------------------------------------------------------------------------------------------

-- Trigger untuk INSERT
CREATE TRIGGER AuditTrail_AfterInsertOlahraga
AFTER INSERT ON Olahraga
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, new_data, performed_by)
    VALUES (
        'INSERT',
        'Olahraga',
        CONCAT('Data Baru: Jenis = ', NEW.Jenis_Olahraga, ', Durasi = ', NEW.Durasi),
        USER()
    );
END$$

-- Trigger untuk UPDATE
CREATE TRIGGER AuditTrail_AfterUpdateOlahraga
AFTER UPDATE ON Olahraga
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, new_data, performed_by)
    VALUES (
        'UPDATE',
        'Olahraga',
        CONCAT('Sebelum: Jenis = ', OLD.Jenis_Olahraga, ', Durasi = ', OLD.Durasi),
        CONCAT('Sesudah: Jenis = ', NEW.Jenis_Olahraga, ', Durasi = ', NEW.Durasi),
        USER()
    );
END$$

-- Trigger untuk DELETE
CREATE TRIGGER AuditTrail_AfterDeleteOlahraga
AFTER DELETE ON Olahraga
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, performed_by)
    VALUES (
        'DELETE',
        'Olahraga',
        CONCAT('Data Dihapus: Jenis = ', OLD.Jenis_Olahraga, ', Durasi = ', OLD.Durasi),
        USER()
    );
END$$

-- ------------------------------------------------------------------------------------------------------------

-- Trigger untuk INSERT
CREATE TRIGGER AuditTrail_AfterInsertKebutuhanTidur
AFTER INSERT ON Kebutuhan_Tidur
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, new_data, performed_by)
    VALUES (
        'INSERT',
        'Kebutuhan_Tidur',
        CONCAT('Data Baru: Durasi = ', NEW.Durasi_Tidur),
        USER()
    );
END$$

-- Trigger untuk UPDATE
CREATE TRIGGER AuditTrail_AfterUpdateKebutuhanTidur
AFTER UPDATE ON Kebutuhan_Tidur
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, new_data, performed_by)
    VALUES (
        'UPDATE',
        'Kebutuhan_Tidur',
        CONCAT('Sebelum: Durasi = ', OLD.Durasi_Tidur),
        CONCAT('Sesudah: Durasi = ', NEW.Durasi_Tidur),
        USER()
    );
END$$

-- Trigger untuk DELETE
CREATE TRIGGER AuditTrail_AfterDeleteKebutuhanTidur
AFTER DELETE ON Kebutuhan_Tidur
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, performed_by)
    VALUES (
        'DELETE',
        'Kebutuhan_Tidur',
        CONCAT('Data Dihapus: Durasi = ', OLD.Durasi_Tidur),
        USER()
    );
END$$

-- ------------------------------------------------------------------------------------------------------------

-- Trigger untuk INSERT
CREATE TRIGGER AuditTrail_AfterInsertKebutuhanAktivitas
AFTER INSERT ON Kebutuhan_Aktivitas
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, new_data, performed_by)
    VALUES (
        'INSERT',
        'Kebutuhan_Aktivitas',
        CONCAT('Data Baru: Jenis = ', NEW.Nama_Aktivitas, ', Durasi = ', NEW.Durasi_Aktivitas),
        USER()
    );
END$$

-- Trigger untuk UPDATE
CREATE TRIGGER AuditTrail_AfterUpdateKebutuhanAktivitas
AFTER UPDATE ON Kebutuhan_Aktivitas
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, new_data, performed_by)
    VALUES (
        'UPDATE',
        'Kebutuhan_Aktivitas',
        CONCAT('Sebelum: Jenis = ', OLD.Nama_Aktivitas, ', Durasi = ', OLD.Durasi_Aktivitas),
        CONCAT('Sesudah: Jenis = ', NEW.Nama_Aktivitas, ', Durasi = ', NEW.Durasi_Aktivitas),
        USER()
    );
END$$

-- Trigger untuk DELETE
CREATE TRIGGER AuditTrail_AfterDeleteKebutuhanAktivitas
AFTER DELETE ON Kebutuhan_Aktivitas
FOR EACH ROW
BEGIN
    INSERT INTO audit_trail (action_type, table_name, old_data, performed_by)
    VALUES (
        'DELETE',
        'Kebutuhan_Aktivitas',
        CONCAT('Data Dihapus: Jenis = ', OLD.Nama_Aktivitas, ', Durasi = ', OLD.Durasi_Aktivitas),
        USER()
    );
END$$

DELIMITER ;
