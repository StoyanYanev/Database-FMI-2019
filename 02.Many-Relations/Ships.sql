/*1*/ 
SELECT s.NAME
FROM SHIPS s RIGHT JOIN CLASSES c
ON s.CLASS = c.CLASS
WHERE c.DISPLACEMENT >= 50000

/*2*/ 
SELECT s.NAME, c.DISPLACEMENT, c.NUMGUNS
FROM CLASSES c JOIN  ships s 
ON c.CLASS = s.CLASS 
JOIN OUTCOMES o
ON s.NAME = o.SHIP
WHERE o.BATTLE = 'Guadalcanal'

/* OR
SELECT s.NAME, c.DISPLACEMENT, c.NUMGUNS
FROM CLASSES c, OUTCOMES o, SHIPS s
WHERE c.CLASS = s.CLASS AND o.SHIP = s.NAME 
	 AND o.BATTLE = 'Guadalcanal'
*/

/*3*/ 
SELECT DISTINCT c1.COUNTRY
FROM CLASSES c1 JOIN CLASSES c2
ON c1.COUNTRY = c2.COUNTRY
WHERE c1.TYPE = 'bb' AND c2.TYPE = 'bc'

/*4*/ 
SELECT outcomeA.ship
FROM OUTCOMES outcomeA, OUTCOMES outcomeB, BATTLES battleA, BATTLES battleB
WHERE outcomeA.result = 'damaged'
  AND outcomeB.ship = outcomeA.ship
  AND outcomeB.battle = battleA.name
  and outcomeA.battle = battleB.name
  AND battleA.date > battleB.date;