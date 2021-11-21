﻿CREATE DATABASE TEST_BTN_1811

USE TEST_BTN_1811

CREATE TABLE KHACH_HANG
(
	MKH VARCHAR(5) NOT NULL PRIMARY KEY ,
	TENKH NVARCHAR(50) NOT NULL,
	GIOITINH NVARCHAR(5) NOT NULL,
	DIACHI NVARCHAR(20) NOT NULL,
	SDT VARCHAR (15) NOT NULL,
	TENDN VARCHAR(10) NOT NULL,
	MK VARCHAR(10) NOT NULL
)

CREATE TABLE NHAN_VIEN
(
	MNV VARCHAR(5) NOT NULL PRIMARY KEY,
	TENNV NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(20) NOT NULL,
	GIOITINH NVARCHAR(5) NOT NULL,
	NGAYSINH DATE NOT NULL,
	SDT VARCHAR (15) NOT NULL,
	CHUCVU NVARCHAR(20) NOT NULL,
	TENDN VARCHAR(10) NOT NULL,
	MK VARCHAR(10) NOT NULL
)

CREATE TABLE CHAM_CONG
(
	MNV VARCHAR(5) NOT NULL,
	NGAY DATE NOT NULL,
	CA SMALLINT NOT NULL,
	MACA VARCHAR(2)NOT NULL,
	MALOAICA VARCHAR(2),
	CONSTRAINT PK_DB PRIMARY KEY (NGAY, MNV, CA)
	
)
CREATE TABLE CA_LAM_VIEC
(
	MACA VARCHAR(2) PRIMARY KEY,
	TENCA NVARCHAR(10) NOT NULL,
	GIATIEN DECIMAL(10) NOT NULL,
	THOIGIAN SMALLINT NOT NULL

)
CREATE TABLE LOAI_CA
(
	MALOAICA VARCHAR(2) PRIMARY KEY,
	TENLOAICA NVARCHAR(10) NOT NULL,
	MUCTHUONG DECIMAL(3,2) NOT NULL,
)
CREATE TABLE NGUYEN_LIEU
(
	MANL VARCHAR(10) NOT NULL PRIMARY KEY,
	TENNL NVARCHAR(50) NOT NULL,
	NGAYNHAP DATE NOT NULL,
	DONGIA FLOAT NOT NULL,
	DVT NVARCHAR(15) NOT NULL,
)

CREATE TABLE NHA_CUNG_CAP
(
	MANCC VARCHAR(10) NOT NULL PRIMARY KEY,
	TENNCC NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(20) NOT NULL,
	SDT VARCHAR (15) NOT NULL,
)
CREATE TABLE HOA_DON_NHAP
(
	MHD VARCHAR(5) NOT NULL PRIMARY KEY,
	NGAYTAO DATE NOT NULL,
	MNV VARCHAR(5) NOT NULL ,
	MANCC VARCHAR(10) NOT NULL,
	
)

CREATE TABLE CHI_TIET_HOA_DON_NHAP
(
	SOLUONG SMALLINT NOT NULL,
	MHD VARCHAR(5) NOT NULL ,
	MANL VARCHAR(10) NOT NULL 
	CONSTRAINT PK_CTHDNHAP PRIMARY KEY (MHD, MANL)
)


CREATE TABLE HOA_DON
(
	MHD VARCHAR(5) NOT NULL PRIMARY KEY,
	BAN VARCHAR(5) NOT NULL ,
	MKH VARCHAR(5) NOT NULL ,
	NGAYTAO DATETIME NOT NULL,
	MNV VARCHAR(5) NOT NULL 
)

CREATE TABLE CHI_TIET_SAN_PHAM
(
	TENSP NVARCHAR(50) NOT NULL PRIMARY KEY,
	MANL VARCHAR(10) NOT NULL,
	SOLUONG SMALLINT NOT NULL
)
CREATE TABLE LOAI_SAN_PHAM
(	
	MLSP VARCHAR(5) NOT NULL PRIMARY KEY,
	TENLSP NVARCHAR(20) NOT NULL
)

CREATE TABLE SAN_PHAM
(
	MSP VARCHAR (5) NOT NULL PRIMARY KEY,
	TENSP NVARCHAR(50) NOT NULL,
	SOLUONG SMALLINT NOT NULL,
	DONGIA FLOAT NOT NULL,
	DVT NVARCHAR(15) NOT NULL,
	MLSP VARCHAR(5) NOT NULL ,
	ANHSP VARCHAR(100) NOT NULL,

)

CREATE TABLE CHI_TIET_HOA_DON
(
	SOLUONG TINYINT NOT NULL,
	MHD VARCHAR(5) NOT NULL,
	MSP VARCHAR (5) NOT NULL ,
	CONSTRAINT PK_CTHD PRIMARY KEY (MHD, MSP)

)

