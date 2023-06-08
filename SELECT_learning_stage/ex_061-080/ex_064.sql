/* Используя таблицы Income и Outcome, для каждого пункта приема определить дни, 
 * когда был приход, но не было расхода и наоборот.
 * Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день. */

SELECT COALESCE(inc_by_day.point, out_by_day.point) AS point,
       COALESCE(inc_by_day.date, out_by_day.date) AS date,
       CASE 
	   WHEN total_out IS NULL THEN 'inc'
	   ELSE 'out'
       END AS operation,
       COALESCE(total_inc, total_out) AS total_money
  FROM (SELECT point, date, SUM(inc) AS total_inc
          FROM income
         GROUP BY point, date) AS inc_by_day
       FULL JOIN (SELECT point, date, SUM(out) AS total_out
                    FROM outcome
                   GROUP BY point, date) AS out_by_day
       ON inc_by_day.point = out_by_day.point
       AND inc_by_day.date = out_by_day.date
 WHERE inc_by_day.point IS NULL
       OR out_by_day.point IS NULL
 ORDER BY point, date;