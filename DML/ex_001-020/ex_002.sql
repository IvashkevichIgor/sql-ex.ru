/* Добавить в таблицу Product следующие продукты производителя Z:
 * принтер модели 4003, ПК модели 4001 и блокнот модели 4002 */

INSERT INTO product
SELECT 'Z' AS maker, '4003' AS model, 'Printer' AS type 

 UNION ALL

SELECT 'Z', '4001', 'PC'

 UNION ALL

SELECT 'Z', '4002', 'Laptop';

SELECT * 
  FROM product;

DELETE
  FROM product
 WHERE maker = 'Z';
