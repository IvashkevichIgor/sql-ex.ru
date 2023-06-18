/* C точностью до двух десятичных знаков определить среднее 
 * количество краски на квадрате. */

SELECT CAST(AVG(b_vol_total * 1.0) AS NUMERIC(6,2)) AS average_vol
  FROM (SELECT q_id, 
               CASE 
               WHEN SUM(b_vol) IS NULL THEN 0
               ELSE SUM(b_vol)
               END AS b_vol_total
          FROM utq 
               LEFT JOIN utb
               ON utq.q_id = utb.b_q_id 
         GROUP BY q_id) AS foo;
