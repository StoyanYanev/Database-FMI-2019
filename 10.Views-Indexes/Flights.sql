/*1*/
CREATE VIEW v_flight
AS
 SELECT Airline.name, flight_number, COUNT(customer_id) AS PASSENGERS
 FROM Airline 
 JOIN Booking ON Airline.code = airline_code
 WHERE STATUS = 1
 GROUP BY Airline.name, flight_number;

 /*2*/
 CREATE VIEW v_agency
AS
 SELECT Customer.fname
 FROM Customer 
 JOIN Booking ON id = customer_id
 GROUP BY agency, Customer.fname
 HAVING COUNT(customer_id) >= ALL(SELECT COUNT(customer_id)
								  FROM Customer 
								  JOIN Booking ON id = customer_id
								  GROUP BY agency, Customer.fname);

/*3*/
CREATE VIEW v_SF_Agencies
AS
 SELECT *
 FROM Agency
 WHERE city = 'Sofia'
WITH CHECK OPTION;

/*4*/
CREATE VIEW v_SF_PH_Agencies
AS
 SELECT *
 FROM Agency
 WHERE phone IS NULL
WITH CHECK OPTION;

/*5*/
INSERT INTO v_SF_Agencies
VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');
INSERT INTO v_SF_PH_Agencies
VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);
INSERT INTO v_SF_Agencies
VALUES('T3 Tour', 'Bulgaria', 'Varna','+359');
INSERT INTO v_SF_PH_Agencies
VALUES('T4 Tour', 'Bulgaria', 'Varna',null);
INSERT INTO v_SF_PH_Agencies
VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359');