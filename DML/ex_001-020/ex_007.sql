/* Производство принтеров производитель A передал производителю Z. 
 * Выполнить соответствующее изменение. */

UPDATE product
   SET maker = 'Z'
 WHERE type = 'Printer'
   AND maker = 'A';