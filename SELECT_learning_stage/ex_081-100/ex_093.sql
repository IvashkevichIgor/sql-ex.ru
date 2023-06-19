/* Для каждой компании, перевозившей пассажиров, подсчитать время, 
 * которое провели в полете самолеты с пассажирами.
 * Вывод: название компании, время в минутах. */

WITH cte AS (SELECT id_comp, trip_no,
                    DATE_PART('hour', time_in - time_out) * 60 + DATE_PART('minute', time_in - time_out) +
                    CASE
                    WHEN time_out < time_in THEN 0
                    ELSE 1440
                    END AS minutes
               FROM trip)
SELECT name, total_minutes
  FROM (SELECT id_comp, SUM(minutes) AS total_minutes
          FROM cte
               JOIN (SELECT DISTINCT trip_no, date 
                       FROM pass_in_trip) AS poo
               ON cte.trip_no = poo.trip_no
         GROUP BY id_comp) AS foo
       JOIN company AS c
       ON foo.id_comp = c.id_comp;