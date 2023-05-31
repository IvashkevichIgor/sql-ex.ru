/* Найдите названия кораблей, имеющих наибольшее число орудий 
 * среди всех имеющихся кораблей такого же водоизмещения 
 * (учесть корабли из таблицы Outcomes). */

WITH max_guns_classes AS
     (SELECT class
        FROM classes AS c
             JOIN
             (SELECT MAX(numGuns) AS max_guns, displacement 
                FROM classes
               GROUP BY displacement) AS mgd
             ON (c.numguns = mgd.max_guns
                OR (c.numguns IS NULL
                   AND mgd.max_guns IS NULL))
             AND (c.displacement = mgd.displacement
                 OR (c.displacement IS NULL
                    AND mgd.displacement IS NULL)))
SELECT name
  FROM ships AS s
 WHERE class IN (SELECT *
                   FROM max_guns_classes)
 
 UNION 
 
SELECT ship
  FROM outcomes AS o
 WHERE ship IN (SELECT *
                  FROM max_guns_classes);              