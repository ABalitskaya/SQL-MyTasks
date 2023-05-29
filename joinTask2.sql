use airport;

SELECT
	a.id,
    t.trip_code,
    a.model_name
FROM airliners a
LEFT JOIN trips t
ON a.id = t.airliner_id
WHERE t.trip_code IS NULL;


-- 3. Выведите список имен пассажиров, чей рейс был отложен. 
-- Предусмотрите в выборке аэропорт отправления.
-- В выборке должно присутствовать два атрибута — name, departure.
SELECT
	c.name,
    t.departure
FROM clients c
INNER JOIN tickets tc
ON c.id = tc.client_id
INNER JOIN trips t
ON tc.trip_id = t.id
WHERE t.status LIKE 'Delayed';

-- 4. Определите имена пассажиров и цену билета, класс обслуживания которого эконом-премиум.
-- В выборке должно присутствовать два атрибута — name, price.

SELECT
	c.name,
    t.price
FROM clients c
INNER JOIN tickets t
ON c.id = t.client_id
WHERE t.service_class LIKE '%Premium%';

-- 5. Вывести максимальную цену на билет среди рейсов на самолеты с максимальной дальностью полета (range_).
-- Вывести : max_price

select
 max(t1.price) as max_price
from tickets t1
inner join trips t2
on t1.trip_id = t2.id
inner join airliners t3
on t2.airliner_id = t3.id
where t3.range_ = (select max(range_) from airliners);

-- ДЗ
-- 1. Вывести количество Надежд ('Nadezhda') на самолетах в пути. Вывести : hope_count
-- 2. Найдите задержанные рейсы на самолеты с дальностью полета меньше 10000 километров. В выборке должен присутствовать один атрибут - id.
-- 3. Вывести пассажиров, которые хоть раз летали первым классом. Вывести : clients.id, clients.name
