/* Из таблицы Outcome получить все записи за тот месяц (месяцы), с учетом года, 
 * в котором суммарное значение расхода (out) было максимальным. */

WITH cte AS (SELECT SUM(out) AS total_out,
                    EXTRACT(MONTH FROM CAST(date AS TIMESTAMP)) AS month,
                    EXTRACT(YEAR FROM CAST(date AS TIMESTAMP)) AS year
               FROM outcome
              GROUP BY year, month)
SELECT *
  FROM outcome
 WHERE EXTRACT(YEAR FROM CAST(date AS TIMESTAMP)) IN 
       (SELECT year
          FROM cte
         WHERE total_out = (SELECT MAX(total_out)
                              FROM cte)
           AND EXTRACT(MONTH FROM CAST(date AS TIMESTAMP)) = month);