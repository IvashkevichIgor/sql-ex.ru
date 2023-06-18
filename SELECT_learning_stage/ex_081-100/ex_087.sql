/* Считая, что пункт самого первого вылета пассажира является местом жительства, 
 * найти не москвичей, которые прилетали в Москву более одного раза.
 * Вывод: имя пассажира, количество полетов в Москву */

WITH cte1 AS (SELECT id_psg, t.trip_no, town_from, town_to,
                     CAST("date" AS date) + CAST(time_out AS time) AS trip_timestamp
                FROM pass_in_trip AS pit
                     JOIN trip AS t 
                     ON pit.trip_no = t.trip_no),
     cte2 AS (SELECT cte1.id_psg
                FROM cte1
                     JOIN (SELECT id_psg,
                                  MIN(trip_timestamp) AS first_trip_timestamp
                             FROM cte1
                            GROUP BY id_psg) AS foo 
                     ON cte1.id_psg = foo.id_psg
                     AND trip_timestamp = first_trip_timestamp
               WHERE town_from != 'Moscow')
SELECT name, moscow_trip_tally
  FROM (SELECT id_psg, COUNT(trip_no) AS moscow_trip_tally
          FROM cte1
         WHERE id_psg IN (SELECT *
                            FROM cte2)
           AND town_to = 'Moscow'
         GROUP BY id_psg
        HAVING COUNT(trip_no) > 1) AS foo
               JOIN passenger AS p
               ON p.id_psg = foo.id_psg;