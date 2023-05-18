/* Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM 
 * и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM.
 * Вывести: Maker */

SELECT DISTINCT maker
  FROM product AS p
       JOIN pc
       ON (p.model = pc.model)
 WHERE maker IN
       (SELECT DISTINCT maker
          FROM product
         WHERE type = 'Printer')
   AND ram IN
       (SELECT MIN(ram)
         FROM pc)
   AND speed IN
       (SELECT MAX(speed)
          FROM pc
         WHERE ram IN
               (SELECT MIN(ram)
                  FROM pc));
