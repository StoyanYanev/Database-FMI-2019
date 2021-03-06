/*1*/
SELECT TITLE, YEAR, LENGTH
FROM MOVIE
WHERE (LENGTH >= 120 OR LENGTH IS NULL) AND YEAR <= 2000
ORDER BY TITLE

/*2*/
SELECT NAME, GENDER
FROM MOVIESTAR
WHERE NAME LIKE 'J%' AND BIRTHDATE >= 1948
ORDER BY NAME DESC

/*3*/ 
SELECT m.STUDIONAME, COUNT(DISTINCT s.STARNAME) AS numberOfActors
FROM MOVIE m JOIN STARSIN s 
ON m.TITLE = s.MOVIETITLE AND m.YEAR = s.MOVIEYEAR
GROUP BY m.STUDIONAME

/*4*/
SELECT s.STARNAME, COUNT(s.MOVIETITLE) AS numberOfMovies
FROM STARSIN s
GROUP BY s.STARNAMEE

/*5*/
SELECT m.STUDIONAME, m.TITLE, m.YEAR
FROM MOVIE m 
WHERE m.YEAR = (SELECT MAX(YEAR) FROM MOVIE mv WHERE mv.STUDIONAME = m.STUDIONAME)

/*6*/
SELECT m.NAME
FROM MOVIESTAR m
WHERE m.BIRTHDATE = (SELECT MAX(mv.BIRTHDATE) FROM MOVIESTAR mv WHERE mv.GENDER = 'M')

/*7*/
SELECT m.STUDIONAME, s.STARNAME, COUNT(m.TITLE) as numberOfMovies
FROM MOVIE m JOIN STARSIN s
ON m.TITLE = s.MOVIETITLE AND m.YEAR = s.MOVIEYEAR
GROUP BY m.STUDIONAME, s.STARNAME
HAVING COUNT(m.TITLE) >= ALL(SELECT COUNT(TITLE)
						  FROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLE
						  GROUP BY STUDIONAME,STARNAME)

/*8*/
SELECT s.MOVIETITLE,s.MOVIEYEAR ,COUNT(s.STARNAME) as numberOfActors
FROM STARSIN s
GROUP BY s.MOVIETITLE, s.MOVIEYEAR
HAVING COUNT(s.STARNAME) > 2
