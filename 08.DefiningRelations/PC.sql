CREATE DATABASE PC

USE PC

/*a)*/
CREATE TABLE Product(
	maker CHAR,
	model CHAR(4),
	typeOfPc VARCHAR(7)
);

CREATE TABLE Printer(
	code INT,
	model CHAR(4),
	price DECIMAL(5, 2)
);

/*á)*/
INSERT INTO Product
VALUES('A', '1256', 'PC');

INSERT INTO Printer
VALUES(1, '1401', 150);

ALTER TABLE Printer
ADD type VARCHAR(6), color CHAR;

/*â)*/
ALTER TABLE Printer
ADD type VARCHAR(6), color CHAR;
/*ã)*/
ALTER TABLE Printer
DROP COLUMN price;
/*ä)*/
DROP TABLE Printer;

DROP TABLE Product;
