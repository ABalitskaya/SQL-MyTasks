use airliners ;

-- 1. Для каждого самолета модели Cessna 172 выведите дальность полета. Имя столбца с результатом должно быть max_distance.
-- В выборке должен присутствовать один атрибут — max_distance.
SELECT * FROM airliners;
SELECT range_ as max_distance 
	FROM airliners
WHERE model_name = 'Cessna 172';

-- 2. Напишите запрос, который выведет id клиентов, чье значение атрибута name начинается на Daria.
-- В выборке должен присутствовать один атрибут — id.
SELECT * FROM clients;
SELECT id FROM clients WHERE name like 'Daria%';

-- 3. Определите билеты бизнес-класса, цена которых не находится в диапазоне от 9100 до 70 400 включительно.
-- В выборке должны присутствовать два атрибута — id и price.
SELECT * FROM tickets;
SELECT id, price FROM tickets WHERE ((price not between 9100 and 70400) and (service_class = 'Business'));

-- 4. Определите имена и фамилии пассажиров, чьи идентификаторы заканчиваются на RCB или FCV, а номера телефонов не начинаются на +705.
-- В выборке должен присутствовать один атрибут — name.
SELECT name FROM clients
WHERE ((id like '%RCB') or (id like '%FCV'))
and phone not like '+705%';

-- 5. Разделите самолеты на три класса по возрасту. 
-- Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. 
-- Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
-- Более новые самолеты отнесите к классу 'New'. 
-- Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. Отсортируйте выборку по классу возраста в порядке возрастания.
-- В выборке должны присутствовать два атрибута — side_number, age.
SELECT * FROM airliners;

SELECT side_number,
CASE
    WHEN production_year < 2000
		THEN 'Old'
	WHEN production_year between 2000 and 2010
		THEN 'Mid'
	ELSE 'New' 
END  as age
FROM airliners
WHERE range_ <= 10000
order by age;





