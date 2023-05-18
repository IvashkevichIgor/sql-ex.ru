/* Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
 * Вывести: type, model, speed */

SELECT DISTINCT type, l.model, speed 
  FROM laptop AS l
	   JOIN product AS p
	   ON (l.model = p.model)
 WHERE speed < ALL 
 	   (SELECT speed
 	      FROM pc)