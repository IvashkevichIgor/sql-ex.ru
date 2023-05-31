/* С точностью до 2-х десятичных знаков определите среднее число орудий 
 * всех линейных кораблей (учесть корабли из таблицы Outcomes).*/

SELECT CAST(AVG(numGuns * 1.0) AS NUMERIC(6,2)) AS avg_numGuns
  FROM (SELECT name, type, numGuns
          FROM classes AS c
               JOIN ships AS s
               ON c.class = s.CLASS
               
         UNION
         
        SELECT ship, type, numGuns
          FROM classes AS c
               JOIN outcomes AS o
               ON c.class = o.ship) AS foo
 WHERE type = 'bb';