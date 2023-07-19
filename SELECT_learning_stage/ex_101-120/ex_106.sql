/* Пусть v1, v2, v3, v4, ... представляет последовательность вещественных чисел - 
 * объемов окрасок b_vol, упорядоченных по возрастанию b_datetime, b_q_id, b_v_id.
 * Найти преобразованную последовательность P1=v1, P2=v1/v2, P3=v1/v2*v3, P4=v1/v2*v3/v4, ..., 
 * где каждый следующий член получается из предыдущего умножением на vi (при нечетных i) 
 * или делением на vi (при четных i).
 * Результаты представить в виде b_datetime, b_q_id, b_v_id, b_vol, Pi, где Pi - 
 * член последовательности, соответствующий номеру записи i. Вывести Pi с 8-ю знаками после запятой. */

WITH RECURSIVE cte1 AS (SELECT ROW_NUMBER() OVER(ORDER BY b_datetime, b_q_id, b_v_id) AS num,
                               COUNT(*) OVER() AS max_num,
                               b_datetime, b_q_id, b_v_id, b_vol
                          FROM utb),
               cte2 AS (SELECT num, 
                               CAST(b_vol AS DOUBLE PRECISION) AS val
                          FROM cte1
                         WHERE num = 1
                         
                         UNION ALL
                         
                        SELECT cte2.num + 1 AS num,
                               CASE
                               WHEN cte2.num % 2 = 1 THEN val / b_vol
                               ELSE val * b_vol
                               END AS val
                          FROM cte1, cte2
                         WHERE cte1.num = cte2.num + 1
                           AND cte2.num < max_num)
SELECT b_datetime, b_q_id, b_v_id, b_vol, --val
       CAST(val AS NUMERIC(15,8))
  FROM cte1
       NATURAL JOIN cte2;