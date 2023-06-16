/* Определить названия всех кораблей из таблицы Ships, 
 * которые удовлетворяют, по крайней мере, 
 * комбинации любых четырёх критериев из следующего списка:
 * 1. numGuns = 8
 * 2. bore = 15
 * 3. displacement = 32000
 * 4. type = bb
 * 5. launched = 1915
 * 6. class = Kongo
 * 7. country = USA */

SELECT name 
  FROM (SELECT name,
		       CASE WHEN numGuns = 8 THEN 1 ELSE 0 END AS ng,
		       CASE WHEN bore = 15 THEN 1 ELSE 0 END AS b,
		       CASE WHEN displacement = 32000 THEN 1 ELSE 0 END AS d,
		       CASE WHEN type = 'bb' THEN 1 ELSE 0 END AS t,
		       CASE WHEN launched = 1915 THEN 1 ELSE 0 END AS l,
		       CASE WHEN c."class" = 'Kongo' THEN 1 ELSE 0 END AS cl,
		       CASE WHEN country = 'USA' THEN 1 ELSE 0 END AS co
		  FROM ships AS s
		       JOIN classes AS c
		       ON s."class" = c."class") AS foo
 WHERE ng + b + d + t + l + cl + co >= 4;