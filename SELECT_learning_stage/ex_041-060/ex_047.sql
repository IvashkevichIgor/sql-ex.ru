/* Определить страны, которые потеряли в сражениях все свои корабли.*/

SELECT country
  FROM (SELECT COALESCE (ship, name) AS ship,
               class, result
          FROM outcomes AS o
               FULL JOIN ships AS s 
               ON o.ship = s.name) AS gbs
               LEFT JOIN classes AS c
               ON (gbs.class = c.class
               OR gbs.ship = c.CLASS)
  GROUP BY country
 HAVING country IS NOT NULL
    AND COUNT(DISTINCT ship) = COUNT(CASE
	         						 WHEN result = 'sunk'
 									 THEN 1
	        						 ELSE NULL 
	      						     END);