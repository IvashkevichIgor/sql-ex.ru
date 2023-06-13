/* Среди тех, кто пользуется услугами только какой-нибудь одной компании, 
 * определить имена разных пассажиров, летавших чаще других.
 * Вывести: имя пассажира и число полетов. */

WITH cte AS (SELECT ID_psg, COUNT(pit.trip_no) AS total_trip
			   FROM pass_in_trip AS pit
			        JOIN trip AS t 
			        ON pit.trip_no = t.trip_no
			  GROUP BY ID_psg
			 HAVING COUNT(DISTINCT id_comp) = 1)
SELECT name, total_trip
  FROM cte
       JOIN passenger AS p
       ON cte.ID_psg = p.ID_psg
 WHERE total_trip = (SELECT MAX(total_trip)
                       FROM cte);