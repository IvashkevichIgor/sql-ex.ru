/* Найти производителей любой компьютерной техники, 
 * у которых нет моделей ПК, не представленных в таблице PC. */

SELECT DISTINCT maker
  FROM product
 WHERE maker NOT IN (SELECT DISTINCT maker
                       FROM product
                      WHERE type = 'PC'
                        AND model NOT IN (SELECT model
                                            FROM pc));