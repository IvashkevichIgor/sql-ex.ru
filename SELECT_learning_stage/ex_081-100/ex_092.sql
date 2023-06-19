/* Выбрать все белые квадраты, которые окрашивались только из баллончиков,
 * пустых к настоящему времени. Вывести имя квадрата */

SELECT q_name
  FROM (SELECT q_id
          FROM (SELECT q_id, v_color
                  FROM utq
                       JOIN utb
                       ON utq.q_id = utb.b_q_id
                       JOIN utv
                       ON utb.b_v_id = utv.v_id
                 WHERE v_id IN (SELECT v_id
                                  FROM utb
                                       JOIN utv
                                       ON utb.b_v_id = utv.v_id
                                 GROUP BY v_id
                                HAVING SUM(b_vol) = 255)
                 GROUP BY q_id, v_color
                HAVING SUM(b_vol) = 255) AS foo
         GROUP BY q_id
        HAVING COUNT(q_id) = 3) AS poo
       JOIN utq
            ON poo.q_id = utq.q_id;