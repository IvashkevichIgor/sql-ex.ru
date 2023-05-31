/* Найдите названия кораблей, имеющих наибольшее число орудий 
 * среди всех имеющихся кораблей такого же водоизмещения 
 * (учесть корабли из таблицы Outcomes). */

WITH nnd AS (SELECT name, numGuns, displacement
               FROM classes AS c
                    JOIN ships AS s
                    ON c."class" = s."class"
       
              UNION
 
             SELECT ship, numGuns, displacement
               FROM classes AS c
                    JOIN outcomes AS o
                    ON c."class" = o.ship)                  
SELECT name
  FROM nnd
       JOIN (SELECT MAX(numGuns) AS max_guns, displacement 
               FROM nnd
              GROUP BY displacement) AS mgd
                    ON nnd.numguns = mgd.max_guns
                    AND nnd.displacement = mgd.displacement;