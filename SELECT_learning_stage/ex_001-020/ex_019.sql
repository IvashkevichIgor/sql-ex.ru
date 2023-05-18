/* Для каждого производителя, имеющего модели в таблице Laptop,
 * найдите средний размер экрана выпускаемых им ПК-блокнотов.
 * Вывести: maker, средний размер экрана. */

SELECT maker, AVG(screen) AS average_screen
  FROM laptop 
  	   JOIN product
  	   ON (laptop.model = product.model)
 GROUP BY maker