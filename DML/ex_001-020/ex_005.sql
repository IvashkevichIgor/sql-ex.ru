/* Удалить из таблицы PC компьютеры, имеющие минимальный объем диска или памяти. */

DELETE
  FROM pc 
 WHERE hd = (SELECT MIN(hd)
               FROM pc)
    OR ram = (SELECT MIN(ram)
                FROM pc);