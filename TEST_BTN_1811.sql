﻿CREATE DATABASE TEST_BTN_1811

USE TEST_BTN_1811
--
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
INSERT NHAN_VIEN VALUES('01',N'TRẦN VĂN HÒA',N'123 HÒN CHỒNG','NAM','1995-02-01','0123456',N'QUẢN LÝ','QUANLI','QUANLI');
INSERT NHAN_VIEN VALUES('02',N'LÊ VĂN ĐỨC',N'12 PHAN TRỌNG TUỆ ','NAM','2001-04-02','0139283',N'PHỤC VỤ','DUCLE','DUCLE24');
INSERT NHAN_VIEN VALUES('03',N'BÙI NGỌC HOA',N'11 CỦ CHI ',N'NỮ','2000-04-12','0139999',N'LỄ TÂN','HOABUI','HOABUI12');
INSERT NHAN_VIEN VALUES('04',N'LÊ VĂN SANG',N'05 PHAN TRỌNG TUỆ ','NAM','2000-06-03','0233283',N'PHỤC VỤ','SANGLE','SANGLE36');
INSERT NHAN_VIEN VALUES('05',N'NGUYỄN KHÁNH AN',N'33 BẮC SƠN',N'NỮ','2002-04-08','0133554',N'THU NGÂN','ANNGUYEN','ANNGUYEN84');
INSERT NHAN_VIEN VALUES('06',N'NGUYỄN ĐẠT',N'37 BẮC SƠN',N'NAM','2000-07-07','77676',N'PHỤC VỤ','DATNGUYEN','DATNGUYEN6');



-- NHẬP DỮ LIỆU BẢNG KHÁCH HÀNG
INSERT KHACH_HANG VALUES ('KH1',N'ĐINH GIA KHÁNH',N'NAM',N'13/23 BẮC SƠN','0331234','KHANHDINH','KHANH123')
INSERT KHACH_HANG VALUES ('KH2',N'NGUYỄN TRÂN ANH',N'NỮ',N'233 ĐIỆN BIÊN PHỦ','0331122','TRANANH ','TRANANH22 ')
INSERT KHACH_HANG VALUES ('KH3',N'NGUYỄN KHÁNH DUY',N'NAM',N'25 NGUYỄN ĐÌNH CHIỂU','0333342','KHANHDUY','DUY3342')
INSERT KHACH_HANG VALUES ('KH4',N'PHAN THỊ HUYỀN TRÂM',N'NỮ',N'80/23 BẮC SƠN','0338877','TRAMPHAN','TRAMPHAN77')
INSERT KHACH_HANG VALUES ('KH5',N'ĐINH VĂN BẢO',N'NAM',N'02 NGUYỄN ĐÌNH CHIỂU','0334343','BAODINH','BAO4343')
--======================================================
-- NHẤP DỮU LIỆU CÁC BẢNG CHÁM CÔNG
INSERT CA_LAM_VIEC VALUES('K1',N'SÁNG',10000,6)
INSERT CA_LAM_VIEC VALUES('K2',N'TRƯA',11000,6)
INSERT CA_LAM_VIEC VALUES('K3',N'TỐI',12000,5)

INSERT LOAI_CA VALUES('NL',N'NGÀY LỄ',1.5)
INSERT LOAI_CA VALUES('NN',N'NGÀY NGHỈ',1.2)
INSERT LOAI_CA VALUES('NT',N'THƯỜNG',1.0)

INSERT CHAM_CONG VALUES('02','2021-01-01',2,'K2','NL');
INSERT CHAM_CONG VALUES('02','2021-01-01',3,'K3','NN');
INSERT CHAM_CONG VALUES('02','2021-01-01',1,'K1','NN');
INSERT CHAM_CONG VALUES('02','2021-05-05',3,'K3','NL');
INSERT CHAM_CONG VALUES('01','2021-01-01',2,'K2','NT');
INSERT CHAM_CONG VALUES('01','2021-01-02',1,'K1','NT');
INSERT CHAM_CONG VALUES('01','2021-02-01',3,'K3','NT');
INSERT CHAM_CONG VALUES('03','2021-01-02',1,'K1','NT');
INSERT CHAM_CONG VALUES('03','2021-02-02',2,'K2','NT');
INSERT CHAM_CONG VALUES('04','2021-03-02',2,'K2','NL');
INSERT CHAM_CONG VALUES('05','2021-03-02',3,'K3','NL');
INSERT CHAM_CONG VALUES('05','2021-03-02',1,'K1','NT');
INSERT CHAM_CONG VALUES('06','2020-03-04',1,'K1','NL');


--======================================================
-- NHẬP DỮ LIỆU BẢNG NHÀ CUNG CẤP
INSERT NHA_CUNG_CAP VALUES ('NCC1',N'HẢI SẢN KHÁNH DUY',N'VĨNH HẢI','0221212')
INSERT NHA_CUNG_CAP VALUES ('NCC2',N'TRẠI GÀ MINH TRÍ',N'VẠN GIÃ','02233222')
INSERT NHA_CUNG_CAP VALUES ('NCC3',N'THỊT BÒ QUỐC CHÂU',N'VĨNH TRƯỜNG','0224532')
INSERT NHA_CUNG_CAP VALUES ('NCC4',N'RAU SẠCH HUYỀN TRÂM',N'ĐÀ LẠT','02277666')
INSERT NHA_CUNG_CAP VALUES ('NCC5',N'VỰA BIA THÀNH TÂM',N'VĨNH THỌ','0221999')

SELECT * FROM CHAM_CONG

-- NHẬP DỮ LIỆU BẢNG LOẠI SẢN PHẢM
INSERT LOAI_SAN_PHAM VALUES ('HS01',N'TÔM HÙM')
INSERT LOAI_SAN_PHAM VALUES ('TH02',N'GÀ')
INSERT LOAI_SAN_PHAM VALUES ('GK03',N'BIA')
INSERT LOAI_SAN_PHAM VALUES ('RA04',N'SALAT')
INSERT LOAI_SAN_PHAM VALUES ('TH03',N'THỊT')
INSERT LOAI_SAN_PHAM VALUES ('CA01',N'CÁ')
INSERT LOAI_SAN_PHAM VALUES ('VT01',N'VỊT')

