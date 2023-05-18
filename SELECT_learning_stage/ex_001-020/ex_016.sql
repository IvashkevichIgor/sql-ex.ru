/* Найдите пары моделей PC, имеющих одинаковые скорость и RAM.
 * В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i).
 * Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM. */

SELECT DISTINCT pc.model AS model_1, pc1.model AS model_2, 
	   pc.speed, pc.ram
  FROM pc, 
  	   (SELECT model, speed, ram 
  	      FROM pc) AS pc1
 WHERE pc.speed = pc1.speed
   AND pc.ram = pc1.ram
   AND pc.model > pc1.model