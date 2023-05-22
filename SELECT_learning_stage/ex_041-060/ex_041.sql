/* Для каждого производителя, у которого присутствуют модели 
 * хотя бы в одной из таблиц PC, Laptop или Printer,
 * определить максимальную цену на его продукцию.
 * Вывод: имя производителя, если среди цен на продукцию данного
 * производителя присутствует NULL, то выводить для этого производителя NULL,
 * иначе максимальную цену. */

SELECT maker,
       CASE 
       WHEN COUNT(model) > COUNT(price)
       THEN NULL
       ELSE MAX(price)
       END AS maximum_price
  FROM (SELECT maker, p.model, price
        FROM product AS p
             JOIN pc
             ON p.model = pc.model

     UNION ALL

     SELECT maker, p.model, price
       FROM product AS p
            JOIN laptop AS l
            ON p.model = l.model

     UNION ALL

     SELECT maker, p.model, price
       FROM product AS p
            JOIN printer
            ON p.model = printer.model) AS all_models_with_prices
 GROUP BY maker;

