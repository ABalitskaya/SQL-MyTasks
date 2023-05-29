-- min/max и т.д. работают только с select
use airport;

-- 1. Вывести количество Надежд ('Nadezhda') на самолетах в пути. Вывести : hope_count
SELECT
	count(*) as hope_count
FROM clients t1
INNER JOIN tickets t2
ON t1.id = t2.client_id
INNER JOIN trips t3
ON t2.trip_id = t3.id
WHERE t1.name like 'Nadezhda%' and t3.status = 'Departed';
    
    
-- 2. Найдите задержанные рейсы на самолеты 
-- с дальностью полета меньше 10000 километров. 
-- В выборке должен присутствовать один атрибут - id.

SELECT
	id
FROM trips
WHERE status = 'Delayed' 
and airliner_id in
(
SELECT
	id
FROM airliners
WHERE range_ < 10000
); 

SELECT 
 t1.id
FROM trips t1
INNER JOIN airliners t2
ON t1.airliner_id = t2.id
WHERE t2.range_ < 10000
and t1.status = 'Delayed';

-- 3. Вывести пассажиров, которые хоть раз летали первым классом. 
-- Вывести : clients.id, clients.name

SELECT 
	t1.id,
    t1.name
FROM clients t1
INNER JOIN tickets t2
ON t1.id = t2.client_id
WHERE t2.service_class = 'FirstClass';	

-- 1. Найдите билеты на рейсы из аэропорта Саратова (код аэропорта RTW). 
-- В выборке должен присутствовать один атрибут - id.

SELECT t1.id
FROM tickets t1
INNER JOIN trips t2
ON t1.trip_id = t2.id
WHERE t2.departure = 'RTW';


SELECT id
FROM tickets
WHERE trip_id IN
(
SELECT id
FROM trips
WHERE departure = 'RTW');

-- 2. Найдите самолеты, построенные позже 1990 года
-- и хотя бы раз слетавшие в Домодедово (код аэропорта DME).
-- В выборке должны присутствовать три атрибута: 
-- id, model_name, production_year.

SELECT 
	t1.id,
    t1.model_name,
    t1.production_year
FROM airliners t1
INNER JOIN trips t2
ON t2.airliner_id = t1.id
WHERE t1.production_year > 1990 and t2.arrival LIKE 'DME';

SELECT
	id,
    model_name,
    production_year
FROM airliners
WHERE id IN 
(
SELECT
	airliner_id 
    FROM trips
    WHERE arrival = 'DME')
and production_year > 1990;

-- 3. Выведите максимальную цену билета на самолет 
-- до Домодедово ('DME')
-- Вывести: max_price

SELECT max(t1.price) as max_price
FROM tickets t1
INNER JOIN trips t2
ON t1.trip_id = t2.id
WHERE t2.departure = 'DME';

-- ДЗ
-- 1. Вывести количество рейсов, сделанных на белых самолетах.
-- Вывести : count
-- 2. Выведите пассажиров, которые хоть раз летали на самолете, зарегистрированном в России.
-- Вывести : id (клиента), name (клиента)
-- 3. Выведите бортовые номера всех самолетов, которые зарегистрированы не в России. Добавьте в выборку самолеты, зарегистрированные в России, которые произведены не в 2005 и не в 2008 году и дальность полета которых больше 5000 км.
-- В выборке должен присутствовать один атрибут — side_number.
-- 4. Найдите всех пассажиров с фамилией Volkov или Volkova, возраст которых от 21 до 25 включительно.
-- В выборке должен присутствовать один атрибут — id.

