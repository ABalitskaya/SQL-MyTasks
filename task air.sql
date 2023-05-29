drop table airliners;
create database airport;
use airport;

CREATE TABLE airliners (
  id VARCHAR(128) PRIMARY KEY,
  model_name VARCHAR(128),
  range_ INTEGER,
  production_year INTEGER,
  color VARCHAR(128),
  side_number VARCHAR(128),
  country VARCHAR(128)
);

CREATE TABLE trips (
  id VARCHAR(128) PRIMARY KEY,
  trip_code VARCHAR(128),
  departure VARCHAR(128),
  arrival VARCHAR(128),
  status VARCHAR(128),
  airliner_id VARCHAR(128)
);

CREATE TABLE clients (
  id VARCHAR(128) PRIMARY KEY,
  name VARCHAR(128),
  phone VARCHAR(128),
  age INTEGER
);

CREATE TABLE tickets (
  id VARCHAR(128) PRIMARY KEY,
  trip_id VARCHAR(128),
  service_class VARCHAR(128),
  price INTEGER,
  client_id VARCHAR(128)
);

/*. Выведите коды всех рейсов, в рамках которых воздушные судна вылетели из Москвы и в данный момент находятся в воздухе (статус таких рейсов —  departed). 
-- Коды аэропортов Москвы: SVO, VKO, DME.
-- В выборке должен присутствовать один атрибут — trip_code.
*/

SELECT trip_code from airport.trips WHERE status  = "departed" AND departure IN ("SVO", "VKO", "DME");

/*Выведите идентификаторы билетов бизнес-класса дешевле 15 000 и экономкласса дороже 65 000. 
-- Исключите из выборки билеты рейсов VR5SF5YIWN, OZAO28DLFP и LL4S1G8PQW, так как для них ценовая политика не меняется.
-- В выборке должен присутствовать один атрибут — id.
*/ 
SELECT * FROM tickets;
SELECT id FROM tickets WHERE ((service_class = "Business" AND price > 15000) OR (service_class = "Economy" AND price < 65000)) AND trip_id NOT IN ("VR5SF5YIWN", "OZAO28DLFP", "LL4S1G8PQW");

/*Разделите самолеты на ближне-, средне- и дальнемагистральные. 
-- Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
-- Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. 
-- Дальнемагистральными — с дальностью полета > 6000 км. 
-- В выборке должно быть два столбца, где в первом указана модель самолета. 
-- Во втором, category, — категория, со значениями short-haul, medium-haul, long-haul (ближне-, средне- и дальнемагистральные соответственно). Каждый самолет точно попадает ровно в одну категорию.
-- В выборке должны присутствовать два атрибута — model_name, category.
*/

SELECT model_name,
	CASE 
		WHEN range_ BETWEEN 1001 and 2500
			THEN "short-haul"
		WHEN range_ BETWEEN 2501 and 6000
			THEN "medium-haul"
		WHEN range_ > 6000
			THEN "long-haul"
		END as category
        FROM airliners;
        
        SELECT range_ from airliners;
        
        /*Отсортируйте данные о билетах в зависимости от цены по возрастанию. 
-- Если некоторые билеты имеют одинаковую цену, отсортируйте вхождения по trip_id по убыванию. 
-- Если и цена, и trip_id одинаковые, отсортируйте вхождения по номеру билета по возрастанию.
-- В выборке должны присутствовать три атрибута — id, trip_id, price.
*/

SELECT id, trip_id, price FROM tickets ORDER BY price, trip_id desc, id;