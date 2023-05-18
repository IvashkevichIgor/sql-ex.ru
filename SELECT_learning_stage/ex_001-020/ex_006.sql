/* Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт,
 * найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.*/

SELECT DISTINCT maker, speed 
  FROM product AS p
  	   INNER JOIN laptop AS l
	   ON (p.model = l.model)
 WHERE l.hd >= 10