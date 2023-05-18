/* Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) 
 * производителя B (латинская буква).*/

SELECT p.model, price
  FROM product AS p
	   JOIN laptop AS l
	   ON (p.model = l.model)
 WHERE maker = 'B'
 
 UNION
 
SELECT p.model, price
  FROM product AS p
	   JOIN pc
	   ON (p.model = pc.model)
 WHERE maker = 'B'

 UNION
 
SELECT p.model, price
  FROM product AS p
   	   JOIN printer
   	   ON (p.model = printer.model)
 WHERE maker = 'B'