-- NHẤP DỮU LIỆU CÁC BẢNG NGUYÊN LIỆU
INSERT NGUYEN_LIEU VALUES('NL01',N'THỊT','2021-12-11',70000,N'KG');
INSERT NGUYEN_LIEU VALUES('NL02',N'CÁ','2021-02-10',50000,N'KG');
INSERT NGUYEN_LIEU VALUES('NL03',N'VỊT','2021-12-01',80000,N'KG');
INSERT NGUYEN_LIEU VALUES('NL04',N'GÀ','2021-02-05',10000,N'KG');
INSERT NGUYEN_LIEU VALUES('NL05',N'TÔM','2021-12-07',12000,N'KG');
INSERT NGUYEN_LIEU VALUES('NL06',N'RAU','2021-12-08',12000,N'KG');
INSERT NGUYEN_LIEU VALUES('NL07',N'BIA','2021-12-07',500000,N'THÙNG');


-- NHẬP DỮ LIỆU CHI TIẾT SẢN PHẨM
INSERT CHI_TIET_SAN_PHAM VALUES (   N'TÔM HÙM CHÁY TỎI', 'NL05', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'CÁNH GÀ CHIÊN MẮM', 'NL04', 1)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'RAU XÀO', 'NL06', 1)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'TÔM HÙM NƯỚNG BƠ', 'NL05', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'GÀ HẦM ĐẤT', 'NL04', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'THỊT BA RỌI', 'NL01', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'CÁ NƯỚNG CHEESE', 'NL02', 2)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'VỊT QUAY QUẢNG NAM', 'NL03', 1)
INSERT CHI_TIET_SAN_PHAM VALUES (   N'BIA HÀ NỘI', 'NL07', 1)

-- NHẬP DỮ LIỆU BẢNG SẢN PHẢM
INSERT SAN_PHAM VALUES ('HS011', N'TÔM HÙM CHÁY TỎI', 50,350000, N'PHẦN', 'HS01','#')
INSERT SAN_PHAM VALUES ('TH021', N'CÁNH GÀ CHIÊN MẮM', 100,20000, N'CÁNH', 'TH02','#')
INSERT SAN_PHAM VALUES ('RA041', N'RAU XÀO', 120,20000, N'PHẦN', 'RA04','#')
INSERT SAN_PHAM VALUES ('HS012', N'TÔM HÙM NƯỚNG BƠ', 70,300000, N'PHẦN', 'HS01','#')
INSERT SAN_PHAM VALUES ('TH022', N'GÀ HẦM ĐẤT', 50,350000, N'PHẦN', 'TH02','#')
INSERT SAN_PHAM VALUES ('TH023', N'THỊT BA RỌI', 100,20000, N'PHẦN', 'TH03','#')
INSERT SAN_PHAM VALUES ('TH024', N'CÁ NƯỚNG CHEESE', 70,300000, N'PHẦN', 'CA01','#')
INSERT SAN_PHAM VALUES ('TH025', N'VỊT QUAY QUẢNG NAM', 50,350000, N'PHẦN', 'VT01','#')
INSERT SAN_PHAM VALUES ('GK010', N'BIA HÀ NỘI', 1000,600000, N'THÙNG', 'GK03','#')

--NHẬP DỮ LIỆU HÓA ĐƠN NHẬP
INSERT HOA_DON_NHAP VALUES ('HDN01','2021-10-02','02','NCC1');
INSERT HOA_DON_NHAP VALUES ('HDN02','2021-12-12','01','NCC2');
INSERT HOA_DON_NHAP VALUES ('HDN03','2021-11-06','05','NCC4');
INSERT HOA_DON_NHAP VALUES ('HDN04','2021-01-03','03','NCC3');
INSERT HOA_DON_NHAP VALUES ('HDN05','2021-10-05','04','NCC5');
INSERT HOA_DON_NHAP VALUES ('HDN06','2021-01-03','03','NCC4');
INSERT HOA_DON_NHAP VALUES ('HDN07','2021-10-05','04','NCC5');



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

