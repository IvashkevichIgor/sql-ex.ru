/* Для тех производителей, у которых есть продукты с известной ценой 
 * хотя бы в одной из таблиц Laptop, PC, Printer найти максимальные цены 
 * на каждый из типов продукции.
 * Вывод: maker, максимальная цена на ноутбуки, максимальная цена на ПК, 
 * максимальная цена на принтеры.
 * Для отсутствующих продуктов/цен использовать NULL. */

SELECT maker, 
       MAX(l.price) AS laptop_max_price,
       MAX(pc.price) AS pc_max_price, 
       MAX(pr.price) AS printer_max_price
  FROM product AS p
       LEFT JOIN laptop AS l
       ON p.model = l.model
       LEFT JOIN pc
       ON p.model = pc.model
       LEFT JOIN printer AS pr
       ON p.model = pr.model
 GROUP BY maker
HAVING MAX(l.price) IS NOT NULL
       OR MAX(pc.price) IS NOT NULL
       OR MAX(pr.price) IS NOT NULL;