ALTER TABLE HOA_DON_NHAP ADD CONSTRAINT FK_HOA_DON_NHAP_NHAN_VIEN FOREIGN KEY (MNV) REFERENCES NHAN_VIEN (MNV)
ALTER TABLE HOA_DON_NHAP ADD CONSTRAINT FK_HOA_DON_NHAP_NHA_CUNG_CAP FOREIGN KEY (MANCC) REFERENCES NHA_CUNG_CAP(MANCC)
ALTER TABLE CHI_TIET_HOA_DON_NHAP ADD CONSTRAINT FK_CHI_TIET_HOA_DON_NHAP_HOA_DON_NHAP FOREIGN KEY (MHD) REFERENCES HOA_DON_NHAP(MHD)
ALTER TABLE CHI_TIET_HOA_DON_NHAP ADD CONSTRAINT FK_CHI_TIET_HOA_NGUYEN_LIEU FOREIGN KEY (MANL) REFERENCES  NGUYEN_LIEU(MANL)
ALTER TABLE HOA_DON ADD CONSTRAINT FK_HOA_DON_KHACH_HANG FOREIGN KEY (MKH) REFERENCES KHACH_HANG (MKH)
ALTER TABLE HOA_DON ADD CONSTRAINT FK_HOA_DON_NHAN_VIEN FOREIGN KEY (MNV) REFERENCES NHAN_VIEN (MNV)
ALTER TABLE CHI_TIET_SAN_PHAM ADD CONSTRAINT FK_CHI_TIET_SAN_PHAM_NGUYEN_LIEU FOREIGN KEY (MANL) REFERENCES NGUYEN_LIEU (MANL)
ALTER TABLE SAN_PHAM ADD CONSTRAINT FK_SAN_PHAM_LOAI_SAN_PHAM FOREIGN KEY (MLSP) REFERENCES LOAI_SAN_PHAM(MLSP)
ALTER TABLE SAN_PHAM ADD CONSTRAINT FK_SAN_PHAM_CHI_TIET_SAN_PHAM FOREIGN KEY (TENSP) REFERENCES CHI_TIET_SAN_PHAM (TENSP)
ALTER TABLE CHI_TIET_HOA_DON ADD CONSTRAINT FK_CHI_TIET_HOA_DON_HOA_DON FOREIGN KEY (MHD) REFERENCES HOA_DON(MHD)
ALTER TABLE CHI_TIET_HOA_DON ADD CONSTRAINT FK_CHI_TIET_HOA_DON_SAN_PHAM FOREIGN KEY (MSP) REFERENCES SAN_PHAM(MSP)
ALTER TABLE CHAM_CONG ADD CONSTRAINT FK_CHAM_CONG	FOREIGN KEY (MNV) REFERENCES NHAN_VIEN (MNV)
ALTER TABLE CHAM_CONG ADD CONSTRAINT FK_CHAM_CONG_CA_LAMVIEC	FOREIGN KEY (MACA) REFERENCES CA_LAM_VIEC (MACA)
ALTER TABLE CHAM_CONG ADD CONSTRAINT FK_CHAM_CONG_LOAICA	FOREIGN KEY (MALOAICA) REFERENCES LOAI_CA (MALOAICA)



--===================================================================================
-- NHẬP DỮ LIỆU BẢNG NHÂN VIÊN
INSERT NHAN_VIEN VALUES('01',N'Trần Văn Hòa',N'123 Hòn Chồng','Nam','1/2/1995','0123456',N'Quản lý','quanli','quanli')
INSERT NHAN_VIEN VALUES('02',N'Lê Văn Đức',N'12 Phan Trọng Tuệ ','Nam','2/4/2001','0139283',N'Phục vụ','ducle','ducle24')
INSERT NHAN_VIEN VALUES('03',N'Bùi Ngọc Hoa',N'11 Củ Chi ',N'Nữ','12/4/2000','0139999',N'Lễ tân','hoabui','hoabui12')
INSERT NHAN_VIEN VALUES('04',N'Lê Văn Sang',N'05 Phan Trọng Tuệ ','Nam','3/6/2000','0233283',N'Phục vụ','sangle','sangle36')
INSERT NHAN_VIEN VALUES('05',N'Nguyễn Khánh An',N'33 Bắc Sơn',N'Nữ','8/4/2002','0133554',N'Thu ngân','annguyen','annguyen84')
INSERT NHAN_VIEN VALUES('06',N'Nguyễn Đạt',N'37 Bắc Sơn',N'Nam','7/7/2000','77676',N'Phục vụ','datnguyen','datnguyen6')

