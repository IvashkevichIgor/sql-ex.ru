/* Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
 * Замечания.
 * 1) A - B и B - A считать РАЗНЫМИ маршрутами.
 * 2) Использовать только таблицу Trip */

WITH foo AS (SELECT COUNT(town_to) AS total_route
               FROM trip
              GROUP BY town_from, town_to)
SELECT COUNT(total_route) AS max_route_tally
  FROM foo
 WHERE total_route = (SELECT MAX(total_route)
                        FROM foo);