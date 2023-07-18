/* На основании информации из таблицы Pass_in_Trip, 
 * для каждой авиакомпании определить:
 * 1) количество выполненных перелетов;
 * 2) число использованных типов самолетов;
 * 3) количество перевезенных различных пассажиров;
 * 4) общее число перевезенных компанией пассажиров.
 * Вывод: Название компании, 1), 2), 3), 4). */

SELECT name, flight_tally, plane_tally, 
       diff_passenger_tally, total_passenger
  FROM (SELECT id_comp,
               COUNT(DISTINCT plane) AS plane_tally,
               COUNT(DISTINCT id_psg) AS diff_passenger_tally,
               COUNT(id_psg) AS total_passenger
          FROM pass_in_trip
               NATURAL JOIN trip
         GROUP BY id_comp) AS foo
               NATURAL JOIN (SELECT id_comp, COUNT(trip_no) AS flight_tally
                               FROM (SELECT DISTINCT trip_no, date
                                       FROM pass_in_trip) AS doo
                                    NATURAL JOIN trip
                              GROUP BY id_comp) AS poo
               NATURAL JOIN company
 ORDER BY name;