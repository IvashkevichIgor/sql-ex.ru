/* Найти производителей, которые выпускают только принтеры или только PC.
 * При этом искомые производители PC должны выпускать не менее 3 моделей.*/

SELECT DISTINCT p.maker
  FROM product AS p
       JOIN (SELECT maker, COUNT(model) AS model_tally
                           FROM product
                          GROUP BY maker
                         HAVING COUNT(DISTINCT "type") = 1) AS foo
       ON p.maker = foo.maker
 WHERE "type" = 'Printer'
    OR "type" = 'PC'
   AND model_tally >=3;