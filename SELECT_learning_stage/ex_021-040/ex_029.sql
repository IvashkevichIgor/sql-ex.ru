/* В предположении, что приход и расход денег на каждом пункте приема 
 * фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], 
 * написать запрос с выходными данными (пункт, дата, приход, расход).
 * Использовать таблицы Income_o и Outcome_o. */

SELECT COALESCE (io.point, oo.point) AS point, 
       COALESCE (io.date, oo.date) AS date,
       inc, out
  FROM income_o AS io
       FULL JOIN outcome_o AS oo
       ON io.point = oo.point
          AND io.date = oo.date