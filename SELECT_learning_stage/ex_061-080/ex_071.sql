/* Найти тех производителей ПК, все модели ПК которых имеются в таблице PC. */
                    
SELECT DISTINCT maker
  FROM product
 WHERE type = 'PC'
   AND maker NOT IN (SELECT DISTINCT maker
                       FROM product
                      WHERE type = 'PC'
                        AND model NOT IN (SELECT model
                       FROM pc));        