/* Для каждого производителя перечислить в алфавитном порядке 
 * с разделителем "/" все типы выпускаемой им продукции.
 * Вывод: maker, список типов продукции */

SELECT maker,
       ARRAY_TO_STRING(ARRAY_AGG(DISTINCT "type" ORDER BY "type"),'/') AS "types"
  FROM product
 GROUP BY maker
 ORDER BY maker;