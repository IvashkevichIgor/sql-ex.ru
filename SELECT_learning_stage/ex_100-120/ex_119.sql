/* Сгруппировать все окраски по дням, месяцам и годам. 
 * Идентификатор каждой группы должен иметь вид "yyyy" для года, 
 * "yyyy-mm" для месяца и "yyyy-mm-dd" для дня.
 * Вывести только те группы, в которых количество различных моментов 
 * времени (b_datetime), когда выполнялась окраска, более 10.
 * Вывод: идентификатор группы, суммарное количество потраченной краски. */

SELECT TO_CHAR(b_datetime, 'yyyy-mm-dd') AS period, 
       SUM(b_vol)
  FROM utb
 GROUP BY TO_CHAR(b_datetime, 'yyyy-mm-dd')
HAVING COUNT(DISTINCT b_datetime) > 10

 UNION
  
SELECT TO_CHAR(b_datetime, 'yyyy-mm') AS period, 
       SUM(b_vol)
  FROM utb
 GROUP BY TO_CHAR(b_datetime, 'yyyy-mm')
HAVING COUNT(DISTINCT b_datetime) > 10

 UNION 
 
SELECT TO_CHAR(b_datetime, 'yyyy') AS period, 
       SUM(b_vol)
  FROM utb
 GROUP BY TO_CHAR(b_datetime, 'yyyy')
HAVING COUNT(DISTINCT b_datetime) > 10;
