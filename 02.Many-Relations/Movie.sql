/*1*/
SELECT s.STARNAME
FROM MOVIESTAR m JOIN STARSIN s
ON m.NAME = s.STARNAME
WHERE s.MOVIETITLE = 'The Usual Suspects' AND m.GENDER = 'M'

/*2*/
SELECT s.STARNAME
FROM MOVIE m JOIN STARSIN s
ON m.TITLE = s.MOVIETITLE
WHERE m.YEAR = 1995 AND m.STUDIONAME = 'MGM'

/*3*/
SELECT DISTINCT me.NAME
FROM MOVIE m JOIN MOVIEEXEC me
ON m.PRODUCERC# = me.CERT#
WHERE m.STUDIONAME = 'MGM'

/*4*/
SELECT m2.TITLE
FROM MOVIE m1, MOVIE m2
WHERE m1.TITLE = 'Star Wars' AND
	  m1.LENGTH < m2.LENGTH

/*5*/
SELECT m2.NAME
FROM MOVIEEXEC m1, MOVIEEXEC m2
WHERE m1.NAME ='Stephen Spielberg' AND
	  m1.NETWORTH < m2.NETWORTH
	  
/*6*/
SELECT m.TITLE
FROM MOVIEEXEC m1, MOVIEEXEC m2 JOIN MOVIE m
ON m2.CERT# = m.PRODUCERC#
WHERE m1.NAME ='Stephen Spielberg' AND
	  m1.NETWORTH < m2.NETWORTH