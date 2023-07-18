/* Для ПК с максимальным кодом из таблицы PC вывести 
 * все его характеристики (кроме кода) в два столбца:
 * - название характеристики (имя соответствующего столбца в таблице PC);
 * - значение характеристики */
                 
SELECT chr, value
  FROM pc CROSS JOIN LATERAL (VALUES('model', model), 
                                    ('speed', CAST(speed AS VARCHAR)), 
                                    ('ram', CAST(ram AS VARCHAR)), 
                                    ('hd', CAST(hd AS VARCHAR)),
                                    ('cd', CAST(cd AS VARCHAR)), 
                                    ('price', CAST(price AS VARCHAR))) AS poo(chr, value)
 WHERE pc.code = (SELECT MAX(code)
                    FROM pc);