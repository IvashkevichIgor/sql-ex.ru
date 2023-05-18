/* Найдите среднюю скорость ПК, выпущенных производителем A. */

SELECT AVG(speed) 
  FROM product 
       JOIN pc
       ON (product.model = pc.model)
 WHERE maker = 'A'