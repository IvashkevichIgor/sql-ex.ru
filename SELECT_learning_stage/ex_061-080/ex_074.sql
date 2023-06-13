/* Вывести все классы кораблей России (Russia). 
 * Если в базе данных нет классов кораблей России, 
 * вывести классы для всех имеющихся в БД стран.
 * Вывод: страна, класс */

SELECT country, CLASS 
  FROM classes
 WHERE 1 = (CASE 
 	        WHEN 'Russia' IN (SELECT country
 	                            FROM classes)
 	        THEN 0
 	        ELSE 1
            END)
            
 UNION

SELECT country, CLASS 
  FROM classes
 WHERE country = 'Russia';