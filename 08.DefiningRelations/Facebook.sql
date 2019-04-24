CREATE DATABASE Facebook

USE Facebook

/*a)*/
CREATE TABLE Users(
	id INT IDENTITY,
	email VARCHAR(60),
	password VARCHAR(15),
	registration_date DATE
);

CREATE TABLE Friends(
	friend_1 INT,
	friend_2 INT
);

CREATE TABLE Walls(
	user_number INT,
	user_number_sender INT,
	message VARCHAR(250),
	date DATETIME
);

CREATE TABLE Groups(
	groupId INT IDENTITY,
	name VARCHAR(50),
	description VARCHAR(250)
);

CREATE TABLE GroupMembers(
	group_number INT,
	user_number INT
);

/*á)*/
INSERT INTO Users
VALUES(1, 'myEmail@abv.bg', 'superSecret','19-04-23');

INSERT INTO Users
VALUES(2, 'myFriendEmail@abv.bg', 'superSecret','19-02-24')

INSERT INTO Friends
VALUES(12, 21);

INSERT INTO Walls
VALUES(1, 2, 'Hi');

INSERT INTO Groups
VALUES(12, '12v', 'class in school');

INSERT INTO GroupMembers
VALUES(12, 1);