-- NHẬP DỮ LIỆU BẢNG KHÁCH HÀNG
INSERT KHACH_HANG VALUES ('KH1',N'Đinh Gia Khánh',N'Nam',N'13/23 Bắc Sơn','0331234','khanhdinh','khanh123')
INSERT KHACH_HANG VALUES ('KH2',N'Nguyễn Trân Anh',N'Nữ',N'233 Điện Biên Phủ','0331122','trananh ','trananh22 ')
INSERT KHACH_HANG VALUES ('KH3',N'Nguyễn Khánh Duy',N'Nam',N'25 Nguyễn Đình Chiểu','0333342','khanhduy','duy3342')
INSERT KHACH_HANG VALUES ('KH4',N'Phan Thị Huyền Trâm',N'Nữ',N'80/23 Bắc Sơn','0338877','tramphan','tramphan77')
INSERT KHACH_HANG VALUES ('KH5',N'Đinh Văn Bảo',N'Nam',N'02 Nguyễn Đình Chiểu','0334343','baodinh','bao4343')
--======================================================
-- NHẤP DỮU LIỆU CÁC BẢNG CHÁM CÔNG
INSERT CA_LAM_VIEC VALUES('K1',N'Sáng',10000,6)
INSERT CA_LAM_VIEC VALUES('K2',N'Trưa',11000,6)
INSERT CA_LAM_VIEC VALUES('K3',N'Tối',12000,5)

INSERT LOAI_CA VALUES('NL',N'Ngày lễ',1.5)
INSERT LOAI_CA VALUES('NN',N'Ngày nghỉ',1.2)
INSERT LOAI_CA VALUES('NT',N'Thường',1.0)

INSERT CHAM_CONG VALUES('02','1-1-2021',2,'K2','NL')
INSERT CHAM_CONG VALUES('02','1-1-2021',3,'K3','NN')
INSERT CHAM_CONG VALUES('02','1-1-2021',1,'K1','NN')
INSERT CHAM_CONG VALUES('02','5-5-2021',3,'K3','NL')
INSERT CHAM_CONG VALUES('01','1-1-2021',2,'K2','NT')
INSERT CHAM_CONG VALUES('01','2-1-2021',1,'K1','NT')
INSERT CHAM_CONG VALUES('01','1-2-2021',3,'K3','NT')
INSERT CHAM_CONG VALUES('03','2-1-2021',1,'K1','NT')
INSERT CHAM_CONG VALUES('03','2-2-2021',2,'K2','NT')
INSERT CHAM_CONG VALUES('04','2-3-2021',2,'K2','NL')
INSERT CHAM_CONG VALUES('05','2-3-2021',3,'K3','NL')
INSERT CHAM_CONG VALUES('05','2-3-2021',1,'K1','NT')
INSERT CHAM_CONG VALUES('06','4-3-2020',1,'K1','NL')

--======================================================
-- NHẬP DỮ LIỆU BẢNG NHÀ CUNG CẤP
INSERT NHA_CUNG_CAP VALUES ('NCC1',N'Hải sản Khánh Duy',N'Vĩnh Hải','0221212')
INSERT NHA_CUNG_CAP VALUES ('NCC2',N'Trại gà Minh Trí',N'Vạn Giã','02233222')
INSERT NHA_CUNG_CAP VALUES ('NCC3',N'Thịt bò Quốc Châu',N'Vĩnh Trường','0224532')
INSERT NHA_CUNG_CAP VALUES ('NCC4',N'Rau sạch Huyền Trâm',N'Đà Lạt','02277666')
INSERT NHA_CUNG_CAP VALUES ('NCC5',N'Vựa bia Thành Tâm',N'Vĩnh Thọ','0221999')

SELECT * FROM CHAM_CONG

-- NHẬP DỮ LIỆU BẢNG LOẠI SẢN PHẢM
INSERT LOAI_SAN_PHAM VALUES ('HS01',N'Tôm hùm')
INSERT LOAI_SAN_PHAM VALUES ('TH02',N'Gà')
INSERT LOAI_SAN_PHAM VALUES ('GK03',N'Bia')
INSERT LOAI_SAN_PHAM VALUES ('RA04',N'Salat')
INSERT LOAI_SAN_PHAM VALUES ('TH03',N'Thịt')
INSERT LOAI_SAN_PHAM VALUES ('CA01',N'Cá')
INSERT LOAI_SAN_PHAM VALUES ('VT01',N'Vịt')