--======================================= CÂU TRUY VẤN =======================================
 /*	CÂU 3
	A
		1 TÍNH LÃI THEO TỪNG HOÁ ĐƠN HOÁ ĐƠN
		2 TÊN MÓN ĂN CÓ NGUYÊN LIỆU TỪ NHÀ CUNG CẤP THỊT BÒ QUỐC CHÂU
		3 IN RA DANH SÁCH CÁC NGUYÊN LIỆU CÓ ĐƠN VỊ TÍNH LÀ KG VÀ ĐƠN GIÁ LỚN HƠN 70000
	B
		4 CÓ BAO NHIÊU HÓA ĐƠN CỦA KHÁCH HÀNG LÀ NỮ
		5 SỐ MÓN ĂN CỦA TỪNG NGUYÊN LIỆU
		6 CÓ BAO NHIÊU NHÂN VIÊN NỮ
		7 TỔNG TIỀN NGUYÊN LIỆU NHẬP TỪ CÁ
		8 SỐ MÓN ĂN CỦA TỪNG NGUYÊN LIỆU
		9 TỔNG SỐ CA VÀ TỔNG SỐ TIỀN CỦA TỪNG CA
		10 IN RA DANH SÁCH TỔNG NHÂN VIÊN NỮ CÓ CHỨC VỤ LÀ LỄ TÂN
		
	C
		11 NHÂN VIÊN LẬP 2 HOÁ ĐƠN TRONG QUÝ 3 NĂM 2021
		12 NGUYÊN LIỆU CÓ ĐƠN GIÁ LỚN NHÂT
		13 MÓN ĂN ĐƯỢC ĐẶT TỪ 2 ĐẾN 5 LẦN 
		14 NHÂN VIÊN LẬP 2 HOÁ ĐƠN TRONG QUÝ 3 NĂM 2021
		15 NHÂN VIÊN CHƯA TẠO HOÁ ĐƠN NHẬP NÀO NÀO
	D
		16 NGUYÊN LIỆU CÓ ĐƠN GIÁ LỚN NHÂT
		17 THÔNG TIN NHÂN VIÊN CÓ TIÊN LƯƠNG CAO NHẤT 
		18 HIỂN THỊ TÊN NGUYEN LIỆU VÀ TÊN NHÀ CUNG CẤP ĐƯỢC NHẬP VÀO CÓ SỐ LƯỢNG NHIỀU NHẤT 
	E 
		19 NHÂN VIÊN CHƯA NHẬP MỘT HOÁ ĐƠN NÀO TRONG NĂM 2021
		20 HIỂN THỊ NHÀ CUNG CẤP CHƯA NHẬP NGUYÊN LIỆU VÀO THÁNG 12 NĂM 2021
		21 HIỂN THỊ NHÂN VIÊN CHƯA LÀM CA ĐẶC BIỆT NÀO
		22 CHO BIẾT NHỮNG MẶT HÀNG ĐƯỢC BÁN VÀO THÁNG 1 NĂM 2020 NHƯNG KHÔNG ĐƯỢC BÁN VÀO THÁNG 2 NĂM 2020
		23 HIỂN THỊ NHÀ CUNG CẤP KHÔNG CUNG CẤP NGUYÊN LIỆU NÀO VÀO NĂN 2021 
		24 TỔNG THỜI GIAN LÀM VIỆC VỦA TỪNG NV THÁNG 2 NĂM 2021
		25 MÓN ĂN CHƯA ĐƯỢC ĐẶT TRONG NĂM 2021
		
	F
		26 NHÂN VIÊN LÀM TẤC CẢ CÁC CA TRONG NGÀY (K1,K2,K3)
		27 KHÁCH HÀNG ĐẶT TẤC CẢ CÁC MÓN
		28 CHO BIẾT NHỮNG MẶT HÀNG ĐƯỢC BÁN VÀO THÁNG 1 NĂM 2020 NHƯNG KHÔNG ĐƯỢC BÁN VÀO THÁNG 2 NĂM 2020
	G
		29 CẬP NHẬP LẠI SỐ TIỀN CÔNG CỦA CA ĐẶC BIỆT
		30 CẬP NHẬT MÃ NHÀ CUNG CẤP Ở HÀ NỘI
		31 XOÁ CÁC CA LÀM TRONG NGÀY 20/11
		32 XOÁ SẢN PHẦM ĐƯỢC ĐẶT ÍT HƠN 2 LẦN
		33 TĂNG GIÁ 20% CÁ SẢN PHẨM CÓ NGUYÊN LIỆU TỪ TÔM
		34 CẬP NHẬT CHỨC VỤ LÀ LỄ TÂN ĐỐI VỚI NHÂN VIÊN CHƯA LẬP HÓA ĐƠN NHẬP NÀO TỪ NHÀ CUNG CẤP
		35 XÓA MÓN ĂN ĐƯỢC CHẾ BIẾN TỪ NGUYỂN LIỆU CÓ MÃ LÀ NL03

	CÂU 4
	FUNTION 
		1 TÍNH LƯƠNG CỦA NHÂN VIÊN THEO THAM SỐ MÃ NHÂN VIÊN
		2 TÍNH TUỔI CỦA TỪNG NHÂN VIÊN (KIỂU GIÁ TRỊ TRẢ VỀ LÀ 1 GIÁ TRỊ)
		3 THÔNG TIN CA LÀM VIỆC CỦA NHÂN VIÊN CÓ MÃ NHÂN VIÊN LÀ THAM SỐ ĐÂU VÀO
	STORED PROCEDURE
		4 HIỂN THỊ THÔNG TIN DANH SÁCH HOÁ ĐƠN CỦA KHÁCH HÀNG
		5 THỐNG KÊ SỐ LƯỢNG BÁN VÀ CÒN LẠI CỦA SẢN PHÂM
		6 THÊM MỘT NGUYÊN LIỆU VÀO BẢNG NGUYÊN LIỆU
	TRIGGER
		7 KIỂM TRA TÍNH HỢP LỆ CỦA MÃ CA VÀ SỐ THỨ TỰ CA KHI THÊM MỘT BẢN GHI VÀO BẢNG CHẤM CÔNG( VD : STT CA 1 NHƯNG MÃ CA LÀ 2)
		8 KIỂM TRA, CẬP NHẬT SỐ LƯỢNG SẢN PHẨM ĐẶT SO VỚI SỐ LƯỢNG HIỆ CÓ TRONG BẢNG SẢN PHẦM 
		9 CẬP NHẬT SỐ LƯỢNG SẢN PHẨM KHI CHỈNH SỬA SỐ LƯỢNG TRONG BẢNG CHI TIẾT HOÁ ĐƠN
		10 CẬP NHẬT CHI TIẾT SẢN PHẨM KHI XOÁ 1 CHI TIẾT HOÁ ĐƠN

 */
--=============================================== CÂU 3 ======================================
-- TÂM
-- A 
-- 1 TÍNH LÃI THEO TỪNG HOÁ ĐƠN HOÁ ĐƠN
SELECT  A.MHD, ( SUM(B.SOLUONG*C.DONGIA) - SUM(E.DONGIA*D.SOLUONG*B.SOLUONG) ) AS N'LÃI'
FROM HOA_DON A JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD JOIN SAN_PHAM C ON B.MSP = C.MSP
				JOIN CHI_TIET_SAN_PHAM D ON D.TENSP = C.TENSP JOIN NGUYEN_LIEU E ON D.MANL = E.MANL
GROUP BY A.MHD


-- B 
-- CÂU 2 CÓ BAO NHIÊU HÓA ĐƠN CỦA KHÁCH HÀNG LÀ NỮ
SELECT COUNT(A.MKH) AS N'SỐ LƯỢNG HOÁ ĐƠN CỦA KHÁCH HÀNG NỮ'
FROM KHACH_HANG A JOIN HOA_DON B ON A.MKH = B.MKH
WHERE A.GIOITINH = N'NỮ'
SELECT * FROM HOA_DON

-- C
-- CÂU 3 NHÂN VIÊN LẬP 2 HOÁ ĐƠN TRONG	QUÝ 3 NĂM 2021
SELECT A.TENNV,B.MNV,COUNT(B.MNV) AS SL_DON
FROM NHAN_VIEN A JOIN HOA_DON B ON A.MNV = B.MNV
WHERE DATEPART(QUARTER, B.NGAYTAO) = 3 AND YEAR(B.NGAYTAO) = 2021
GROUP BY A.TENNV,B.MNV, (B.MNV) 
HAVING COUNT(B.MNV) = 2

-- CÂU 4 MÓN ĂN CÓ SÔ LƯỢNG ĐƯỢC ĐẶT LỚN HƠN 10 
SELECT A.TENSP, SUM(B.SOLUONG) AS N'SÔ LƯỢNG ĐẶT'
FROM SAN_PHAM A JOIN CHI_TIET_HOA_DON B ON A.MSP = B.MSP 
GROUP BY A.TENSP
HAVING SUM(B.SOLUONG) > 10

-- D 
-- CÂU 5 THÔNG TIN NHÂN VIÊN CÓ TIÊN LƯƠNG CAO NHẤT 
-- CÁCH HAY
SELECT TOP (1) CC.MNV, SUM(LC.MUCTHUONG*CLV.GIATIEN) AS TIEN
FROM CHAM_CONG CC JOIN LOAI_CA LC ON CC.MALOAICA = LC.MALOAICA
	JOIN CA_LAM_VIEC CLV ON CC.MACA = CLV.MACA
