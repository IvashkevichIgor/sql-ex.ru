/* Определить дни, когда было выполнено максимальное число рейсов из
 * Ростова ('Rostov'). Вывод: число рейсов, дата. */

WITH cte AS (SELECT COUNT(DISTINCT t.trip_no) AS trip_tally, date
			   FROM trip AS t
			        JOIN pass_in_trip AS pit
			        ON t.trip_no = pit.trip_no
			  WHERE town_from = 'Rostov'
			  GROUP BY "date")
SELECT trip_tally, date
  FROM cte
 WHERE trip_tally = (SELECT MAX(trip_tally)
                       FROM cte);