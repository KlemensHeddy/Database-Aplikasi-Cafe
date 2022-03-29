
CREATE DATABASE CafeTong_Tong
ON PRIMARY
(NAME='CafeTong_Tong', FILENAME='D:\Database Cafe Tong Tong\CafeTong_Tong.mdf', SIZE=5MB, MAXSIZE=15MB, FILEGROWTH=10%)
LOG ON
(NAME='CafeTong_Tong_Log', FILENAME='D:\Database Cafe Tong Tong\CafeTong_Tong_Log.ldf', SIZE=5MB, MAXSIZE=15MB, FILEGROWTH=10%);

-- Tabel Mater 
USE CafeTong_Tong;
CREATE TABLE Masuk
(
	EmployeeID CHAR(8) NOT NULL PRIMARY KEY,
	Pass VARCHAR(50) NOT NULL,
);

CREATE TABLE Karyawan
(
	EmployeeID CHAR(8) NOT NULL PRIMARY KEY,
	NamaKaryawan VARCHAR(50) NOT NULL,
	FotoProfil VARBINARY (MAX) NOT NULL,
	JenisKelamin VARCHAR(20) NOT NULL,
	Alamat Varchar (20) NOT NULL,
	NoHp NUMERIC NULL,
);
ALTER TABLE Karyawan
ADD CONSTRAINT DK FOREIGN KEY(EmployeeID) REFERENCES Masuk(EmployeeID);

CREATE TABLE DaftarMember
(
	IDCustumer NUMERIC NOT NULL PRIMARY KEY,
	NamaCustumer VARCHAR(50) NOT NULL,	
	JenisKelamin VARCHAR(20) NOT NULL,
	TanggalDaftar DATE NOT NULL,
	Alamat VARCHAR(50) NOT NULL,
);

CREATE TABLE DataMeja
(
	IDMeja NUMERIC NOT NULL PRIMARY KEY,
	TipeMeja VARCHAR(20) NOT NULL,
	Tarif INT NOT NULL,
);

CREATE TABLE DataMenu
(
	IDMenu NUMERIC NOT NULL PRIMARY KEY,
	Menu VARCHAR(50) NOT NULL,
	GambarMenu VARBINARY (MAX) NOT NULL,
	Price INT NOT NULL,
);

CREATE TABLE Transaksi
(
	IDTransaksi NUMERIC NOT NULL PRIMARY KEY,
	IDMenu NUMERIC NOT NULL,
	Menu VARCHAR(50) NOT NULL,
	Price INT NOT NULL,
	Jumlah INT NULL,
	IDCustumer NUMERIC NULL,
	NamaCustumer VARCHAR(50) NOT NULL,	
	TanggalOrder DATE NOT NULL,
	Catatan VARCHAR(50) NULL,
	IDMeja CHAR(3) NOT NULL,
	TipeMeja VARCHAR(20) NOT NULL,
	StatusMeja VARCHAR(20) NOT NULL,
)

CREATE TABLE Reservasi
(
	KodeBooking NUMERIC NOT NULL PRIMARY KEY,
	IDMeja NUMERIC NOT NULL,
	TipeMeja VARCHAR(20) NOT NULL,
	Tarif INT NOT NULL,
	Statusmeja VARCHAR(20) NOT NULL,
	IDCustumer NUMERIC NULL,
	NamaCustumer VARCHAR(50) NOT NULL,
	TanggalBooking DATE NOT NULL,
	Catatan VARCHAR(50) NULL,
)

INSERT INTO Karyawan VALUES ('11223344','Klemens',(SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\CafeTongTong\Icon\boy.png', SINGLE_BLOB) IMAGE), 'Laki-Laki','Jalan Sumatera No.70',082211334455),('44332211','Hanabi',(SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\CafeTongTong\Icon\girl.png', SINGLE_BLOB) IMAGE), 'Perempuan','Jalan Thamrin No.12', 081266887564),('44223311','Milea',(SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\CafeTongTong\Icon\girl.png', SINGLE_BLOB) IMAGE), 'Perempuan','Jalan Wahidin No. 12', 085378990077);

INSERT INTO Masuk VALUES('11223344','Karyawan1'),('44332211','Karyawan2'), ('44223311','Karyawan3');

INSERT INTO DataMeja VALUES('1', 'Standar', '200000'), ('2', 'Standar', '200000'), ('3', 'Standar', '200000'), ('4', 'Standar', '200000'),('5', 'Standar', '200000'), ('6', 'VIP', '400000'), ('7', 'VIP', '400000'), ('8', 'VIP', '400000'), ('9', 'VIP', '400000'), ('10', 'VIP', '400000');

INSERT INTO DataMenu VALUES ('1', 'Ice Blend Coffee Bean', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\Ice Blend Coffee Bean.jpg', SINGLE_BLOB) IMAGE), 25000),
('2', 'Flavoured Soda', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\flavoured Soda.jpg', SINGLE_BLOB) IMAGE), 20000), 
('3', 'Fruit Juice', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\fruit juice.jpg', SINGLE_BLOB) IMAGE), 22000),
('4', 'Fruit Tea', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\fruit tea.jpg', SINGLE_BLOB) IMAGE), 15000), 
('5', 'Ice Drink', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\Ice Drink.jpg', SINGLE_BLOB) IMAGE), 12000), 
('6', 'Milk Shake', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\Milk Shake.jpg', SINGLE_BLOB) IMAGE), 23000), 
('7', 'milk tea', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\milk tea.jpg', SINGLE_BLOB) IMAGE), 18000), 
('8', 'Hot Tea', (SELECT Bulkcolumn FROM OPENROWSET (BULK N'D:\Flat Icon\hot tea.jpg', SINGLE_BLOB) IMAGE), 12000);