GROUP BY CC.MNV 
ORDER BY SUM(LC.MUCTHUONG*CLV.GIATIEN) DESC

SELECT TOP (1)A.MNV AS N'MÃ NV', A.TENNV AS N'NHÂN VIÊN', SUM(LUONG.LUONG_THEOCA) AS N'LƯƠNG/THÁNG'
FROM (SELECT A.MNV, A.CHUCVU, A.TENNV ,(CASE  
											WHEN B.MALOAICA = 'NL' THEN ((COUNT(B.MACA)*D.GIATIEN*1.5))
											WHEN B.MALOAICA = 'NN' THEN ((COUNT(B.MACA)*D.GIATIEN*1.2)) 
											ELSE((COUNT(B.MACA)*D.GIATIEN*1)) 
										END) AS LUONG_THEOCA
	FROM NHAN_VIEN A JOIN CHAM_CONG B ON A.MNV = B.MNV 
					 JOIN LOAI_CA C ON B.MALOAICA = C.MALOAICA 
					 JOIN CA_LAM_VIEC D ON B.MACA = D.MACA
	GROUP BY A.MNV, A.CHUCVU, A.TENNV, B.MACA, B.MALOAICA, D.GIATIEN) LUONG 
JOIN NHAN_VIEN A ON LUONG.MNV = A.MNV
GROUP BY A.MNV,  A.TENNV
ORDER BY SUM(LUONG.LUONG_THEOCA) DESC


-- E 
--CÂU 6 NHÂN VIÊN CHƯA NHẬP MỘT HOÁ ĐƠN NÀO TRONG NĂM 2021
SELECT A1.MNV AS N'MÃ NV', A1.TENNV AS N'NHÂN VIÊN'
FROM NHAN_VIEN A1 
WHERE A1.MNV NOT IN (SELECT  DISTINCT A.MNV 
					 FROM NHAN_VIEN A JOIN HOA_DON B ON A.MNV  = B.MNV 
					 WHERE YEAR(B.NGAYTAO) = 2021)


-- F
-- CÂU 7 NHÂN VIÊN LÀM TẤC CẢ CÁC CA TRONG NGÀY (K1,K2,K3) 
SELECT A.MNV AS N'MÃ NV', A.TENNV AS N'NHÂN VIÊN'
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
-- CÂU 8 (THÊM) SỐ TIỀN PHẢI TRẢ CỦA MỖI KHÁCH HÀNGCHO HOÁ ĐƠN CỦA MÌNH
SELECT D.TENKH ,A.MHD, SUM(B.SOLUONG * C.DONGIA) AS N'THÀNH TIỀN'
FROM HOA_DON A  JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD 
				JOIN SAN_PHAM C ON B.MSP = C.MSP 
				JOIN KHACH_HANG D ON D.MKH = A.MKH
GROUP BY A.MHD ,D.TENKH
--====================================================================================

-- TRÂM 

-- 1E HIỂN THỊ NHÀ CUNG CẤP CHƯA NHẬP NGUYÊN LIỆU VÀO THÁNG 12 NĂM 2021
SELECT MANCC ,TENNCC 
FROM NHA_CUNG_CAP
WHERE MANCC NOT IN (
		SELECT MANCC 
		FROM HOA_DON_NHAP 
		WHERE MONTH(NGAYTAO) = 12 AND YEAR(NGAYTAO) = 2021  )

-- 2G CẬP NHẬP LẠI SỐ TIỀN CÔNG CỦA CA ĐẶC BIỆT +1Đ
UPDATE LOAI_CA
SET MUCTHUONG = MUCTHUONG + 0.5
WHERE MALOAICA = 'NL'

-- 3D (MAX)-HIỂN THỊ TÊN NGUYEN LIỆU VÀ TÊN NHÀ CUNG CẤP ĐƯỢC NHẬP VÀO CÓ SỐ LƯỢNG NHIỀU NHẤT 
SELECT NCC.TENNCC ,NL.TENNL, CT.SOLUONG
FROM CHI_TIET_HOA_DON_NHAP CT JOIN HOA_DON_NHAP HDN  ON  CT.MHD = HDN.MHD
							  JOIN NHA_CUNG_CAP NCC ON HDN.MANCC = NCC.MANCC	
							  JOIN NGUYEN_LIEU NL ON NL.MANL = CT.MANL
WHERE SOLUONG > = ( SELECT  MAX(SOLUONG) AS [NL_MAX] FROM CHI_TIET_HOA_DON_NHAP )



-- 4B  SỐ MÓN ĂN CỦA TỪNG NGUYÊN LIỆU.
SELECT COUNT(A.TENSP) AS [SL_SP] ,A.MANL	, B.TENNL	
FROM CHI_TIET_SAN_PHAM A JOIN NGUYEN_LIEU  B ON A.MANL  = B.MANL
GROUP BY A.MANL, B.TENNL	


--5G (DELETE) XÓA MÓN ĂN ĐƯỢC CHẾ BIẾN TỪ NGUYỂN LIỆU CÓ MÃ LÀ NL03
ALTER TABLE CHI_TIET_HOA_DON
DROP CONSTRAINT FK_CHI_TIET_HOA_DON_SAN_PHAM;
ALTER TABLE SAN_PHAM
DROP CONSTRAINT FK_SAN_PHAM_CHI_TIET_SAN_PHAM;
--- CASCADE CHI_TIET_HOA_DON ĐẾN SAN_PHAM
ALTER TABLE CHI_TIET_HOA_DON
ADD CONSTRAINT FK_CHI_TIET_HOA_DON_SAN_PHAM
FOREIGN KEY (MSP) 
REFERENCES SAN_PHAM(MSP)
ON DELETE CASCADE;
--- CASCADE SAN_PHAM ĐẾN CHI_TIET_SAN_PHAM
ALTER TABLE SAN_PHAM
ADD CONSTRAINT FK_SAN_PHAM_CHI_TIET_SAN_PHAM
FOREIGN KEY (TENSP) 
REFERENCES CHI_TIET_SAN_PHAM(TENSP)
ON DELETE CASCADE;
--- DELETE
DELETE
FROM CHI_TIET_SAN_PHAM
WHERE MANL ='NL03'

