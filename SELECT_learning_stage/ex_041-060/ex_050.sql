/* Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships. */

SELECT DISTINCT battle
  FROM outcomes AS o
       JOIN ships AS s 
       ON o.ship = s.name
 WHERE class = 'Kongo';