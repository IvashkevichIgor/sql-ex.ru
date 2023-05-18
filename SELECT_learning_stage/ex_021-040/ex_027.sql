/* Найдите средний размер диска ПК каждого из тех производителей,
 * которые выпускают и принтеры. Вывести: maker, средний размер HD. */

SELECT maker, AVG(hd)
  FROM product AS p
       JOIN pc
       ON (pc.model = p.model)
 GROUP BY maker
HAVING maker IN
       (SELECT DISTINCT maker
          FROM product
         WHERE type = 'Printer')