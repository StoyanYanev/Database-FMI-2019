CREATE DATABASE Flights

USE Flights

CREATE TABLE Airline(
	code CHAR(2),
	name VARCHAR(30),
	country VARCHAR(30),
	PRIMARY KEY(code),
	CONSTRAINT uq_name UNIQUE(name)
);

CREATE TABLE Airplane(
	code INT,
	type VARCHAR(40),
	seats INT NOT NULL,
	year DATETIME,
	PRIMARY KEY(code)
);

CREATE TABLE Agency(
	name VARCHAR(50),
	country VARCHAR(30),
	city VARCHAR(30),
	phone VARCHAR(12),
	PRIMARY KEY(name)
);

CREATE TABLE Customer(
	id INT,
	fname VARCHAR(15),
	lname VARCHAR(15),
	email VARCHAR(40),
	PRIMARY KEY(id)
);

CREATE TABLE Airport(
	code CHAR(3),
	name VARCHAR(50),
	country VARCHAR(50),
	city VARCHAR(50),
	PRIMARY KEY(code),
	CONSTRAINT uq_airport_name UNIQUE(name)
);

CREATE TABLE Flight(
	fnumber CHAR(6),
	airline_operator CHAR(2),
	dep_airport CHAR(3),
	arr_airport CHAR(3),
	flight_time DATETIME,
	flight_duration INT NOT NULL,
	airplane INT NOT NULL,
	PRIMARY KEY(fnumber),
	FOREIGN KEY(airline_operator) REFERENCES Airline(code),
	FOREIGN KEY(airplane) REFERENCES Airplane(code),
	FOREIGN KEY(arr_airport) REFERENCES Airport(code),
	FOREIGN KEY(dep_airport) REFERENCES Airport(code)
);

CREATE TABLE Booking(
	code CHAR(6),
	agency VARCHAR(50),
	airline_code CHAR(2),
	flight_number CHAR(6),
	customer_id INT NOT NULL,
	booking_date DATETIME,
	flight_date DATETIME,
	price INT NOT NULL,
	status INT NOT NULL,
	PRIMARY KEY(flight_number),
	FOREIGN KEY(airline_code) REFERENCES Airline(code),
	FOREIGN KEY(agency) REFERENCES Agency(name),
	FOREIGN KEY(flight_number) REFERENCES Flight(fnumber),
	FOREIGN KEY(customer_id) REFERENCES Customer(id)
);

ALTER TABLE Airplane
ADD CONSTRAINT ck_seat
CHECK (seats > 0);

ALTER TABLE Booking
ADD CONSTRAINT ck_date
CHECK (flight_date >= booking_date);

ALTER TABLE Customer
ADD CONSTRAINT ck_email
CHECK (email LIKE '%@%.%');

ALTER TABLE Booking
ADD CONSTRAINT ck_status
CHECK (status IN('0','1'));