-- 6E (CHƯA CÓ) HIỂN THỊ NHÂN VIÊN CHƯA LÀM CA ĐẶC BIỆT NÀO
SELECT MNV ,TENNV
FROM NHAN_VIEN
WHERE MNV NOT IN (
	SELECT DISTINCT MNV 
	FROM CHAM_CONG
	WHERE MALOAICA ='NL' )

--7E  (KHONG) HIỂN THỊ NHÀ CUNG CẤP KHÔNG CUNG CẤP NGUYÊN LIỆU NÀO VÀO NĂN 2021 
SELECT NCC.MANCC ,NCC.TENNCC 
FROM NHA_CUNG_CAP NCC JOIN HOA_DON_NHAP HDN ON NCC.MANCC = HDN.MANCC
WHERE NCC.MANCC NOT IN 
	(SELECT DISTINCT MANCC FROM HOA_DON_NHAP
	WHERE YEAR(NGAYTAO) = 2021)  

--=====================================================================================

-- DUY 

-- 1C NGUYÊN LIỆU CÓ ĐƠN GIÁ LỚN HƠN 60000
SELECT A.TENNL, A.DONGIA
FROM NGUYEN_LIEU A 
GROUP BY A.TENNL, A.DONGIA
HAVING MAX(A.DONGIA) > 60000

-- 2B CÓ BAO NHIÊU NHÂN VIÊN NỮ
SELECT COUNT(N.MNV)
FROM NHAN_VIEN N 
WHERE N.GIOITINH = N'NỮ'

-- 3G CẬP NHẬT MÃ NHÀ CUNG CẤP Ở HÀ NỘI
UPDATE NHA_CUNG_CAP
SET MANCC = '01-HN'
WHERE DIACHI = N'HÀ NỘI'
-- 4G XOÁ CÁC CA LÀM TRONG NGÀY 20/11
DELETE FROM CHAM_CONG 
WHERE MNV = '02' AND NGAY= '2021-20-11'

-- 5B TỔNG TIỀN NGUYÊN LIỆU NHẬP TÊN LÀ CÁ
SELECT SUM(NL.DONGIA * CTHDN.SOLUONG) AS "TONG TIEN"
FROM NGUYEN_LIEU NL, CHI_TIET_HOA_DON_NHAP CTHDN
WHERE NL.TENNL = N'CÁ' AND NL.MANL = CTHDN.MANL



--6C HIỂN THỊ THÔNG TIN NHÂN VIÊN ĐÃ PHỤC VỤ TRONG NGÀY 19/82021
SELECT KH.TENKH,NV.TENNV
FROM
    KHACH_HANG KH 
    LEFT JOIN HOA_DON HD ON KH.MKH = HD.MKH
    LEFT JOIN NHAN_VIEN NV ON HD.MNV = NV.MNV
    WHERE HD.NGAYTAO = '20210819'
--7E TỔNG THỜI GIAN LÀM VIỆC VỦA TỪNG NV THÁNG 2 NĂM 2021
SELECT A.TENNV, SUM(C.THOIGIAN) AS TG_LAMVIEC
FROM NHAN_VIEN A JOIN CHAM_CONG B ON A.MNV = B.MNV JOIN	 CA_LAM_VIEC C ON C.MACA = B.MACA
WHERE YEAR(B.NGAY)= 2021 AND MONTH(B.NGAY) = 2
GROUP  BY A.TENNV





--============================================================
--TRÍ

--1A TÊN MÓN ĂN CÓ NGUYÊN LIỆU TỪ NHÀ CUNG CẤP THỊT BÒ QUỐC CHÂU
 SELECT A.TENSP, A.DONGIA
 FROM SAN_PHAM A JOIN CHI_TIET_SAN_PHAM B ON A.TENSP = B.TENSP 
				JOIN NGUYEN_LIEU C ON C.MANL = B.MANL 
				JOIN CHI_TIET_HOA_DON_NHAP D ON D.MANL = B.MANL 
				JOIN HOA_DON_NHAP E ON E.MHD = D.MHD 
				JOIN NHA_CUNG_CAP F ON F.MANCC = E.MANCC
 WHERE F.TENNCC = N'TRẠI GÀ MINH TRÍ'

 --2B
 DELETE FROM SAN_PHAM
 WHERE TENSP NOT IN (SELECT TENSP
				FROM SAN_PHAM
				WHERE MSP  IN (SELECT DISTINCT MSP 
									FROM CHI_TIET_HOA_DON A
									JOIN HOA_DON B ON A.MHD = B.MHD
									WHERE YEAR(NGAYTAO) = 2022))


 --3C MÓN ĂN ĐƯỢC ĐẶT TỪ 2 ĐẾN 5 LẦN 
 SELECT C.TENSP, COUNT(C.MSP) AS SLG
FROM HOA_DON A
INNER JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD
INNER JOIN SAN_PHAM C ON B.MSP = C.MSP
GROUP BY C.TENSP, C.MSP
HAVING COUNT(C.MSP) BETWEEN 2 AND 4
--4E MÓN ĂN CHƯA ĐƯỢC ĐẶT TRONG NĂM 2021
SELECT TENSP,MSP
FROM SAN_PHAM
WHERE MSP  NOT IN (SELECT DISTINCT MSP 
				  FROM CHI_TIET_HOA_DON A
				  JOIN HOA_DON B ON A.MHD = B.MHD
				  WHERE YEAR(NGAYTAO) = 2021)


--5G XOÁ SẢN PHẦM ĐƯỢC ĐẶT ÍT HƠN 2 LẦN
DELETE FROM SAN_PHAM
WHERE  TENSP IN (SELECT C.TENSP
FROM HOA_DON A
INNER JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD
INNER JOIN SAN_PHAM C ON B.MSP = C.MSP
GROUP BY C.TENSP, C.MSP
HAVING COUNT(C.MSP) < 2 )

--6G TĂNG GIÁ 20% CÁ SẢN PHẨM CÓ NGUYÊN LIỆU TỪ TÔM
UPDATE SAN_PHAM
SET DONGIA *= 1
FROM SAN_PHAM A
JOIN CHI_TIET_SAN_PHAM B ON A.TENSP = B.TENSP
JOIN NGUYEN_LIEU C ON B.MANL = C.MANL
WHERE C.TENNL = N'TÔM';