-- NHẤP DỮU LIỆU CÁC BẢNG NGUYÊN LIỆU
INSERT NGUYEN_LIEU VALUES('NL01',N'Thịt','11/12/2021',70000,N'KG')
INSERT NGUYEN_LIEU VALUES('NL02',N'Cá','10/02/2021',50000,N'KG')
INSERT NGUYEN_LIEU VALUES('NL03',N'Vịt','01/12/2021',80000,N'KG')
INSERT NGUYEN_LIEU VALUES('NL04',N'Gà','05/02/2021',10000,N'KG')
INSERT NGUYEN_LIEU VALUES('NL05',N'Tôm','07/12/2021',12000,N'KG')
INSERT NGUYEN_LIEU VALUES('NL06',N'Rau','08/12/2021',12000,N'KG')
INSERT NGUYEN_LIEU VALUES('NL07',N'Bia','07/12/2021',500000,N'Thùng')

-- NHẬP DỮ LIỆU CHI TIẾT SẢN PHẨM
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Tôm hùm cháy tỏi', 'NL05', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Cánh gà chiên mắm', 'NL04', 1)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Rau xào', 'NL06', 1)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Tôm hùm nướng bơ', 'NL05', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Gà hầm đất', 'NL04', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Thịt ba rọi', 'NL01', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Cá nướng cheese', 'NL02', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Vịt quay Quảng Nam', 'NL03', 1)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'Bia Hà Nội', 'NL07', 1)

-- NHẬP DỮ LIỆU BẢNG SẢN PHẢM
INSERT SAN_PHAM VALUES ('HS011', N'Tôm hùm cháy tỏi', 50,350000, N'Phần', 'HS01','#')
INSERT SAN_PHAM VALUES ('TH021', N'Cánh gà chiên mắm', 100,20000, N'Cánh', 'TH02','#')
INSERT SAN_PHAM VALUES ('RA041', N'Rau xào', 120,20000, N'Phần', 'RA04','#')
INSERT SAN_PHAM VALUES ('HS012', N'Tôm hùm nướng bơ', 70,300000, N'Phần', 'HS01','#')
INSERT SAN_PHAM VALUES ('TH022', N'Gà hầm đất', 50,350000, N'Phần', 'TH02','#')
INSERT SAN_PHAM VALUES ('TH023', N'Thịt ba rọi', 100,20000, N'Phần', 'TH03','#')
INSERT SAN_PHAM VALUES ('TH024', N'Cá nướng cheese', 70,300000, N'Phần', 'CA01','#')
INSERT SAN_PHAM VALUES ('TH025', N'Vịt quay Quảng Nam', 50,350000, N'Phần', 'VT01','#')
INSERT SAN_PHAM VALUES ('GK010', N'Bia Hà Nội', 1000,600000, N'Thùng', 'GK03','#')

--NHẬP DỮ LIỆU HÓA ĐƠN NHẬP
INSERT HOA_DON_NHAP VALUES ('HDN01','02/10/2021','02','NCC1')
INSERT HOA_DON_NHAP VALUES ('HDN02','12/12/2021','01','NCC2')
INSERT HOA_DON_NHAP VALUES ('HDN03','06/11/2021','05','NCC4')
INSERT HOA_DON_NHAP VALUES ('HDN04','03/01/2021','03','NCC3')
INSERT HOA_DON_NHAP VALUES ('HDN05','05/10/2021','04','NCC5')
INSERT HOA_DON_NHAP VALUES ('HDN06','03/01/2021','03','NCC4')
INSERT HOA_DON_NHAP VALUES ('HDN07','05/10/2021','04','NCC5')



--NHẬP DỮ LIỆU CHI TIẾT HÓA ĐƠN NHẬP
INSERT CHI_TIET_HOA_DON_NHAP VALUES ('10','HDN01','NL01')
INSERT CHI_TIET_HOA_DON_NHAP VALUES ('20','HDN03','NL03')
INSERT CHI_TIET_HOA_DON_NHAP VALUES ('15','HDN05','NL05')
INSERT CHI_TIET_HOA_DON_NHAP VALUES ('10','HDN02','NL04')
INSERT CHI_TIET_HOA_DON_NHAP VALUES ('30','HDN04','NL02')
INSERT CHI_TIET_HOA_DON_NHAP VALUES ('20','HDN06','NL06')
INSERT CHI_TIET_HOA_DON_NHAP VALUES ('2000','HDN07','NL07')

-- NHẤP DỮ LIỆU HOÁ DƠN (BÁN)
INSERT HOA_DON VALUES ('HD01', '01','KH1', '20210109', '01')
INSERT HOA_DON VALUES ('HD02', '03','KH5', '20210529', '02')
INSERT HOA_DON VALUES ('HD03', '02','KH3', '20210610', '03')
INSERT HOA_DON VALUES ('HD04', '05','KH4', '20210710', '04')
INSERT HOA_DON VALUES ('HD05', '04','KH1', '20210819', '04')


