/* Перечислите номера моделей любых типов, 
 * имеющих самую высокую цену по всей имеющейся в базе данных продукции. */

  WITH all_models_with_prices AS (
	   SELECT model, price
	     FROM laptop
	   
	    UNION
	     
	   SELECT model, price
	     FROM pc
	     
	    UNION
	     
	   SELECT model, price
	     FROM printer)
SELECT model 
  FROM all_models_with_prices
 WHERE price IN (
 	   SELECT MAX(price)
 	     FROM all_models_with_prices);