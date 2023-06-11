/* Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
 * Замечания.
 * 1) A - B и B - A считать ОДНИМ И ТЕМ ЖЕ маршрутом.
 * 2) Использовать только таблицу Trip */
                      
WITH foo AS (SELECT town_from, town_to,
                    COUNT(trip_no) AS total_trip
               FROM (SELECT trip_no,
                            CASE 
			                WHEN town_from > town_to THEN town_from
			                ELSE town_to
		                    END AS town_from,
		                    CASE 
			                WHEN town_from > town_to THEN town_to
			                ELSE town_from
		                    END AS town_to
                       FROM trip) AS boo
              GROUP BY town_from, town_to)
SELECT COUNT(total_trip) AS max_route_tally
  FROM foo
 WHERE total_trip = (SELECT MAX(total_trip)
                       FROM foo);                    