-- 7E CHO BIẾT NHỮNG MẶT HÀNG ĐƯỢC BÁN VÀO THÁNG 1 NĂM 2020 NHƯNG KHÔNG ĐƯỢC BÁN VÀO THÁNG 2 NĂM 2020
(SELECT A.MSP, B.TENSP, CONVERT(VARCHAR,NGAYTAO,103) AS NGAYBAN
FROM CHI_TIET_HOA_DON A 
JOIN SAN_PHAM B  ON A.MSP = B.MSP  
JOIN HOA_DON C ON C.MHD = A.MHD 
WHERE  YEAR(C.NGAYTAO) = 2021 AND MONTH(C.NGAYTAO) = 1)

EXCEPT

(SELECT A.MSP, B.TENSP, CONVERT(VARCHAR,NGAYTAO,103)
FROM CHI_TIET_HOA_DON A 
JOIN SAN_PHAM B ON A.MSP = B.MSP
JOIN HOA_DON C ON C.MHD = A.MHD
WHERE YEAR(C.NGAYTAO) = 2021 AND MONTH(C.NGAYTAO) = 5)

--===================================================================

-- CHÂU 
-- CÂU 1 IN RA DANH SÁCH CÁC NGUYÊN LIỆU CÓ ĐƠN VỊ TÍNH LÀ KG VÀ ĐƠN GIÁ LỚN HƠN 70000 
SELECT *
FROM NGUYEN_LIEU
WHERE DVT='KG' AND DONGIA >70000


-- CÂU 2 TỔNG SỐ CA VÀ TỔNG SỐ TIỀN CỦA TỪNG CA (AGGREGATE FUNCTIONS)
SELECT A.MACA, COUNT(A.MALOAICA) AS SLCA, SUM(B.MUCTHUONG*C.GIATIEN) AS TIEN 
FROM CHAM_CONG A JOIN LOAI_CA B ON A.MALOAICA = B.MALOAICA
	JOIN CA_LAM_VIEC C ON A.MACA = C.MACA
GROUP BY A.MACA
 
-- CÂU 3 IN RA DANH SÁCH TỔNG NHÂN VIÊN NỮ CÓ CHỨC VỤ LÀ LỄ TÂN (AGGREGATE FUNCTIONS )
SELECT COUNT(MNV) AS SL
FROM NHAN_VIEN
WHERE GIOITINH=N'NỮ' AND CHUCVU=N'LỄ TÂN'
--- CÂU 4 TÌM NGUYÊN LIỆU CÓ ĐƠN GIÁ NHỎ NHẤT (NHỎ NHẤT)
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

--- CÂU 7 CẬP NHẬT CHỨC VỤ LÀ LỄ TÂN ĐỐI VỚI NHÂN VIÊN CHƯA LẬP HÓA ĐƠN NHẬP NÀO TỪ NHÀ CUNG CẤP (UPDATE)
UPDATE NHAN_VIEN
SET CHUCVU=N'LỄ TÂN'
WHERE NHAN_VIEN.TENNV =(
	SELECT NV.TENNV
	FROM NHAN_VIEN NV LEFT JOIN HOA_DON_NHAP HDN ON NV.MNV = HDN.MNV
	WHERE HDN.MNV IS NULL)



--=============================================== CÂU 4 ======================================
--===============================================FUNTION======================================
--1 TẠO FUNCTION TÍNH LƯƠNG CỦA NHÂN VIÊN THEO THAM SỐ MÃ NHÂN VIÊN
--1B DỮ LIỆU TRẢ VỀ LÀ MỘT BẢNG
GO
CREATE FUNCTION F_TINH_LUONG2
(@MNV VARCHAR(5))
RETURNS @TIEN_LUONG TABLE ( MNV VARCHAR(5), 
							LUONG DECIMAL(10))
AS 
BEGIN 
	IF @MNV = 0
		INSERT INTO @TIEN_LUONG
		SELECT CC.MNV, SUM(LC.MUCTHUONG*CLV.GIATIEN) AS LUONG
		FROM CHAM_CONG CC JOIN LOAI_CA LC ON CC.MALOAICA = LC.MALOAICA
		JOIN CA_LAM_VIEC CLV ON CC.MACA = CLV.MACA
		GROUP BY CC.MNV 
	ELSE
		INSERT INTO @TIEN_LUONG
		SELECT CC.MNV, SUM(LC.MUCTHUONG*CLV.GIATIEN) AS LUONG
		FROM CHAM_CONG CC JOIN LOAI_CA LC ON CC.MALOAICA = LC.MALOAICA
			JOIN CA_LAM_VIEC CLV ON CC.MACA = CLV.MACA
		WHERE CC.MNV = @MNV
		GROUP BY CC.MNV 
	RETURN 
END
--THỰC THI F_TINH_LUONG2
--TÍNH LƯƠNG NHÂN VIÊN CÓ MÁ NHÂN VIÊN LÀ 0X
GO
SELECT * FROM DBO.F_TINH_LUONG2('06')
--TÍNH LƯƠNG TẤC CẢ NHÂN VIÊN
GO
SELECT * FROM DBO.F_TINH_LUONG2('0')

-- 2 TẠO HÀM TÍNH TUỔI CỦA TỪNG NHÂN VIÊN (KIỂU GIÁ TRỊ TRẢ VỀ LÀ 1 GIÁ TRỊ)
GO
CREATE FUNCTION F_TUOI_NHANVIEN(@DATE DATE)
RETURNS SMALLINT
AS
BEGIN 
	DECLARE @TUOINV SMALLINT
	SELECT @TUOINV = (YEAR(GETDATE()) - DATEPART(YEAR,@DATE) )
	RETURN (@TUOINV)
END

SELECT TENNV ,DBO.F_TUOI_NHANVIEN(NGAYSINH) AS TUOI
FROM NHAN_VIEN



--3 THÔNG TIN CA LÀM VIỆC CỦA NHÂN VIÊN CÓ MÃ NHÂN VIÊN LÀ THAM SỐ ĐÂU VÀO
DROP FUNCTION F_CA_LAM_VIEC
GO
CREATE FUNCTION F_CA_LAM_VIEC ( @MANV VARCHAR(5),
								@NGAY DATETIME )
RETURNS @TABLENAME TABLE
(
	MANV VARCHAR(5),
	TENNV NVARCHAR(50),
	NGAY DATE,
	TENCA NVARCHAR (10)
	
)
AS
BEGIN
	INSERT INTO @TABLENAME
	SELECT A.MNV, A.TENNV, B.NGAY , C.TENCA
	FROM NHAN_VIEN A
	JOIN CHAM_CONG B ON A.MNV = B.MNV
	JOIN CA_LAM_VIEC C ON B.MACA = C.MACA
	JOIN LOAI_CA D ON D.MALOAICA = B.MALOAICA
	WHERE A.MNV = @MANV AND B.NGAY = @NGAY
	RETURN 
