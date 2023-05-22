/* Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal),
 * вывести название, водоизмещение и число орудий.*/    
       
SELECT ship, displacement, numGuns
  FROM (SELECT DISTINCT ship, class
          FROM outcomes AS o
               LEFT JOIN ships AS s 
               ON o.ship = s.name
         WHERE battle = 'Guadalcanal') AS gbs
               LEFT JOIN classes AS c
               ON (gbs.class = c.class
               OR gbs.ship = c.CLASS); 