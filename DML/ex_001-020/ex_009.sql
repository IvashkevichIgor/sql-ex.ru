/* Измените данные в таблице Classes так, чтобы калибры орудий измерялись в
 * сантиметрах (1 дюйм=2,5см), а водоизмещение в метрических тоннах (1
 * метрическая тонна = 1,1 тонны). Водоизмещение вычислить с точностью до
 * целых. */

UPDATE classes
   SET bore = 2.5 * bore,
       displacement = ROUND(displacement / 1.1, 0);