END
GO
-- IN THÊM TRƯỜNG LOẠI CA
GO
SELECT * FROM F_CA_LAM_VIEC('01','20210101')
--================================ TRIGGER======================================
-- 1 KIỂM TRA TÍNH HỢP LỆ CỦA MÃ CA VÀ SỐ THỨ TỰ CA KHI THÊM DỮU LIỆU BẢNG DÒNG CHẤM CÔNG
INSERT CHAM_CONG VALUES('06','4-3-2020',1,'K1','NL')

IF EXISTS ( SELECT NAME 
			FROM SYSOBJECTS
			WHERE NAME  = 'TR_CHAMCONG' AND TYPE = 'TR')
DROP TRIGGER TR_CHAMCONG

GO
CREATE TRIGGER TR_CHAMCONG ON CHAM_CONG
FOR INSERT,UPDATE 
AS
BEGIN
	DECLARE @D SMALLINT 
	SET @D = (SELECT B.CA FROM INSERTED B )
	DECLARE @C VARCHAR(2) 
	SET @C = (SELECT B.MACA FROM   INSERTED B )

	IF (@D < 4 AND @D > 0)
		BEGIN
			IF (@D = 1 AND  @C !='K1' )
			BEGIN
				PRINT N'SỐ THỨ TỰ CA VÀ MÃ CA KHÔNG HỢP LỆ' 
				ROLLBACK TRAN
					RETURN
			END
			IF (@D = 2 AND  @C !='K2' )
			BEGIN
				PRINT N'SỐ THỨ TỰ CA VÀ MÃ CA KHÔNG HỢP LỆ' 
				ROLLBACK TRAN
					RETURN
			END
			IF (@D = 3 AND  @C !='K3' )
			BEGIN
				PRINT N'SỐ THỨ TỰ CA VÀ MÃ CA KHÔNG HỢP LỆ' 
			ROLLBACK TRAN
					RETURN
			END
			ELSE
				PRINT N'ĐÃ THÊM THÀNH CÔNG'
				RETURN
		END
	ELSE
		PRINT N'SỐ THỨ TỰ CA KHÔNG HỢP LÊ  ( 1 -> 3)'
		ROLLBACK TRAN
		RETURN
END

INSERT CHAM_CONG VALUES('06','5-5-2020',5,'K3','NN')

SELECT * FROM CHAM_CONG
DELETE FROM CHAM_CONG WHERE MNV = '06'

--2 KIỂM TRA, UPDATE SỐ LƯỢNG SẢN PHẨM ĐẶT SO VỚI SỐ LƯỢNG HIỆN CÓ
DROP TRIGGER IF EXISTS DBO.TR_CAPNHAT_SL_SANPHAM;
CREATE TRIGGER TR_CAPNHAT_SL_SANPHAM ON CHI_TIET_HOA_DON
FOR INSERT
AS
	DECLARE @SL SMALLINT
	DECLARE @SL1 SMALLINT
	SELECT @SL = B.SOLUONG FROM CHI_TIET_HOA_DON A, INSERTED B WHERE A.MSP = B.MSP AND A.MHD = B.MHD
	SELECT @SL1 = C.SOLUONG FROM CHI_TIET_HOA_DON A, INSERTED B , SAN_PHAM C WHERE A.MSP = B.MSP AND A.MHD = B.MHD AND C.MSP = A.MSP
	IF (@SL > @SL1)
		BEGIN
			PRINT 'KHONG DAT DUOC, VUOT QUA SO LUONG HANG'
			ROLLBACK TRAN
		END
	UPDATE SAN_PHAM SET SAN_PHAM.SOLUONG = SAN_PHAM.SOLUONG - INSERTED.SOLUONG
	FROM INSERTED WHERE SAN_PHAM.MSP = INSERTED.MSP 



--3 CẬP NHẬT LẠI SỐ LƯỢNG SẢN PHẨM KHI CHỈNH SỬA SỐ LƯỢNG TRONG CHI TIẾT HÓA ĐƠN
DROP TRIGGER IF EXISTS DBO.TR_EDITSL_UPDATESLSP;
CREATE TRIGGER TR_EDITSL_UPDATESLSP ON CHI_TIET_HOA_DON
FOR UPDATE
AS
BEGIN 
	DECLARE @SL SMALLINT
	DECLARE @SL1 SMALLINT
	DECLARE @SL2 SMALLINT
	DECLARE @SLTONG SMALLINT
	SELECT @SL2 = C.SOLUONG FROM CHI_TIET_HOA_DON A, INSERTED B , SAN_PHAM C WHERE A.MSP = B.MSP AND A.MHD = B.MHD AND C.MSP = A.MSP
	SELECT @SL = A.SOLUONG FROM DELETED A, INSERTED B WHERE A.MSP = B.MSP AND A.MHD = B.MHD
	SELECT @SL1 = B.SOLUONG FROM DELETED A, INSERTED B WHERE A.MSP = B.MSP AND A.MHD = B.MHD
	IF (@SL < @SL1) -- KHI TĂNG SỐ LƯỢNG LÊN
		BEGIN 
			SET @SLTONG = @SL1 - @SL
			IF (@SLTONG <= @SL2)
				BEGIN
					UPDATE SAN_PHAM SET SAN_PHAM.SOLUONG = A.SOLUONG - (@SL1 - @SL)
					FROM CHI_TIET_HOA_DON B, INSERTED C  ,SAN_PHAM A
					WHERE B.MSP = C.MSP AND A.MSP = B.MSP
				END 
			ELSE 
				BEGIN
					PRINT 'KHONG DAT DUOC, VUOT QUA SO LUONG HANG'
					ROLLBACK TRAN
				END 
		END
	IF (@SL > @SL1) -- KHI GIẢM SỐ LƯỢNG
		BEGIN 
			UPDATE SAN_PHAM SET SAN_PHAM.SOLUONG = A.SOLUONG + (@SL - @SL1)
			FROM CHI_TIET_HOA_DON B, INSERTED C  ,SAN_PHAM A
			WHERE B.MSP = C.MSP AND A.MSP = B.MSP
		END
END


-- 4 CẬP NHẬT CHI TIẾT SẢN PHẨM KHI XOÁ 1 CHI TIẾT HOÁ ĐƠN
CREATE TRIGGER TR_XOACTHD_UPDATESLSP ON CHI_TIET_HOA_DON
FOR DELETE
AS
UPDATE SAN_PHAM SET SAN_PHAM.SOLUONG = SAN_PHAM.SOLUONG + KQ.SL
FROM (SELECT MSP,SUM(SOLUONG) AS SL
	FROM DELETED
	GROUP BY MSP) KQ WHERE SAN_PHAM.MSP = KQ.MSP
