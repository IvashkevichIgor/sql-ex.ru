/* Для семи последовательных дней, начиная от минимальной даты, 
 * когда из Ростова было совершено максимальное число рейсов, 
 * определить число рейсов из Ростова.
 * Вывод: дата, количество рейсов */

WITH cte1 AS (SELECT date, COUNT(DISTINCT trip_no) AS trip_tally
                FROM trip AS t
                     NATURAL JOIN pass_in_trip AS pit
               WHERE town_from = 'Rostov'
               GROUP BY date),
     cte2 AS (SELECT GENERATE_SERIES(start_date, 
                                     start_date + INTERVAL '6 days', 
                                     '1 day') AS date
                FROM (SELECT MIN(date) AS start_date
                        FROM cte1
                       WHERE trip_tally = (SELECT MAX(trip_tally)
                                             FROM cte1)) AS foo)
SELECT date,
       CASE
       WHEN trip_tally IS NULL THEN 0
       ELSE trip_tally
       END
  FROM cte2
       NATURAL LEFT JOIN cte1;
