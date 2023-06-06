/* Для каждого класса определите число кораблей этого класса, 
 * потопленных в сражениях. Вывести: класс и число потопленных кораблей.*/

SELECT c.class, COUNT(DISTINCT ship) AS sunked_ship_tally
  FROM classes AS c
       LEFT JOIN ships AS s
       ON c.class = s.class
       LEFT JOIN (SELECT ship, "result" 
                    FROM outcomes
                   WHERE "result" = 'sunk') AS o
       ON o.ship = s.name
       OR o.ship = c.class
 GROUP BY c.class;