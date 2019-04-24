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

/*�)*/
INSERT INTO Product
VALUES('A', '1256', 'PC');

INSERT INTO Printer
VALUES(1, '1401', 150);

ALTER TABLE Printer
ADD type VARCHAR(6), color CHAR;

/*�)*/
ALTER TABLE Printer
ADD type VARCHAR(6), color CHAR(1);
/*�)*/
ALTER TABLE Printer
DROP COLUMN price;
/*�)*/
DROP TABLE Printer;

DROP TABLE Product;