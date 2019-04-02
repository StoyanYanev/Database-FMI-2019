/*1*/
SELECT p.maker, p.model, p.type
FROM product p LEFT JOIN pc pc1
ON p.model = pc1.model
WHERE pc1.code IS NULL AND p.type = 'PC'
UNION
SELECT p.maker,p.model,p.type
FROM product p LEFT JOIN laptop l
ON p.model = l.model
WHERE l.code IS NULL AND p.type = 'Laptop'
UNION
SELECT p.maker,p.model,p.type
FROM product p LEFT JOIN printer pr
ON p.model = pr.model
WHERE pr.code IS NULL AND p.type = 'Printer'

/*2*/
SELECT DISTINCT p1.maker
FROM product p1 JOIN product p2
ON p1.maker=p2.maker
WHERE p1.type = 'Laptop'AND p2.type = 'Printer'

/*3*/
SELECT DISTINCT l1.hd
FROM laptop l1 JOIN laptop l2
ON l1.hd = l2.hd
WHERE l1.model <> l2.model

/*4*/
SELECT p.model
FROM pc p LEFT JOIN product pr
ON p.model = pr.model
WHERE pr.maker IS NULL