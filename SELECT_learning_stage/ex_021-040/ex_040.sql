/* Найти производителей, которые выпускают более одной модели,
 * при этом все выпускаемые производителем модели являются продуктами одного типа.
 * Вывести: maker, type */

SELECT maker, MIN(type) AS type
  FROM product
 GROUP BY maker
HAVING COUNT(model) > 1
   AND COUNT(DISTINCT type) = 1;