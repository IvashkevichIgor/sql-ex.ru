/* В наборе записей из таблицы PC, отсортированном по столбцу code (по возрастанию)
 * найти среднее значение цены для каждой шестерки подряд идущих ПК.
 * Вывод: значение code, которое является первым в наборе из шести строк, 
 * среднее значение цены в наборе. */

WITH cte1 AS (SELECT ROW_NUMBER() OVER (ORDER BY code) AS num1
                FROM pc),
cte2 AS (SELECT ROW_NUMBER() OVER (ORDER BY code) AS num2, *
           FROM pc)
SELECT code, avg_price
  FROM (SELECT num1, AVG(price) AS avg_price
          FROM cte1
               JOIN cte2
               ON num1 + 5 >= num2
               AND num1 <= num2
         GROUP BY num1
        HAVING COUNT(num2) = 6) AS foo
        JOIN cte2
        ON foo.num1 = cte2.num2;