-- ===============================PROC==========================================
--1 
CREATE PROC SP_NGUYENLIEU_INSERT
(	@MANL VARCHAR(10),
	@TENNL NVARCHAR(50),
	@NGAYNHAP DATE,
	@DONGIA FLOAT,
	@DVT NVARCHAR(15)
)
AS
BEGIN
	IF @MANL NOT IN (SELECT MANL FROM NGUYEN_LIEU)
		INSERT INTO NGUYEN_LIEU (MANL,TENNL,NGAYNHAP,DONGIA,DVT)
		VALUES(@MANL,@TENNL,@NGAYNHAP,@DONGIA,@DVT)
	ELSE
		PRINT N'KHÔNG THỂ NHẬP ĐƯỢC VÌ TRÙNG KHÓA CHÍNH MÃ NGUYÊN LIỆU! '
END
EXEC SP_NGUYENLIEU_INSERT 'NL08',N'NƯỚC UỐNG','07/12/2021',50000,N'THÙNG'

-- 2 HIỂN THỊ THÔNG TIN DANH SÁCH HOÁ ĐƠN CỦA KHÁCH HÀNG
CREATE PROC SP_DS_HOADON_PRINT
AS
BEGIN
	SELECT A.MHD N'MÃ HOÁ ĐƠN',E.TENNV N'NGƯỜI TẠO',CONVERT(DATE,A.NGAYTAO,103) AS N'NGÀY TẠO',D.TENKH AS N'KHÁCH HÀNG', SUM(B.SOLUONG * C.DONGIA) AS N'THÀNH TIỀN'
	FROM HOA_DON A  JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD 
				JOIN SAN_PHAM C ON B.MSP = C.MSP 
				JOIN KHACH_HANG D ON D.MKH = A.MKH
				JOIN NHAN_VIEN E ON E.MNV = A.MNV
	GROUP BY A.MHD ,D.TENKH,E.TENNV,A.NGAYTAO
END

EXEC SP_DS_HOADON_PRINT
-- 3 
CREATE PROC SP_KHACH_HANG (@MAKH VARCHAR(5))
AS
BEGIN
DECLARE @TIEN FLOAT
IF NOT EXISTS (SELECT * FROM KHACH_HANG WHERE MKH = @MAKH )
BEGIN
	PRINT N'KHÁCH HÀNG NÀY KHÔNG TỒN TẠI'
	RETURN -1
END

ELSE
BEGIN
	
	SELECT @TIEN = (SELECT SUM(B.SOLUONG*C.DONGIA)
					FROM HOA_DON A  JOIN CHI_TIET_HOA_DON B ON A.MHD = B.MHD 
									JOIN SAN_PHAM C ON C.MSP = B.MSP 
									JOIN KHACH_HANG D ON D.MKH  =A.MKH
					WHERE A.MKH =@MAKH
					GROUP BY D.MKH)
	IF (@TIEN IS NULL )
		PRINT N'KHÁCH HÀNG NÀY CHƯA ĐẶT HÀNG'

	IF ( @TIEN >= 200000)
		BEGIN
			SELECT DISTINCT A.MKH AS N'MÃ KHÁCH HÀNG' , A.TENKH AS N'TÊN KHÁCH HÀNG', @TIEN AS N'TIỀN', N'KHÁCH HÀNG VIP' AS N'THÔNG BÁO'
			FROM KHACH_HANG A
				JOIN HOA_DON B ON A.MKH = B.MKH
				JOIN CHI_TIET_HOA_DON C ON B.MHD = C.MHD
				JOIN SAN_PHAM D ON D.MSP = C.MSP
			WHERE @MAKH = A.MKH
			
		END

	IF ( @TIEN < 200000)
		BEGIN
			SELECT DISTINCT A.MKH AS N'MÃ KHÁCH HÀNG', A.TENKH AS N'TÊN KHÁCH HÀNG', @TIEN AS N'TIỀN', N'CHƯA ĐỦ ĐIỂU KIỆN' AS N'THÔNG BÁO' 
			FROM KHACH_HANG A
				JOIN HOA_DON B ON A.MKH = B.MKH
				JOIN CHI_TIET_HOA_DON C ON B.MHD = C.MHD
				JOIN SAN_PHAM D ON D.MSP = C.MSP
			WHERE @MAKH = A.MKH
			
		END

END
END
GO

EXEC SP_KHACH_HANG KH3

--- THỐNG KÊ SỐ LƯỢNG BÁN VÀ CÒN LẠI CỦA SẢN PHẨM
DROP FUNCTION FC_REPORT_CTHOADON_SANPHAM
CREATE FUNCTION FC_REPORT_CTHOADON_SANPHAM()
RETURNS TABLE
AS
RETURN 
(
	SELECT KQ.MSP , KQ.TENSP, KQ.SOLUONG , ISNULL(SL_BAN, 0) AS SL_DA_BAN , ISNULL(SL_CONLAI,SOLUONG)  AS SL_CON_LAI 
	FROM (
		SELECT B.MSP , B.TENSP, B.SOLUONG , SUM(A.SL) AS SL_BAN  ,  (B.SOLUONG - A.SL ) AS SL_CONLAI
		FROM (SELECT MSP, SUM(SOLUONG) AS SL FROM CHI_TIET_HOA_DON GROUP BY MSP ) A RIGHT JOIN SAN_PHAM B ON A.MSP = B.MSP 
		GROUP BY  B.MSP , B.TENSP,B.SOLUONG, (B.SOLUONG - A.SL )) KQ
)
SELECT *
FROM FC_REPORT_CTHOADON_SANPHAM()


--============================================ TẠO USER========================================================

-- CÂU 5 
CREATE LOGIN CHAU WITH PASSWORD='CHAU'
CREATE LOGIN TRI WITH PASSWORD='TRI'
CREATE LOGIN DUY WITH PASSWORD='DUY'

CREATE USER CHAU FOR LOGIN CHAU
CREATE USER TRI FOR LOGIN TRI
CREATE USER DUY FOR LOGIN DUY


GRANT SELECT,INSERT, UPDATE ON NGUYEN_LIEU TO TRI
GRANT SELECT,INSERT  ON CHAM_CONG TO DUY
GRANT SELECT ON KHACH_HANG TO CHAU
