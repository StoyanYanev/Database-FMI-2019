/*1*/
SELECT l.model, l.code, l.screen
FROM laptop l JOIN laptop l1
ON l.code = l1.code
WHERE (l.screen = 15 or l1.screen = 11) AND l.model = l1.model

/*2*/
SELECT p.model
FROM product p JOIN pc pc
ON p.model = pc.model
WHERE pc.price <= (SELECT MIN(l.price) FROM laptop l JOIN product pr 
					ON l.model = pr.model WHERE pr.maker = p.maker)
GROUP BY p.model

/*3*/
SELECT p.model, AVG(pc.price) AS averageSum
FROM product p JOIN pc pc
ON p.model = pc.model
GROUP BY p.model, p.maker
HAVING AVG(price) < ANY(SELECT MIN(price) 
					  FROM laptop JOIN product p1 ON laptop.model = p1.model
					  WHERE p.maker=p1.maker);

/*4*/
SELECT pc.code,p.maker, COUNT(pc.model) AS num_pc_higher_price
FROM product p JOIN pc pc
ON p.model = pc.model
JOIN pc pc1 ON p.model = pc1.model
WHERE pc.price <= pc1.price
GROUP BY pc.code, p.maker