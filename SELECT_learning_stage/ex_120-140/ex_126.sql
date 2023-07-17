/* Для последовательности пассажиров, упорядоченных по id_psg, 
 * определить того, кто совершил наибольшее число полетов, а также тех, 
 * кто находится в последовательности непосредственно перед и после него.
 * Для первого пассажира в последовательности предыдущим будет последний, 
 * а для последнего пассажира последующим будет первый.
 * Для каждого пассажира, отвечающего условию, вывести: 
 * имя, имя предыдущего пассажира, имя следующего пассажира. */

SELECT name, prev, nxt
  FROM (SELECT id_psg, name,
               CASE 
               WHEN LAG(name) OVER(ORDER BY id_psg) IS NULL
               THEN LAST_VALUE(name) OVER(ORDER BY id_psg RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
               ELSE LAG(name) OVER(ORDER BY id_psg)
               END AS prev,
               CASE
               WHEN LEAD(name) OVER(ORDER BY id_psg) IS NULL
               THEN FIRST_VALUE(name) OVER(ORDER BY id_psg)
               ELSE LEAD(name) OVER(ORDER BY id_psg)
               END AS nxt
          FROM passenger) AS poo
 WHERE id_psg IN (SELECT id_psg
                    FROM pass_in_trip
                   GROUP BY id_psg
                  HAVING COUNT(trip_no) = (SELECT MAX(trip_tally)
                                             FROM (SELECT COUNT(trip_no) AS trip_tally
                                                     FROM pass_in_trip
                                                    GROUP BY (id_psg)) AS foo));