-- NHẤP DỮ LIỆU  BẢNG CHI TIẾT HOÁ DƠN
INSERT CHI_TIET_HOA_DON VALUES(5,'HD01','HS011')
INSERT CHI_TIET_HOA_DON VALUES(15,'HD02','TH021')
INSERT CHI_TIET_HOA_DON VALUES(2,'HD03','RA041')
INSERT CHI_TIET_HOA_DON VALUES(6,'HD04','GK010')
INSERT CHI_TIET_HOA_DON VALUES(8,'HD05','TH023')
INSERT CHI_TIET_HOA_DON VALUES(10,'HD05','GK010')


--=============================================== CÂU 3 ======================================
-- Tâm c-1,  a-1,  f-1(Giao),  d-1(nhỏ nhất),  c-1,  e-1(Không),  b-1

-- A 
-- 1 TÍNH LÃI THEO TỪNG HOÁ ĐƠN HOÁ ĐƠN
SELECT  A.MHD, ( SUM(B.SOLUONG*C.DONGIA) - SUM(E.DONGIA*D.SOLUONG*B.SOLUONG) ) AS N'LÃI'
FROM HOA_DON A JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD JOIN SAN_PHAM C ON B.MSP = C.MSP
				JOIN CHI_TIET_SAN_PHAM D ON D.TENSP = C.TENSP JOIN NGUYEN_LIEU E ON D.MANL = E.MANL
GROUP BY A.MHD



-- B 
-- CÂU 2 Có bao nhiêu hóa đơn của khách hàng là nữ
SELECT COUNT(A.MKH) AS N'Số lượng hoá đơn của khách hàng nữ'
FROM KHACH_HANG A JOIN HOA_DON B ON A.MKH = B.MKH
WHERE A.GIOITINH = N'NỮ'
SELECT * FROM HOA_DON

-- C
-- CÂU 3 Nhân viên lập 2 hoá đơn trong	quý 3 năm 2021
SELECT A.TENNV,B.MNV,COUNT(B.MNV) AS SL_DON
FROM NHAN_VIEN A JOIN HOA_DON B ON A.MNV = B.MNV
WHERE DATEPART(QUARTER, B.NGAYTAO) = 3 AND YEAR(B.NGAYTAO) = 2021
GROUP BY A.TENNV,B.MNV, (B.MNV) 
HAVING COUNT(B.MNV) = 2

-- CÂU 4 Món ăn có sô lượng được đặt lớn hơn 10 
SELECT A.TENSP, SUM(B.SOLUONG) AS N'Sô lượng đặt'
FROM SAN_PHAM A JOIN CHI_TIET_HOA_DON B ON A.MSP = B.MSP 
GROUP BY A.TENSP
HAVING SUM(B.SOLUONG) > 10

-- D 
-- CÂU 5 Thông tin nhân viên có tiên lương cao nhất 
-- CÁCH HAY
SELECT TOP (1) CC.MNV, SUM(LC.MUCTHUONG*CLV.GIATIEN) AS TIEN
FROM CHAM_CONG CC JOIN LOAI_CA LC ON CC.MALOAICA = LC.MALOAICA
	JOIN CA_LAM_VIEC CLV ON CC.MACA = CLV.MACA
GROUP BY CC.MNV 
ORDER BY SUM(LC.MUCTHUONG*CLV.GIATIEN) DESC

SELECT TOP (1)A.MNV AS N'Mã NV', A.TENNV AS N'Nhân viên', SUM(LUONG.LUONG_THEOCA) AS N'Lương/tháng'
FROM (SELECT A.MNV, A.CHUCVU, A.TENNV ,(CASE  
											WHEN B.MALOAICA = 'NL' THEN ((COUNT(B.MaCa)*D.GIATIEN*1.5))
											WHEN B.MALOAICA = 'NN' THEN ((COUNT(B.MaCa)*D.GIATIEN*1.2)) 
											ELSE((COUNT(B.MaCa)*D.GIATIEN*1)) 
										END) AS LUONG_THEOCA
	FROM NHAN_VIEN A JOIN CHAM_CONG B ON A.MNV = B.MNV 
					 JOIN LOAI_CA C ON B.MALOAICA = C.MALOAICA 
					 JOIN CA_LAM_VIEC D ON B.MACA = D.MACA
	GROUP BY A.MNV, A.CHUCVU, A.TENNV, B.MaCa, B.MALOAICA, D.GIATIEN) LUONG 
JOIN NHAN_VIEN A ON LUONG.MNV = A.MNV
GROUP BY A.MNV,  A.TENNV
ORDER BY SUM(LUONG.LUONG_THEOCA) DESC


