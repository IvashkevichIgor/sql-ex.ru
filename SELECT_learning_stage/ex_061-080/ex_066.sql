/* Для всех дней в интервале с 01/04/2003 по 07/04/2003 
 * определить число рейсов из Rostov с пассажирами на борту.
 * Вывод: дата, количество рейсов. */

WITH dates AS (SELECT TIMESTAMP '2003-04-01 00:00:00.000' AS date
                UNION
               SELECT TIMESTAMP '2003-04-02 00:00:00.000'
                UNION
               SELECT TIMESTAMP '2003-04-03 00:00:00.000'
                UNION
               SELECT TIMESTAMP '2003-04-04 00:00:00.000'
                UNION
               SELECT TIMESTAMP '2003-04-05 00:00:00.000'
                UNION
               SELECT TIMESTAMP '2003-04-06 00:00:00.000'
                UNION
               SELECT TIMESTAMP '2003-04-07 00:00:00.000')
SELECT d.date, 
       CASE
       WHEN trip_tally IS NULL THEN 0
       ELSE trip_tally
       END AS Qty
  FROM dates AS d
       LEFT JOIN (SELECT date, COUNT(DISTINCT pit.trip_no) AS trip_tally
                    FROM pass_in_trip AS pit
                         JOIN trip AS t
                         ON pit.trip_no = t.trip_no
                   WHERE town_from = 'Rostov'
                   GROUP BY date) AS foo
       ON d.date = foo.date
 ORDER BY d.date;