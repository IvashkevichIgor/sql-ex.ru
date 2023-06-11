/* По таблицам Income и Outcome для каждого пункта приема найти остатки денежных средств на конец каждого дня,
 * в который выполнялись операции по приходу и/или расходу на данном пункте.
 * Учесть при этом, что деньги не изымаются, а остатки/задолженность переходят на следующий день.
 * Вывод: пункт приема, день в формате "dd/mm/yyyy", остатки/задолженность на конец этого дня. */

WITH cte AS (SELECT COALESCE(i.point, o.point) AS point,
			        COALESCE(i.date, o.date) AS date,
			        (CASE
			        WHEN day_inc IS NULL THEN 0
			        ELSE day_inc
			        END) -
			        (CASE
			        WHEN day_out IS NULL THEN 0
			        ELSE day_out
			        END) AS balance
			   FROM (SELECT point, date, SUM(inc) AS day_inc
			           FROM income
			          GROUP BY point, date) AS i
			        FULL JOIN (SELECT point, date, SUM(out) AS day_out
					             FROM outcome
					            GROUP BY point, date) AS o 
			        ON i.point = o.point
			        AND i.date = o.date
			  ORDER BY COALESCE(i.point, o.point), 
			           COALESCE(i.date, o.date))
SELECT point, TO_CHAR(date, 'dd/mm/yyyy') AS date,
       (SELECT SUM(balance)
          FROM cte 
         WHERE point = c.point
           AND date <= c.date) AS run_tot
  FROM cte AS c;
