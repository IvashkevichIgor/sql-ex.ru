/* Для классов, имеющих потери в виде потопленных кораблей 
 * и не менее 3 кораблей в базе данных, 
 * вывести имя класса и число потопленных кораблей. */

SELECT c.class, COUNT(DISTINCT ship) AS sunked_ship_tally
  FROM classes AS c
       LEFT JOIN ships AS s
       ON c.class = s.class
       JOIN (SELECT ship, "result" 
               FROM outcomes
              WHERE "result" = 'sunk') AS o
       ON o.ship = s.name
       OR o.ship = c.class
 GROUP BY c.class
HAVING c.class IN (SELECT class
                     FROM (SELECT c."class", name
                             FROM classes AS c
                                  JOIN ships AS s
                                  ON c.class = s."class"
                          
                            UNION 
                    
                           SELECT c."class", ship
                             FROM classes AS c
                                  JOIN outcomes AS o
                                  ON c.class = o.ship) AS poo
                     GROUP BY class 
                    HAVING COUNT(name) >= 3);        

