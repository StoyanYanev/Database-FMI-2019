/*4*/
INSERT INTO product(model, maker, type)
VALUES ('1100', 'C', 'PC')

INSERT INTO pc(model, speed, ram, hd, cd, price, code)
VALUES ('1100', 2400, 2048, 500, '52x', 299, 12)

/*5*/
DELETE FROM pc
WHERE model = '1100'

/*6*/
DELETE FROM product
WHERE type = 'Laptop' AND maker NOT IN(SELECT maker
									   FROM product
									   WHERE type = 'Printer')

/*7*/
UPDATE product 
SET maker = 'A'
WHERE maker = 'B'

/*8*/
UPDATE PC 
SET price = price / 2, hd = hd + 20

/*9*/
UPDATE laptop 
SET screen = screen + 1
WHERE model IN(SELECT model
			   FROM product
			   WHERE maker = 'B')