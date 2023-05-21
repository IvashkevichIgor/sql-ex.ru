/* Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).*/

SELECT name
  FROM ships AS s
       JOIN classes AS c
       ON (s.name = c.class)

 UNION

SELECT ship
  FROM outcomes AS o
       JOIN classes AS c
       ON (o.ship = c.class)