/* Среди тех, кто пользуется услугами только одной компании, 
 * определить имена разных пассажиров, летавших чаще других.
 * Вывести: имя пассажира, число полетов и название компании. */

WITH cte AS (SELECT id_psg, COUNT(t.trip_no) AS trip_tally
               FROM pass_in_trip AS pit
                    JOIN trip AS t 
                    ON pit.trip_no = t.trip_no
              GROUP BY id_psg
             HAVING COUNT(DISTINCT id_comp) = 1)
SELECT p.name, trip_tally, company
  FROM (SELECT DISTINCT pit.id_psg, trip_tally, c.name AS company
          FROM pass_in_trip AS pit
               JOIN trip AS t 
               ON pit.trip_no = t.trip_no
               JOIN company AS c
               ON t.id_comp = c.id_comp
               JOIN cte
               ON pit.id_psg = cte.id_psg
         WHERE trip_tally = (SELECT MAX(trip_tally)
                               FROM cte)) AS foo
         JOIN passenger AS p 
         ON foo.id_psg = p.id_psg;                  