-- E 
--CÂU 6 Nhân viên chưa nhập một hoá đơn nào trong năm 2021
SELECT A1.MNV AS N'Mã NV', A1.TENNV AS N'Nhân viên'
FROM NHAN_VIEN A1 
WHERE A1.MNV NOT IN (SELECT  DISTINCT A.MNV 
					 FROM NHAN_VIEN A JOIN HOA_DON B ON A.MNV  = B.MNV 
					 WHERE YEAR(B.NGAYTAO) = 2021)


-- F
-- CÂU 7 Nhân viên làm tấc cả các ca trong ngày (K1,K2,K3) 
SELECT A.MNV AS N'Mã NV', A.TENNV AS N'Nhân viên'
FROM NHAN_VIEN A JOIN CHAM_CONG B1 ON A.MNV = B1.MNV
WHERE NOT EXISTS 
					(SELECT * 
					FROM CA_LAM_VIEC C 
					WHERE NOT EXISTS 
								    (SELECT * 
									FROM CHAM_CONG B2
									WHERE B1.MNV=B2.MNV AND C.MACA = B2.MACA ))
GROUP BY A.TENNV, A.MNV

--===================================================================================
-- CÂU 8 Số tiền phải trả của mỗi khách hàngcho hoá đơn của mình
SELECT D.TENKH ,A.MHD, SUM(B.SOLUONG * C.DONGIA) AS N'Thành tiền'
FROM HOA_DON A  JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD 
				JOIN SAN_PHAM C ON B.MSP = C.MSP 
				JOIN KHACH_HANG D ON D.MKH = A.MKH
GROUP BY A.MHD ,D.TENKH
-- CÂU 9 Tổng tiền thanh toán cho các đơn nhập của nhà hàng 

--====================================================================================

-- TRÂM 

-- 1E Hiển thị nhà cung cấp chưa nhập nguyên liệu vào tháng 12 năm 2021
SELECT MANCC ,TENNCC 
FROM NHA_CUNG_CAP
WHERE MANCC NOT IN (
		SELECT MANCC 
		FROM HOA_DON_NHAP 
		WHERE MONTH(NGAYTAO) = 12 AND YEAR(NGAYTAO) = 2021  )

-- 2G Cập nhập lại số tiền công của ca đặc biệt +1đ
UPDATE LOAI_CA
SET MUCTHUONG = MUCTHUONG + 0.5
WHERE MALOAICA = 'NL'

-- 3D (max)-Hiển thị tên nguyen liệu và tên nhà cung cấp được nhập vào có số lượng nhiều nhất 
SELECT NCC.TENNCC ,NL.TENNL, CT.SOLUONG
FROM CHI_TIET_HOA_DON_NHAP CT JOIN HOA_DON_NHAP HDN  ON  CT.MHD = HDN.MHD
							  JOIN NHA_CUNG_CAP NCC ON HDN.MANCC = NCC.MANCC	
							  JOIN NGUYEN_LIEU NL ON NL.MANL = CT.MANL
WHERE SOLUONG > = ( SELECT  MAX(SOLUONG) AS [NL_MAX] FROM CHI_TIET_HOA_DON_NHAP )



-- 4B  Số món ăn của từng nguyên liệu.
SELECT COUNT(A.TENSP) AS [SL_SP] ,A.MANL	, B.TENNL	
FROM CHI_TIET_SAN_PHAM A JOIN NGUYEN_LIEU  B ON A.MANL  = B.MANL
GROUP BY A.MANL, B.TENNL	


--5G (Delete) Xóa món ăn được chế biến từ nguyển liệu có mã là NL03. ?

ALTER TABLE CHI_TIET_SAN_PHAM
DROP CONSTRAINT FK_CHI_TIET_SAN_PHAM_SAN_PHAM;
	
ALTER TABLE CHI_TIET_SAN_PHAM
ADD CONSTRAINT FK_CHI_TIET_SAN_PHAM_SAN_PHAM
FOREIGN KEY (MANL) 
REFERENCES SAN_PHAM(MANL)
ON DELETE CASCADE;

DELETE
FROM SAN_PHAM
WHERE SAN_PHAM.TENSP =  (
		SELECT CHI_TIET_SAN_PHAM.TENSP
		FROM CHI_TIET_SAN_PHAM
		WHERE MANL ='NL03'
		)


-- 6E (Chưa có) Hiển thị nhân viên chưa làm ca đặc biệt nào
SELECT MNV ,TENNV
FROM NHAN_VIEN
WHERE MNV NOT IN (
	SELECT DISTINCT MNV 
	FROM CHAM_CONG
	WHERE MALOAICA ='NL' )

