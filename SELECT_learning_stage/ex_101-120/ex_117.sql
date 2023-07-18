/* По таблице Classes для каждой страны найти максимальное значение среди трех выражений:
 * numguns*5000, bore*3000, displacement.
 * Вывод в три столбца:
 * - страна;
 * - максимальное значение;
 * - слово `numguns` - если максимум достигается для numguns*5000, 
 * слово `bore` - если максимум достигается для bore*3000,
 * слово `displacement` - если максимум достигается для displacement.
 * Замечание. Если максимум достигается для нескольких выражений, 
 * выводить каждое из них отдельной строкой. */

SELECT country, max_val, title
  FROM (SELECT country, max_val, title,
               MAX(max_val) OVER(PARTITION BY country) AS total_max
          FROM (SELECT country, 
                       MAX(numguns) * 5000 AS numguns, 
                       MAX(bore) * 3000 AS bore,  
                       MAX(displacement) AS displacement
                  FROM classes
                 GROUP BY country) AS foo1
                CROSS JOIN LATERAL (VALUES (numguns, 'numguns'),
                                           (bore, 'bore'),
                                           (displacement, 'displacement')) AS foo2(max_val, title)) AS foo3
 WHERE max_val = total_max;