/*1*/
ALTER TABLE Flight
ADD num_pass INT;

/*2*/
ALTER TABLE Agency
ADD num_book INT;

/*3*/
CREATE TRIGGER tr_insert_res 
ON Booking
AFTER INSERT 
AS
 UPDATE Flight
 SET num_pass = num_pass + 1
 UPDATE Agency
 SET num_book = num_book + 1;

/*4*/
 CREATE TRIGGER tr_del_res 
 ON Booking
 AFTER DELETE
 AS
  UPDATE Flight
  SET num_pass = num_pass - 1
  UPDATE Agency
  SET num_book = num_book - 1

/*5*/
CREATE TRIGGER tr_update_res 
ON Booking
AFTER UPDATE
AS
 UPDATE Flight
 SET num_pass = num_pass - 1
 WHERE fnumber IN(SELECT flight_number
					 FROM deleted);
 UPDATE Flight
 SET num_pass = num_pass + 1
 WHERE fnumber IN(SELECT flight_number
				  FROM inserted);
 UPDATE Agency
 SET num_book = num_book - 1
 WHERE NAME IN(SELECT agency
			   FROM deleted);
 UPDATE Agency
 SET num_book = num_book + 1
 WHERE name IN (SELECT agency
			    FROM inserted);