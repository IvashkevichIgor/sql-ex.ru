/* Для каждого типа продукции и каждого производителя из таблицы Product 
 * c точностью до двух десятичных знаков найти процентное отношение числа 
 * моделей данного типа данного производителя к общему числу моделей этого 
 * производителя.
 * Вывод: maker, type, процентное отношение числа моделей данного типа 
 * к общему числу моделей производителя */
 
WITH cte AS (SELECT maker, "type" , COUNT(model) AS type_tally
			   FROM product
			  GROUP BY maker, "type" 
			 HAVING "type" = 'PC'
			 
			  UNION
			 
			 SELECT maker, "type" , COUNT(model) AS type_tally
			   FROM product
			  GROUP BY maker, "type" 
			 HAVING "type" = 'Laptop'
			
			  UNION
			 
			 SELECT maker, "type" , COUNT(model) AS type_tally
			   FROM product
			  GROUP BY maker, "type" 
			 HAVING "type" = 'Printer')   
SELECT DISTINCT p.maker, poo."type", 
       COALESCE (CAST(type_tally * 100.0 / total_tally AS NUMERIC(6,2)), 0.00) AS "percent"
  FROM product AS p
       CROSS JOIN (SELECT "type"
                     FROM product) AS poo
       LEFT JOIN cte
       ON cte.maker = p.maker
       AND cte."type" = poo."type"
       LEFT JOIN (SELECT maker, COUNT(model) AS total_tally
                    FROM product
                   GROUP BY maker) AS foo 
       ON cte.maker = foo.maker   