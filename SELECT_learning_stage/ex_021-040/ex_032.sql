/* Одной из характеристик корабля является половина куба калибра его главных орудий (mw). 
 * С точностью до 2 десятичных знаков определите среднее значение mw для кораблей
 * каждой страны, у которой есть корабли в базе данных. */

SELECT country, 
       CAST(AVG(mw) AS NUMERIC(6,2)) AS weight
  FROM (SELECT country, name, (bore*bore*bore)/2 AS mw
          FROM ships AS s
               JOIN classes AS c
               ON (s.class = c.class)

        UNION

        SELECT country, ship, (bore*bore*bore)/2 AS mw
          FROM outcomes AS o
               JOIN classes AS c
               ON (o.ship = c.class)) AS foo
 GROUP BY country;