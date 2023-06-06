/* Посчитать остаток денежных средств на каждом пункте приема для базы данных 
 * с отчетностью не чаще одного раза в день. Вывод: пункт, остаток. */

SELECT io.point, 
       COALESCE (total_inc, 0) - COALESCE(total_out, 0) AS remain
  FROM (SELECT point, SUM(inc) AS total_inc
          FROM income_o
         GROUP BY point) AS io
       FULL JOIN (SELECT point, SUM(out) AS total_out
                    FROM outcome_o
                   GROUP BY point) AS oo
       ON io.point = oo.point;