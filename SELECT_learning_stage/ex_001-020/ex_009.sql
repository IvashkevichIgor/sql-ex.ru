/* Найдите производителей ПК с процессором не менее 450 Мгц.
 * Вывести: Maker */

SELECT DISTINCT maker 
  FROM product 
  	   JOIN pc
  	   ON (product.model = pc.model)
 WHERE speed >= 450