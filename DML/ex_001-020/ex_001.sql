/* Добавить в таблицу PC следующую модель:
 * code: 20
 * model: 2111
 * speed: 950
 * ram: 512
 * hd: 60
 * cd: 52x
 * price: 1100 */

INSERT INTO product 
VALUES ('A', '2111', 'PC');

INSERT INTO pc
VALUES (20, '2111', 950, 512, 60, '52x', 1100);

DELETE
  FROM pc
 WHERE code = 20;
 
DELETE
  FROM product 
 WHERE model = '2111';