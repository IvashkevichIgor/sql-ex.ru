/* Найдите классы, в которые входит только один корабль из базы данных 
 * (учесть также корабли в Outcomes).*/

/* рассматриваем варианты для таблицы ships:
1. в таблице есть едниственный корабль класса, он является головным
2. в таблице есть едниственный корабль класса, он не является головным
3. в таблице нет кораблей класса
4. в таблице более одного корабля класса

для таблицы outcomes:
1. есть корабль, которого нет в таблице ships
2. есть корабль, который есть в таблице ships
3. нет дополнительного корабля */

WITH leading_ships AS
     (SELECT DISTINCT ship
        FROM outcomes AS o
             JOIN classes AS c
             ON (o.ship = c.class)
       WHERE ship NOT IN
             (SELECT name
                FROM ships))
SELECT c.class
  FROM ships AS s
       RIGHT JOIN classes AS c
       ON (s.class = c.class)
 GROUP BY c.class
HAVING (COUNT(name) = 1
   AND c.class NOT IN 
       (SELECT * FROM leading_ships))
    OR (COUNT(name) = 0
   AND c.class IN 
       (SELECT * FROM leading_ships));
