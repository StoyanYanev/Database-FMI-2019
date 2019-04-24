CREATE DATABASE PC

USE PC

/*a)*/
CREATE TABLE Product(
	maker VARCHAR(1),
	model VARCHAR(4),
	typeOfPc VARCHAR(7)
);

CREATE TABLE Printer(
	code INT,
	model VARCHAR(4),
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
ADD type VARCHAR(6), color CHAR(1);
/*ã)*/
ALTER TABLE Printer
DROP COLUMN price;
/*ä)*/
DROP TABLE Printer;

DROP TABLE Product;