/* При условии, что баллончики с красной краской использовались 
 * более одного раза, выбрать из них такие, которыми окрашены квадраты, 
 * имеющие голубую компоненту.
 * Вывести название баллончика */

SELECT DISTINCT v_name
  FROM utb
       JOIN utv
       ON b_v_id = v_id
 WHERE v_color = 'R'
   AND b_q_id IN (SELECT DISTINCT b_q_id
                    FROM utb
                         JOIN utv
                         ON b_v_id = v_id
                   WHERE v_color = 'B')
   AND b_v_id IN (SELECT b_v_id
                    FROM utb
                   GROUP BY b_v_id 
                  HAVING COUNT(b_v_id) > 1);