/* В таблице Product найти модели, которые состоят только из цифр
 * или только из латинских букв (A-Z, без учета регистра).
 * Вывод: номер модели, тип модели. */

SELECT model, type
  FROM product
 WHERE model LIKE '%[0-9]%'
   AND model NOT LIKE '%[^0-9]%'
    OR (model LIKE '%[A-Za-z]%'
   AND model NOT LIKE '%[^A-Za-z]%');