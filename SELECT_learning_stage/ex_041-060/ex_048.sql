/* Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении. */

SELECT DISTINCT c.class
  FROM outcomes AS o
       LEFT JOIN ships AS s 
       ON o.ship = s.name
       LEFT JOIN classes AS c
       ON (s.class = c.class
       OR o.ship = c.class)
 WHERE c.class IS NOT NULL
   AND result = 'sunk';