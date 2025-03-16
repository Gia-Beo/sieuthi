CREATE DATABASE  sieuthi1;
USE sieuthi;
-- Tạo bảng san_pham
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'san_pham')
BEGIN
    CREATE TABLE san_pham (
        id INT IDENTITY(1,1) PRIMARY KEY,        
        ten_san_pham VARCHAR(255) NOT NULL,       
        mo_ta TEXT,                               
        gia DECIMAL(10, 2) NOT NULL,              
        so_luong_kho INT NOT NULL,                
        ngay_tao DATETIME DEFAULT GETDATE()
    );
END

-- Tạo bảng nguoi_dung
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'nguoi_dung')
BEGIN
    CREATE TABLE nguoi_dung (
        id INT IDENTITY(1,1) PRIMARY KEY,        
        ten_dang_nhap VARCHAR(255) NOT NULL UNIQUE, 
        mat_khau VARCHAR(255) NOT NULL,           
        email VARCHAR(255) NOT NULL,              
        ngay_dang_ky DATETIME DEFAULT GETDATE() 
    );
END

-- Tạo bảng don_hang
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'don_hang')
BEGIN
    CREATE TABLE don_hang (
        id INT IDENTITY(1,1) PRIMARY KEY,        
        id_nguoi_dung INT NOT NULL,               
        tong_tien DECIMAL(10, 2) NOT NULL,        
        trang_thai VARCHAR(50) NOT NULL,          
        ngay_tao DATETIME DEFAULT GETDATE(),     
        FOREIGN KEY (id_nguoi_dung) REFERENCES nguoi_dung(id)
    );
END

-- Tạo bảng chi_tiet_don_hang
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'chi_tiet_don_hang')
BEGIN
    CREATE TABLE chi_tiet_don_hang (
        id INT IDENTITY(1,1) PRIMARY KEY,        
        id_don_hang INT NOT NULL,                 
        id_san_pham INT NOT NULL,                 
        so_luong INT NOT NULL,                    
        gia DECIMAL(10, 2) NOT NULL,              
        FOREIGN KEY (id_don_hang) REFERENCES don_hang(id),
        FOREIGN KEY (id_san_pham) REFERENCES san_pham(id)
    );
END

-- Tạo bảng gio_hang
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'gio_hang')
BEGIN
    CREATE TABLE gio_hang (
        id INT IDENTITY(1,1) PRIMARY KEY,        
        id_nguoi_dung INT NOT NULL,               
        id_san_pham INT NOT NULL,                 
        so_luong INT NOT NULL,                    
        ngay_tao DATETIME DEFAULT GETDATE(),     
        FOREIGN KEY (id_nguoi_dung) REFERENCES nguoi_dung(id),
        FOREIGN KEY (id_san_pham) REFERENCES san_pham(id)
    );
END

-- Tạo bảng thanh_toan
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'thanh_toan')
BEGIN
    CREATE TABLE thanh_toan (
        id INT IDENTITY(1,1) PRIMARY KEY,        
        id_don_hang INT NOT NULL,                 
        phuong_thuc_thanh_toan VARCHAR(50) NOT NULL, 
        trang_thai_thanh_toan VARCHAR(50) NOT NULL, 
        ngay_thanh_toan DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (id_don_hang) REFERENCES don_hang(id)
    );
END

-- Tạo bảng danh_gia_san_pham
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'danh_gia_san_pham')
BEGIN
    CREATE TABLE danh_gia_san_pham (
        id INT IDENTITY(1,1) PRIMARY KEY,        
        id_san_pham INT NOT NULL,                 
        id_nguoi_dung INT NOT NULL,               
        diem_danh_gia INT NOT NULL,               
        binh_luan TEXT,                           
        ngay_danh_gia DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (id_san_pham) REFERENCES san_pham(id),
        FOREIGN KEY (id_nguoi_dung) REFERENCES nguoi_dung(id)
    );
END
