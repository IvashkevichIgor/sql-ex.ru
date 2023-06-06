/* Посчитать остаток денежных средств на всех пунктах приема на начало дня 15/04/01 
 * для базы данных с отчетностью не чаще одного раза в день. */

SELECT COALESCE (total_inc, 0) - COALESCE(total_out, 0) AS remain
  FROM (SELECT SUM(inc) AS total_inc
          FROM income_o
         WHERE date < '20010415') AS io,
       (SELECT SUM(out) AS total_out
          FROM outcome_o
         WHERE date < '20010415') AS oo;