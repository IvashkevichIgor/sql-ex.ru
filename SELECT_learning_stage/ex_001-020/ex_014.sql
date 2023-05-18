/* Найдите класс, имя и страну для кораблей из таблицы Ships,
   имеющих не менее 10 орудий. */

SELECT classes.class, name, country 
  FROM classes 
       JOIN ships
       ON (classes.class = ships.class)
 WHERE numGuns >= 10