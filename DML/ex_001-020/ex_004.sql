/* Для каждой группы блокнотов с одинаковым номером модели добавить запись в таблицу PC со следующими характеристиками:
 * код: минимальный код блокнота в группе +20;
 * модель: номер модели блокнота +1000;
 * скорость: максимальная скорость блокнота в группе;
 * ram: максимальный объем ram блокнота в группе *2;
 * hd: максимальный объем hd блокнота в группе *2;
 * cd: значение по умолчанию;
 * цена: максимальная цена блокнота в группе, уменьшенная в 1,5 раза.
 * Замечание. Считать номер модели числом. */

INSERT INTO pc (code, model, speed, ram, hd, price)
SELECT MIN(code) + 20,
       model + 1000, 
       MAX(speed), 
       MAX(ram) * 2,
       MAX(hd) * 2,
       MAX(price) / 1.5
  FROM laptop
 GROUP BY model;