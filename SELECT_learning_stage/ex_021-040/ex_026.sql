/* Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква).
 * Вывести: одна общая средняя цена. */

SELECT AVG(price) AS average_price
  FROM (SELECT price
          FROM pc
               JOIN product AS p
               ON (pc.model = p.model)
         WHERE maker = 'A'

         UNION ALL

        SELECT price
          FROM laptop AS l
               JOIN product AS p
               ON (l.model = p.model)
         WHERE maker = 'A') AS prices