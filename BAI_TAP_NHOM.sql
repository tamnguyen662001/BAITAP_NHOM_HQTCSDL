-- BÀI TẬP NHÓM _ QUẢN LÍ NHÀ HÀNG 19/10/20221
-- TẠO CSDL
CREATE DATABASE BAITAP_NHOM

USE BAITAP_NHOM

GO
-- TẠO BẢNG KHÁCH HÀNG
CREATE TABLE KHACH_HANG
(
	MKH VARCHAR(5) NOT NULL PRIMARY KEY ,
	TENKH NVARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(20) NOT NULL,
	SDT NVARCHAR (15) NOT NULL,
	TENDN VARCHAR(10) NOT NULL,
	MK VARCHAR(10) NOT NULL
)
GO
-- TẠO BẢNG NHÂN VIÊN
CREATE TABLE NHAN_VIEN
(
	MNV VARCHAR(5) NOT NULL PRIMARY KEY,
	TENNV NVARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(20) NOT NULL,
	GIOITINH VARCHAR(5) NOT NULL,
	NGAYSINH DATE NOT NULL,
	SDT NVARCHAR (15) NOT NULL,
	CHUCVU NVARCHAR(20) NOT NULL,
	TENDN VARCHAR(10) NOT NULL,
	MK VARCHAR(10) NOT NULL
)

GO
 CREATE TABLE LOAICA
 (
	MACA VARCHAR(5) NOT NULL PRIMARY KEY ,
	TENCA NVARCHAR(10) NOT NULL,-- BTH , LỄ (*3), NGÀY NGHĨ(*1.2)
	LUONGTHEOCA DECIMAL(10,2) NOT NULL,
 )

GO
 CREATE TABLE LUONG
 (
	SOLUONGCA SMALLINT PRIMARY KEY NOT NULL,
	MACA VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES LOAICA(MACA),
	MNV VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES NHAN_VIEN(MNV),
)

 GO
-- TẠO BẢNG CHI TIẾT ĐẶT BÀN
CREATE TABLE CHI_TIET_DAT_BAN
(
	MBAN VARCHAR(5) NOT NULL ,
	MNV VARCHAR(5) NOT NULL ,
	MKH VARCHAR(5) NOT NULL ,
	MSP VARCHAR(5) NOT NULL,
	NGAYDAT DATE NOT NULL,
	NGAYDEN DATE NOT NULL,
	TIENCOC FLOAT NOT NULL,
	CONSTRAINT FK_NV FOREIGN KEY (MNV) REFERENCES NHAN_VIEN(MNV),
	CONSTRAINT FK_KH FOREIGN KEY (MKH) REFERENCES KHACH_HANG(MKH),
	CONSTRAINT PK_DB PRIMARY KEY (MBAN, MNV)
)
GO
--TẠO BẢNG HÓA ĐƠN
CREATE TABLE HOA_DON
(
	MHD VARCHAR(5) NOT NULL PRIMARY KEY,
	NGAYTAO DATE NOT NULL,
	TONGTIEN FLOAT NOT NULL,
	MBAN VARCHAR(5) NOT NULL,
	MNV VARCHAR(5) NOT NULL ,
	CONSTRAINT FK_HOADON	FOREIGN KEY (MBAN,MNV) REFERENCES CHI_TIET_DAT_BAN (MBAN,MNV)
)
GO
-- TẠO BẢNG LOẠI SẢN PHẨM
CREATE TABLE LOAI_SAN_PHAM
(	
	MLSP VARCHAR(5) NOT NULL PRIMARY KEY,
	TENLSP NVARCHAR(20) NOT NULL
)

GO
-- TẠO BẢNG SẢN PHẨM
CREATE TABLE SAN_PHAM
(
	MSP VARCHAR (5) NOT NULL PRIMARY KEY,
	TENSP VARCHAR(20) NOT NULL,
	SOLUONG SMALLINT NOT NULL,
	DONGIA INT NOT NULL,
	DVT NVARCHAR(10) NOT NULL,
	MLSP VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES LOAI_SAN_PHAM(MLSP),
)

GO
ALTER TABLE SAN_PHAM
ADD ANHSP VARCHAR(50) NOT NULL;

GO

-- TẠO BẢNG CHI TIẾT HÓA ĐƠN
CREATE TABLE CHI_TIET_HOA_DON
(
	SOLUONG SMALLINT NOT NULL,
	DONGIA INT NOT NULL,
	MHD VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES HOA_DON(MHD),
	MSP VARCHAR (5) NOT NULL FOREIGN KEY REFERENCES SAN_PHAM(MSP),
)

GO
CREATE TABLE NHA_CUNG_CAP
(
	MANCC VARCHAR(10) NOT NULL PRIMARY KEY,
	TENNCC NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(20) NOT NULL,
	SDT NVARCHAR (15) NOT NULL,
)

GO
CREATE TABLE NGUYEN_LIEU
(
	MANL VARCHAR(10) NOT NULL PRIMARY KEY,
	TENNL NVARCHAR(50) NOT NULL,
	NGAYNHAP DATE NOT NULL,
	DONGIA INT NOT NULL,
	DVT NVARCHAR(10) NOT NULL,
)

GO
CREATE TABLE HOA_DON_NHAP
(
	MHD VARCHAR(5) NOT NULL PRIMARY KEY,
	NGAYTAO DATE NOT NULL,
	TONGTIEN FLOAT NOT NULL,
	MNV VARCHAR(5) NOT NULL ,
	MANCC VARCHAR(10) NOT NULL,
	CONSTRAINT FK_HOADONNHAP	FOREIGN KEY (MNV) REFERENCES NHAN_VIEN (MNV),
	CONSTRAINT FK_HOADONNHAP2	FOREIGN KEY (MANCC) REFERENCES NHA_CUNG_CAP(MANCC),
)

CREATE TABLE CHI_TIET_HOA_DON_NHAP
(
	SOLUONG SMALLINT NOT NULL,
	DONGIA INT NOT NULL,
	MHD VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES HOA_DON_NHAP(MHD),
	MANL VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES NGUYEN_LIEU(MANL),
)



--================================
INSERT NHAN_VIEN VALUES('01',N'A',N'123 ADC','NAM','2/2/2001',N'000',N'QUẢN LÍ','1','1')

INSERT LOAICA VALUES ('BT',N'BTH',200)
INSERT LOAICA VALUES ('LE',N'LE',600)
INSERT LOAICA VALUES ('NN',N'NGHI',440)

INSERT LUONG VALUES (15,'BT','01')
INSERT LUONG VALUES (2,'LE','01')
INSERT LUONG VALUES (1,'NN','01')




--  AGGREGATE FUNTION 1.TÍNH LUONG NHÂN  VIÊN
/*SELECT A.MNV,SUM(B.SOLUONGCA*C.LUONGTHEOCA) AS LUONG
FROM NHAN_VIEN A, LUONG B, LOAICA C
WHERE A.MNV = B.MNV AND B.MACA = C.MACA
GROUP BY A.MNV,C.LUONGTHEOCA*/
