/*Удалите из таблицы Ships все корабли, потопленные в сражениях. */

DELETE
  FROM ships
 WHERE name IN (SELECT ship
                  FROM outcomes
                 WHERE result = 'sunk');