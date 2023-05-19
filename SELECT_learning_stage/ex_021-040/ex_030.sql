/* В предположении, что приход и расход денег на каждом пункте приема 
 * фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), 
 * требуется получить таблицу, в которой каждому пункту за каждую дату 
 * выполнения операций будет соответствовать одна строка.
 * Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). 
 * Отсутствующие значения считать неопределенными (NULL). */

SELECT COALESCE (ig.point, og.point),
       COALESCE (ig.date, og.date),
       out_total, inc_total
  FROM (SELECT point, date, SUM(inc) AS inc_total
          FROM income
         GROUP BY point, date) AS ig
       FULL JOIN 
            (SELECT point, date, SUM(out) AS out_total
               FROM outcome
              GROUP BY point, date) AS og
            ON ig.point = og.point
               AND ig.date = og.date