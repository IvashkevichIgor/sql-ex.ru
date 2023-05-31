/* Определить названия всех кораблей из таблицы Ships,
 * которые могут быть линейным японским кораблем,
 * имеющим число главных орудий не менее девяти, калибр орудий 
 * менее 19 дюймов и водоизмещение не более 65 тыс.тонн */

SELECT name
  FROM ships AS s
       JOIN classes AS c
       ON s.class = c.class
       WHERE country = 'Japan'
         AND type = 'bb'
         AND (numGuns >= 9
             OR numGuns IS NULL)
         AND (bore < 19
             OR bore IS NULL)
         AND (displacement <= 65000
             OR displacement IS NULL);