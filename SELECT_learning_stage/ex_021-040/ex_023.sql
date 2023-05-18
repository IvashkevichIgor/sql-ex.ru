/* Найдите производителей, которые производили бы как ПК 
 * со скоростью не менее 750 МГц, так и ПК-блокноты
 * со скоростью не менее 750 МГц.
 * Вывести: Maker */

SELECT DISTINCT maker
  FROM product 
       JOIN pc
       ON (product.model = pc.model)
 WHERE speed >= 750
   AND maker in
       (SELECT maker 
		  FROM product 
		       JOIN laptop
		       ON (product.model = laptop.model)
         WHERE speed >= 750)