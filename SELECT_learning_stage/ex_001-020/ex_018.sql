/* Найдите производителей самых дешевых цветных принтеров.
 * Вывести: maker, price */

SELECT DISTINCT maker, price
  FROM product 
       JOIN printer
       ON (product.model = printer.model)
 WHERE color = 'y' 
   AND price IN 
       (SELECT MIN(price)
          FROM printer
         WHERE color = 'y')