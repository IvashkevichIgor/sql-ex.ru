/* Найдите названия кораблей с орудиями калибра 16 дюймов
 * (учесть корабли из таблицы Outcomes). */

SELECT ship
  FROM outcomes AS o
       JOIN classes AS c 
       ON o.ship = c.class
 WHERE bore = 16
 
 UNION 
 
SELECT name
  FROM ships AS s
       JOIN classes AS c 
       ON s.class = c.class
 WHERE bore = 16;