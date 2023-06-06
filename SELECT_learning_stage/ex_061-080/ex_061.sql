/* Посчитать остаток денежных средств на всех пунктах приема 
 * для базы данных с отчетностью не чаще одного раза в день. */

SELECT COALESCE (total_inc, 0) - COALESCE(total_out, 0) AS remain
  FROM (SELECT SUM(inc) AS total_inc
          FROM income_o) AS io,
       (SELECT SUM(out) AS total_out
          FROM outcome_o) AS oo;