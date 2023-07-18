/* Вывести:
 * 1. Названия всех квадратов черного или белого цвета.
 * 2. Общее количество белых квадратов.
 * 3. Общее количество черных квадратов. */
                         		   
WITH cte AS (SELECT Q_NAME,
                    CASE SUM(B_VOL)
                    WHEN 765 THEN 'white'
                    ELSE 'black'
                    END AS color
               FROM utQ
                    LEFT JOIN utB  
                    ON q_id = b_q_id 
              GROUP BY Q_NAME
             HAVING SUM(B_VOL) = 765
                 OR SUM(B_VOL) IS NULL)
SELECT Q_NAME, 
       (SELECT COUNT(color)
          FROM cte
         WHERE color = 'white') AS whites,
       (SELECT COUNT(color)
          FROM cte
         WHERE color = 'black') AS blacks
  FROM cte;
