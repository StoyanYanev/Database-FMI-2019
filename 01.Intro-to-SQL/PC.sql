/*1*/
SELECT MODEL, SPEED AS MHz, HD AS GB
FROM pc
WHERE PRICE <= 1200

/*2*/
SELECT DISTINCT maker
FROM product
WHERE type = 'printer'

/*3*/
SELECT model, ram, screen
FROM laptop
WHERE price >= 1000

/*4*/
SELECT code, model, price, color, type
FROM printer
WHERE color = 'y'

/*5*/
SELECT model, speed, hd
FROM pc
WHERE cd = '12x' OR cd = '16x' AND price <= 2000