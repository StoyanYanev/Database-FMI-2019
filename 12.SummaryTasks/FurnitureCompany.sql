/*1*/
CREATE DATABASE FurnitureCompany

USE FurnitureCompany

CREATE TABLE Customer(
Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
Customer_Name VARCHAR(50),
Customer_Address VARCHAR(50),
Customer_City VARCHAR(30),
City_Code INT
);

CREATE TABLE Product(
Product_ID INT PRIMARY KEY,
Product_Description VARCHAR(50),
Product_Finish VARCHAR(50),
Standard_Price INT,
Product_Line_ID INT
);

CREATE TABLE Order_T(
Order_ID INT PRIMARY KEY,
Order_Date DATE,
Customer_ID INT
);

CREATE TABLE Order_Line(
Order_ID INT,
Product_ID INT,
Order_Quantity INT 
);

ALTER TABLE Order_T
ADD CONSTRAINT cust_id FOREIGN KEY(Customer_ID)
REFERENCES Customer(Customer_ID);

ALTER TABLE Order_Line
ADD CONSTRAINT ord_id FOREIGN KEY(Order_ID)
REFERENCES Order_T(Order_ID);

ALTER TABLE Order_Line
ADD CONSTRAINT prod_id FOREIGN KEY(Product_ID)
REFERENCES Product(Product_ID);

ALTER TABLE Product
ADD CONSTRAINT prod_finish
CHECK (Product_Finish IN('череша', 'естествен ясен', 'бял ясен', 'червен дъб', 'естествен дъб', 'орех'));

insert into Customer values 
('Иван Петров', 'ул. Лавеле 8', 'София', '1000'), 
('Камелия Янева', 'ул. Иван Шишман 3', 'Бургас', '8000'), 
('Васил Димитров', 'ул. Абаджийска 87', 'Пловдив', '4000'),
('Ани Милева', 'бул. Владислав Варненчик 56', 'Варна','9000'); 
 
insert into Product values 
(1000, 'офис бюро', 'череша', 195, 10), 
(1001, 'директорско бюро', 'червен дъб', 250, 10), 
(2000, 'офис стол', 'череша', 75, 20), 
(2001, 'директорски стол', 'естествен дъб', 129, 20), 
(3000, 'етажерка за книги', 'естествен ясен', 85, 30), 
(4000, 'настолна лампа', 'естествен ясен', 35, 40); 
 
insert into Order_T values 
(100, '2013-01-05', 1), 
(101, '2013-12-07', 2), 
(102, '2014-10-03', 3), 
(103, '2014-10-08', 2), 
(104, '2015-10-05', 1), 
(105, '2015-10-05', 4), 
(106, '2015-10-06', 2), 
(107, '2016-01-06', 1); 

insert into Order_Line values 
(100, 4000, 1), 
(101, 1000, 2), 
(101, 2000, 2), 
(102, 3000, 1), 
(102, 2000, 1), 
(106, 4000, 1), 
(103, 4000, 1), 
(104, 4000, 1), 
(105, 4000, 1), 
(107, 4000, 1); 

/*2*/
SELECT Product.Product_ID, Product.Product_Description, COUNT(ORDER_ID) AS TimesOrdered
FROM Product JOIN Order_Line ON Product.Product_ID = Order_Line.Product_ID
GROUP BY Product.Product_ID, Product.Product_Description;

/*3*/
SELECT product.Product_ID, Product_Description, COUNT(Order_Quantity) AS Total_Quantity_Ordered
FROM  Product LEFT JOIN Order_Line ON Product.Product_ID = Order_Line.Product_ID
GROUP BY Product.Product_ID,Product.Product_Description;

/*4*/
SELECT Customer_Name, SUM(Standard_Price*Order_Quantity) AS Order_Amount
FROM Customer JOIN Order_T ON Customer.Customer_ID = Order_T.Customer_ID 
JOIN Order_Line ON Order_T.Order_ID = Order_Line.Order_ID
JOIN Product ON Order_Line.Product_ID = Product.Product_ID  
GROUP BY Customer_Name;