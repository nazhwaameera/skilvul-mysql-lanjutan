-- Show Database --
SHOW DATABASES;

-- Create Database --
CREATE DATABASE skilvulbookstore;

-- USE Database --
USE skilvulbookstore;

-- Create Table --
CREATE TABLE penerbit(
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nama VARCHAR(50) NULL,
	kota VARCHAR(50) NULL
);

CREATE TABLE penulis(
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nama VARCHAR(50) NULL,
	kota VARCHAR(50) NULL
);

CREATE TABLE buku(
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ISBN VARCHAR(50) NULL,
	judul VARCHAR(50) NULL,
	penulis VARCHAR(50) NULL,
	penerbit INT(10) NULL,
	harga INT(10) NULL,
	stock INT(10) NULL,
	id_penulis INT(10) NULL,
	CONSTRAINT fk_penerbit
	FOREIGN KEY(penerbit)
		REFERENCES penulis(id)
		ON UPDATE SET NULL
		ON DELETE SET NULL,
	CONSTRAINT fk_penulis
	FOREIGN KEY(id_penulis)
		REFERENCES penulis(id)
		ON UPDATE SET NULL
		ON DELETE SET NULL
);

-- Insert Data --
INSERT INTO 
	penerbit(nama, kota) 
VALUES 
	('Penerbit A', 'Malang'),
	('Penerbit B', 'Surabaya'),
	('Penerbit C', 'Jakarta'),
	('Penerbit D', 'Yogyakarta'),
	('Penerbit E', 'Medan')
;

INSERT INTO 
	penulis(nama, kota) 
VALUES 
	('Nazhwa Ameera', 'Malang'),
	('Rosa Amalia', 'Surabaya'),
	('Zahrotul Adillah', 'Jakarta'),
	('Nurul Izzatil', 'Yogyakarta'),
	('Zulfia Sari', 'Medan')
;

INSERT INTO 
	buku(judul, penerbit, id_penulis, harga, stock) 
VALUES 
	('Keseharian Mahasiswa Rantau', 1, 1, 75000, 5),
	('Aku vs bahasa Jawa', 2, 2, 90000, 5),
	('Enaknya Masakan Emak', 3, 3, 60000, 5),
	('Bismillah Bisa!', 1, 4, 85000, 5),
	('Unknown', 3, 5, 45000, 5)
;

-- Join --
-- 1 INNER JOIN --
SELECT B.buku, B.id, B.penerbit, P.nama 
FROM buku B 
INNER JOIN penerbit P ON B.penerbit = P.id;

-- 2 LEFT JOIN --
SELECT B.buku, B.id, B.penerbit, P.nama 
FROM buku B 
LEFT JOIN penerbit P ON B.penerbit = P.id;

-- 3 RIGHT JOIN --
SELECT B.buku, B.id, B.penerbit, P.nama 
FROM buku B 
RIGHT JOIN penerbit P ON B.penerbit = P.id;

-- Query --
--4 MAX harga buku stok di bawah 10
SELECT judul, penerbit, id_penulis, MAX(harga), stock
FROM buku
WHERE stock < 10;

--5 MIN harga
SELECT judul, penerbit, id_penulis, MIN(harga), stock
FROM buku;

--6 COUNT buku di bawah 100k
SELECT COUNT(*)
FROM buku
WHERE harga < 100000;