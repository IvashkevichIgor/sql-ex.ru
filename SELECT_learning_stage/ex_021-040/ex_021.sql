/* Найдите максимальную цену ПК, выпускаемых каждым производителем,
 * у которого есть модели в таблице PC.
 * Вывести: maker, максимальная цена. */

SELECT maker, MAX(price)
  FROM product
       JOIN pc
       ON (product.model = pc.model)
 GROUP BY maker