/* Определить время, проведенное в полетах, для пассажиров, 
 * летавших всегда на разных местах. 
 * Вывод: имя пассажира, время в минутах. */

SELECT name, minutes
  FROM passenger AS p
       JOIN (SELECT id_psg, 
            SUM(CASE
            	WHEN time_out < time_in
            	THEN DATE_PART('hour', CAST(time_in AS timestamp) - CAST(time_out AS timestamp)) * 60 +
            	     DATE_PART('minutes', CAST(time_in AS timestamp) - CAST(time_out AS timestamp)) 
            	     
            	ELSE DATE_PART('hour', timestamp '1900-01-02 00:00:00' - CAST(time_out AS timestamp)) * 60 +
            	     DATE_PART('minutes', '1900-01-02 00:00:00'- CAST(time_out AS timestamp)) +
            	     DATE_PART('hour', CAST(time_in AS timestamp)) * 60 +
            	     DATE_PART('minutes', CAST(time_in AS timestamp))
                END) AS minutes
			   FROM pass_in_trip AS pit
			        JOIN trip AS t 
			        ON pit.trip_no = t.trip_no
			  WHERE pit.id_psg IN (SELECT id_psg
			                         FROM pass_in_trip
			                        GROUP BY id_psg  
			                       HAVING COUNT(DISTINCT place) = COUNT(place))
			  GROUP BY id_psg) AS foo
       ON p.id_psg = foo.id_psg;