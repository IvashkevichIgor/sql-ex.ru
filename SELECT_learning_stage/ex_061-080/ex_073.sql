/* Для каждой страны определить сражения, в которых не участвовали корабли данной страны.
 * Вывод: страна, сражение */

SELECT DISTINCT country, name
  FROM classes, battles
 
 EXCEPT
 
SELECT DISTINCT country, b.name
  FROM classes AS c
       LEFT JOIN ships AS s 
       ON c.class = s.class
       LEFT JOIN outcomes AS o
       ON o.ship = s."name" 
       OR o.ship = c.CLASS
       JOIN battles AS b 
       ON b.name = o.battle
 ORDER BY country;