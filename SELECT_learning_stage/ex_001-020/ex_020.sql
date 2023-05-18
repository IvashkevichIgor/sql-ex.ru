/* Найдите производителей, выпускающих по меньшей мере три различных модели ПК.
 * Вывести: Maker, число моделей ПК. */

SELECT maker, COUNT(DISTINCT model) AS models_tally
  FROM product
 WHERE type = 'PC'
 GROUP BY maker
HAVING COUNT(DISTINCT model) >= 3;