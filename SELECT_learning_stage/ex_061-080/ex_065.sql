/* Пронумеровать уникальные пары {maker, type} из Product, 
 * упорядочив их следующим образом:
 * - имя производителя (maker) по возрастанию;
 * - тип продукта (type) в порядке PC, Laptop, Printer.
 * Если некий производитель выпускает несколько типов продукции, 
 * то выводить его имя только в первой строке;
 * остальные строки для ЭТОГО производителя должны содержать пустую строку символов (''). */

SELECT num, 
       CASE maker_tally
       WHEN 1 THEN maker
       ELSE ''
       END AS maker,
       type
  FROM (SELECT ROW_NUMBER () OVER (ORDER BY maker,
                                   CASE TYPE 
		                           WHEN 'PC' THEN 1
		                           WHEN 'Laptop' THEN 2
		                           WHEN 'Printer' THEN 3
		                           END) AS num,
		       ROW_NUMBER () OVER (PARTITION BY maker 
		                           ORDER BY maker) AS maker_tally,
		       maker, type 
		  FROM (SELECT DISTINCT maker, TYPE
		          FROM product) AS p) AS d;