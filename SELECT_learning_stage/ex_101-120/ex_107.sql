/* Для пятого по счету пассажира из числа вылетевших из Ростова 
 * в апреле 2003 года определить компанию, номер рейса и дату вылета.
 * Замечание. Считать, что два рейса одновременно вылететь из Ростова не могут. */

SELECT name, trip_no, date
  FROM pass_in_trip AS pit
       NATURAL JOIN trip AS t
       NATURAL JOIN company AS c
 WHERE town_from = 'Rostov'
   AND DATE_PART('year', date) = 2003
   AND DATE_PART('month', date) = 4
 ORDER BY date, time_out
       OFFSET 4
       FETCH FIRST 1 ROWS ONLY;