/* Используя таблицу Product, определить количество производителей, 
 * выпускающих по одной модели. */

SELECT COUNT(maker) AS maker_tally
  FROM (SELECT maker
          FROM product
         GROUP BY maker
        HAVING COUNT(model) = 1) AS single_model_maker