--7E  (Khong) Hiển thị nhà cung cấp không cung cấp nguyên liệu nào vào năn 2021 
SELECT NCC.MANCC ,NCC.TENNCC 
FROM NHA_CUNG_CAP NCC JOIN HOA_DON_NHAP HDN ON NCC.MANCC = HDN.MANCC
WHERE NCC.MANCC NOT IN 
	(SELECT DISTINCT MANCC FROM HOA_DON_NHAP
	WHERE YEAR(NGAYTAO) = 2021)  

--=====================================================================================

-- DUY 

-- 1C nguyên liệu có đơn giá lớn nhât
SELECT A.TENNL, A.DONGIA
FROM NGUYEN_LIEU A 
GROUP BY A.TENNL, A.DONGIA
HAVING A.DONGIA >= ALL (SELECT A1.DONGIA
						FROM NGUYEN_LIEU A1)
-- 2B CÂUb đếm số nhân viên
SELECT COUNT(n.MNV)
FROM nhan_vien n 
WHERE n.GIOITINH = N'nữ'

-- 3G CẬP NHẬT MÃ NHÀ CUNG CẤP
UPDATE NHA_CUNG_CAP
SET MANCC = '01-HN'
WHERE DIACHI = N'HÀ NỘI'
-- 4G XOÁ CÁC CA LÀM TRONG NGÀY 20/11
DELETE FROM CHAM_CONG 
WHERE MNV = '02' AND NGAY= '2021-20-11'

-- 5B TỔNG TIỀN NGUYÊN LIỆU NHẬP TÊN LÀ CÁ
SELECT SUM(nl.DONGIA * cthdn.SOLUONG) AS "tong tien"
FROM nguyen_lieu nl, chi_tiet_hoa_don_nhap cthdn
WHERE nl.TENNL = N'CÁ' AND NL.MANL = cthdn.MANL



--6C HIỂN THỊ THÔNG TIN NHÂN VIÊN ĐÃ PHỤC VỤ TRONG NGÀY 19/82021
SELECT kh.TENKH,nv.TENNV
FROM
    khach_hang kh 
    LEFT JOIN hoa_don hd ON kh.MKH = hd.MKH
    LEFT JOIN nhan_vien nv on hd.MNV = nv.MNV
    WHERE hd.NGAYTAO = '20210819'
--7E TỔNG THỜI GIAN LÀM VIỆC VỦA TỪNG NV TRONG NĂM 2021
SELECT A.TENNV, SUM(C.THOIGIAN) AS TG_LAMVIEC
FROM NHAN_VIEN A JOIN CHAM_CONG B ON A.MNV = B.MNV JOIN	 CA_LAM_VIEC C ON C.MACA = B.MACA
WHERE YEAR(B.NGAY)= 2021
GROUP  BY A.TENNV





--============================================================
--TRÍ

--1A TÊN MÓN ĂN CÓ NGUYÊN LIỆU TỪ NHÀ CUNG CẤP THỊY BÒ QUỐC CHÂU
 SELECT A.TENSP, A.DONGIA
 FROM SAN_PHAM A JOIN CHI_TIET_SAN_PHAM B ON A.TENSP = B.TENSP 
				JOIN NGUYEN_LIEU C ON C.MANL = B.MANL 
				JOIN CHI_TIET_HOA_DON_NHAP D ON D.MANL = B.MANL 
				JOIN HOA_DON_NHAP E ON E.MHD = D.MHD 
				JOIN NHA_CUNG_CAP F ON F.MANCC = E.MANCC
 WHERE F.TENNCC = N'TRẠI GÀ MINH TRÍ'

 --2B
 DELETE FROM SAN_PHAM
 WHERE TENSP NOT IN (SELECT tensp
				FROM san_pham
				WHERE msp  IN (SELECT DISTINCT msp 
									FROM chi_tiet_hoa_don a
									join hoa_don b on a.mhd = b.mhd
									where year(ngaytao) = 2022))


 --3C MÓN ĂN ĐƯỢC ĐẶT TỪ 2 ĐẾN 5 LẦN TRONG NGÀY ?
 SELECT c.tensp, count(c.msp) as slg
FROM hoa_don a
inner join chi_tiet_hoa_don b on a.mhd = b.mhd
inner join san_pham c on b.msp = c.msp
GROUP BY c.tensp, c.msp
HAVING COUNT(c.msp) BETWEEN 2 AND 4
--4E MÓN ĂN CHƯA ĐƯỢC ĐẶT TRONG NĂM 2021
SELECT tensp,MSP
FROM san_pham
WHERE msp  NOT IN (SELECT DISTINCT msp 
				  FROM chi_tiet_hoa_don a
				  join hoa_don b on a.mhd = b.mhd
				  where year(ngaytao) = 2021)


