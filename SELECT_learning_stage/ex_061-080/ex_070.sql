/* Укажите сражения, в которых участвовало по меньшей мере три корабля одной и той же страны.*/

SELECT DISTINCT b.name
  FROM battles AS b
       JOIN outcomes AS o
       ON b.name = o.battle
       LEFT JOIN ships AS s
       ON o.ship = s.name
       LEFT JOIN classes AS c
       ON s."class"  = c."class"
       OR o.ship = c."class" 
 GROUP BY b.name, country
HAVING COUNT(country) >= 3;