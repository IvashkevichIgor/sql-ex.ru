/* Найдите корабли, `сохранившиеся для будущих сражений`;
 * т.е. выведенные из строя в одной битве (damaged),
 * они участвовали в другой, произошедшей позже. */

SELECT DISTINCT ship
  FROM (SELECT * 
          FROM outcomes AS o
               JOIN battles AS b
               ON (o.battle = b.name)) AS foo
 WHERE result = 'damaged'
   AND EXISTS
       (SELECT ship
          FROM outcomes AS o
               JOIN battles AS b
               ON (o.battle = b.name)
         WHERE ship = foo.ship
           AND date > foo.date);
