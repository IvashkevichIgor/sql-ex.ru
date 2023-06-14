/* Определить пассажиров, которые больше других времени провели в полетах.
 * Вывод: имя пассажира, общее время в минутах, проведенное в полетах */

WITH cte AS (SELECT id_psg, 
                    SUM(DATE_PART('hour', CAST(time_in AS timestamp) - CAST(time_out AS timestamp)) * 60 +
                    DATE_PART('minutes', CAST(time_in AS timestamp) - CAST(time_out AS timestamp)) +  
                    CASE 
       	            WHEN time_out < time_in THEN 0 	     
                    ELSE 1440
                    END) AS total_trip_time
               FROM pass_in_trip AS pit
                    JOIN trip AS t 
                    ON pit.trip_no = t.trip_no
              GROUP BY id_psg)
SELECT name, total_trip_time
  FROM passenger AS p
       JOIN cte 
       ON p.id_psg = cte.id_psg
 WHERE total_trip_time = (SELECT MAX(total_trip_time)
                            FROM cte);