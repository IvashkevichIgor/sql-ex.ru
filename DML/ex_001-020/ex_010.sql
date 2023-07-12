/* Добавить в таблицу PC те модели ПК из Product, которые отсутствуют в таблице PC.
 * При этом модели должны иметь следующие характеристики:
 * 1. Код равен номеру модели плюс максимальный код, который был до вставки.
 * 2. Скорость, объем памяти и диска, а также скорость CD должны иметь максимальные 
 * характеристики среди всех имеющихся в таблице PC.
 * 3. Цена должна быть средней среди всех ПК, имевшихся в таблице PC до вставки. */

INSERT INTO pc
SELECT CAST(model AS INT) + code AS code, 
       model, speed, ram, hd, cd, price
  FROM product, (SELECT MAX(code) AS code, 
                       MAX(speed) AS speed, 
                       MAX(ram) AS ram, 
                       MAX(hd) AS hd,
                       CAST(MAX(CAST(LEFT(cd, CHARINDEX('x', cd)-1) as INT)) AS varchar(5)) + 'x' AS cd,
                       AVG(price) AS price
                   FROM pc) AS v
 WHERE model NOT IN (SELECT model
                       FROM pc)
   AND type = 'PC'