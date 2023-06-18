/* Вывести все строки из таблицы Product, кроме трех строк с наименьшими 
 * номерами моделей и трех строк с наибольшими номерами моделей. */

SELECT *
  FROM product
 WHERE model NOT IN (SELECT model
                       FROM product
                      ORDER BY model LIMIT 3)
   AND model NOT IN (SELECT model
                       FROM product
                      ORDER BY model DESC LIMIT 3)
 ORDER BY maker, model;