/* Для каждой компании подсчитать количество перевезенных пассажиров 
 * (если они были в этом месяце) по декадам апреля 2003. 
 * При этом учитывать только дату вылета.
 * Вывод: название компании, количество пассажиров за каждую декаду */
       
SELECT DISTINCT name, 
       COUNT(id_psg) FILTER (WHERE date < '2003-04-11') OVER (PARTITION BY t.id_comp) AS "1-10",
       COUNT(id_psg) FILTER (WHERE date BETWEEN '2003-04-11' AND '2003-04-20') OVER (PARTITION BY t.id_comp) AS "11-20",
       COUNT(id_psg) FILTER (WHERE date > '2003-04-20') OVER (PARTITION BY t.id_comp) AS "21-30"
  FROM trip AS t
       JOIN pass_in_trip AS pit
       ON t.trip_no = pit.trip_no
       JOIN company AS c
       ON t.id_comp = c.id_comp
 WHERE date BETWEEN '2003-04-01' AND '2003-04-30';