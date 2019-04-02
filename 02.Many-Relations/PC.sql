/*1*/
SELECT p.maker, l.speed
FROM laptop l JOIN product p
ON l.model = p.model
WHERE l.hd >= 9

/*2*/
SELECT p.model, l.price
FROM product p JOIN laptop l
ON p.model = l.model
WHERE p.maker = 'B'
UNION
SELECT p.model, pc1.price
FROM product p JOIN pc pc1
ON p.model = pc1.model
WHERE p.maker = 'B'
UNION
SELECT p.model, pr.price
FROM product p JOIN printer pr
ON p.model = pr.model
WHERE p.maker = 'B'

/*3*/
SELECT maker
FROM product p
WHERE type = 'Laptop' 
EXCEPT
SELECT maker
FROM product
WHERE type = 'PC'

/*4*/
SELECT DISTINCT p1.hd
FROM pc p1, pc p2
WHERE p1.hd = p2.hd AND
	  p1.code <> p2.code

/*5*/
SELECT DISTINCT p1.model,  p2.model
FROM  pc p1, pc p2
WHERE p1.speed = p2.speed 
	  AND p1.ram = p2.ram
      AND p1.model <> p2.model

/*6*/
SELECT DISTINCT pr1.maker
FROM pc p1 JOIN product pr1
ON p1.model = pr1.model JOIN product pr2
ON pr1.model = pr2.model JOIN pc p2
ON p1.model = p2.model
WHERE p1.speed > 400 
	  AND p2.speed > 400 
	  AND p1.code <> p2.code