--5G XOÁ SẢN PHẦM ĐƯỢC ĐẶT ÍT HƠN 2 LẦN
DELETE FROM SAN_PHAM
WHERE  tensp in (SELECT c.tensp
FROM hoa_don a
inner join chi_tiet_hoa_don b on a.mhd = b.mhd
inner join san_pham c on b.msp = c.msp
GROUP BY c.tensp, c.msp
HAVING COUNT(c.msp) < 2 )

--6G TĂNG GIÁ 20% CÁ SẢN PHẨM CÓ NGUYÊN LIỆU TỪ TÔM
UPDATE san_pham
SET dongia *= 1
from san_pham a
join chi_tiet_san_pham b on a.tensp = b.tensp
join nguyen_lieu c on b.manl = c.manl
WHERE c.tennl = N'Tôm';

-- 7E Cho biết những mặt hàng được bán vào tháng 1 năm 2020 nhưng không được bán vào tháng 2 năm 2020
(SELECT a.msp, b.tensp, convert(varchar,ngaytao,103) AS NGAYBAN
FROM chi_tiet_hoa_don a 
join san_pham b  on a.msp = b.msp  
join hoa_don c on c.mhd = a.mhd 
WHERE  year(c.ngaytao) = 2021 and month(c.ngaytao) = 1)

EXCEPT

(SELECT a.msp, b.tensp, convert(varchar,ngaytao,103)
FROM chi_tiet_hoa_don a 
join san_pham b on a.msp = b.msp
join hoa_don c on c.mhd = a.mhd
WHERE year(c.ngaytao) = 2021 and month(c.ngaytao) = 5)

--===================================================================

-- CHÂU 
-- CÂU 1 In ra danh sách các nguyên liệu có đơn vị tính là KG và đơn giá lớn hơn 70000 
SELECT *
FROM NGUYEN_LIEU
WHERE DVT='KG' AND DONGIA >70000


-- CÂU 2 Tổng số ca và tổng số tiền của từng ca (Aggregate Functions)
SELECT A.MACA, COUNT(A.MALOAICA) AS SLCA, SUM(B.MUCTHUONG*C.GIATIEN) AS TIEN 
FROM CHAM_CONG A JOIN LOAI_CA B ON A.MALOAICA = B.MALOAICA
	JOIN CA_LAM_VIEC C ON A.MACA = C.MACA
GROUP BY A.MACA
 
-- Câu 3 In ra danh sách tổng nhân viên nữ có chức vụ là lễ tân (Aggregate Functions )
SELECT COUNT(MNV) AS SL
FROM NHAN_VIEN
WHERE GIOITINH=N'Nữ' AND CHUCVU=N'Lễ tân'
--- Câu 4 tìm nguyên liệu có đơn giá nhỏ nhất (nhỏ nhất)
SELECT * 
FROM NGUYEN_LIEU
WHERE DONGIA =(
	SELECT MIN(DONGIA) AS MIN 
	FROM NGUYEN_LIEU)

-- CÂU 5 KHÁCH HÀNG ĐẶT TẤC CẢ CÁC MÓN
SELECT KH.TENKH
FROM KHACH_HANG KH INNER JOIN HOA_DON HD ON KH.MKH = HD.MKH
					INNER JOIN CHI_TIET_HOA_DON A ON HD.MHD = A.MHD
WHERE NOT EXISTS (
	SELECT *
	FROM SAN_PHAM  B1
	WHERE NOT EXISTS (
		SELECT *
		FROM CHI_TIET_HOA_DON A1
		WHERE A.MHD=A1.MHD AND B1.MSP=A1.MSP ))
GROUP BY  KH.TENKH

-- CÂU 6 NHÂN VIÊN CHƯA TẠO HOÁ ĐƠN NHẬP NÀO NÀO
SELECT NV.TENNV
FROM NHAN_VIEN NV LEFT JOIN HOA_DON_NHAP HDN ON NV.MNV = HDN.MNV
WHERE HDN.MNV IS NULL

--- Câu 7 cập nhật chức vụ là lễ tân đối với nhân viên chưa lập hóa đơn nhập nào từ nhà cung cấp (update)
UPDATE NHAN_VIEN
SET CHUCVU=N'Lễ tân'
WHERE NHAN_VIEN.TENNV =(
	SELECT NV.TENNV
	FROM NHAN_VIEN NV LEFT JOIN HOA_DON_NHAP HDN ON NV.MNV = HDN.MNV
	WHERE HDN.MNV IS NULL)



--=============================================== CÂU 4 ======================================

-- funtion

-- trigger

-- proc