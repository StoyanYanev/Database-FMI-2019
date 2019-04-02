/*1*/
SELECT CONVERT(decimal(5,2), AVG(speed)) AS averageSpeed
FROM pc

/*2*/
SELECT pr.maker, AVG(l.screen) AS averageScreen
FROM product pr JOIN laptop l
ON pr.model = l.model
GROUP BY pr.maker

/*3*/
SELECT CONVERT(decimal(5,2), AVG(speed)) AS averageSpeed
FROM laptop
WHERE price >= 1000

/*4*/
SELECT pr.maker, CONVERT(decimal(5,2), AVG(p.price)) AS averagePrice
FROM product pr JOIN pc p
ON  pr.model = p.model
WHERE pr.maker = 'A'
GROUP BY pr.maker

/*5*/
SELECT p.maker, AVG(t.price) AS averagePrice
FROM (SELECT price,model FROM pc UNION ALL
	  SELECT price,model FROM laptop)t JOIN product p
	  ON t.model = p.model
GROUP BY p.maker
HAVING p.maker = 'B'

/*6*/
SELECT speed, AVG(price) AS averagePrice
FROM pc
GROUP BY speed

/*7*/
SELECT pr.maker, COUNT(p.model) AS numberOfPC
FROM product pr JOIN pc p
ON  pr.model = p.model
GROUP BY pr.maker
HAVING COUNT(p.model) >= 3

/*8*/
SELECT pr.maker, p.price
FROM product pr JOIN pc p
ON  pr.model = p.model
WHERE p.price >= ALL (SELECT price FROM pc)

/*9*/
SELECT speed, AVG(price) AS averagePrice
FROM pc
GROUP BY speed
HAVING speed >= 800

/*10*/
SELECT pr.maker, CONVERT(decimal(4,2),AVG(p.hd)) AS averageHD
FROM product pr JOIN pc p
ON  pr.model = p.model
WHERE pr.maker IN (SELECT maker FROM product WHERE type = 'Printer')
GROUP BY pr.maker