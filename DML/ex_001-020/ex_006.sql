/* Удалить все блокноты, выпускаемые производителями,
 * которые не выпускают принтеры. */

DELETE
  FROM laptop
 WHERE model IN (SELECT model
                   FROM product
                        NATURAL JOIN laptop
                  WHERE maker NOT IN (SELECT DISTINCT maker
                                        FROM product
                                       WHERE type = 'Printer'))