/* Для каждого сражения определить первый и последний день месяца,
 * в котором оно состоялось.
 * Вывод: сражение, первый день месяца, последний день месяца.
 * Замечание: даты представить без времени в формате "yyyy-mm-dd". */

SELECT name, 
       TO_CHAR(DATE_TRUNC('month', date), 'yyyy-mm-dd') AS first_day,
       TO_CHAR(DATE_TRUNC('month', date) + INTERVAL '1 month' - 
               INTERVAL '1 day', 'yyyy-mm-dd') AS last_day
  FROM battles;