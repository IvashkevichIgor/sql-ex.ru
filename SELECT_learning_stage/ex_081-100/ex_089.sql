/* Найти производителей, у которых больше всего моделей в 
 * таблице Product, а также тех, у которых меньше всего моделей.
 * Вывод: maker, число моделей */

WITH cte AS (SELECT maker, COUNT(model) AS model_tally
               FROM product
              GROUP BY maker)
SELECT maker, model_tally
  FROM cte
 WHERE model_tally = (SELECT MAX(model_tally)
                        FROM cte)
    OR model_tally = (SELECT MIN(model_tally)
                        FROM cte);