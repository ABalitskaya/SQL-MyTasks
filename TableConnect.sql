use hr;

-- CONSTRAINT - ограничения, которые задаем на таблицу
-- Ограничения на поля: NOT NULL, UNIQUE
-- PRIMARY KEY - ключ, идентификатор, на него можно ссылаться из другой таблицы
-- CHECK - проверка
-- FOREIGN KEY

CREATE TABLE goods(
	id integer PRIMARY KEY,
    good_name varchar(128) UNIQUE NOT NULL,
    qty integer NOT NULL CHECK(qty >= 0),
    price integer NOT NULL CHECK (price > 0)
); 

CREATE TABLE users(
id integer PRIMARY KEY,
user_name  varchar(128) UNIQUE NOT NULL,
first_name varchar(128) NOT NULL,
last_name varchar(128) NOT NULL,
phone varchar(128) NOT NULL UNIQUE,
email varchar(128) NOT NULL UNIQUE,
addres varchar(256) NOT NULL,
user_age integer CHECK (user_age>=18),
CONSTRAINT unique_fullName
	UNIQUE(first_name, last_name),
CONSTRAINT isAdult
	CHECK (user_age >= 18 AND user_age < 200)

);

CREATE TABLE orders(
id integer PRIMARY KEY,
clientId integer NOT NULL,
delivery_status boolean,
totalPrice integer NOT NULL,
CONSTRAINT clientId_fk
	FOREIGN KEY(clientId)
    references users(id)  -- так ссылается на таблицу users --
);

CREATE TABLE orderedGoods(
order_id integer NOT NULL,
good_id integer NOT NULL,
qty integer NOT NULL CHECK(qty > 0),
PRIMARY KEY (order_id, good_id),
FOREIGN KEY (order_id)
	REFERENCES orders(id),
FOREIGN KEY (good_id)
	REFERENCES goods(id)
);

-- на конкретный товар для конкретного пользователя
CREATE TABLE discount_personal(
discount integer NOT NULL,
discount_status boolean,
good_id integer NOT NULL,
user_id integer NOT NULL,
PRIMARY KEY (user_id, good_id), 
FOREIGN KEY (user_id)
	REFERENCES users(id),
FOREIGN KEY (good_id)
	REFERENCES goods(id)
);

CREATE TABLE goods_discount(
discount integer NOT NULL,
discount_status boolean,
good_id integer NOT NULL,
PRIMARY KEY (good_id, last_date),
FOREIGN KEY (good_id)
	REFERENCES goods(id),
dateEnd integer NOT NULL
);

CREATE TABLE pers_discount (
discountId integer PRIMARY KEY,
discount integer NOT NULL,
discount_status boolean,
user_id integer NOT NULL,
FOREIGN KEY (user_id)
	REFERENCES users(id)
);

-- * вывести названия товаров в определенном заказе клиента
-- * AUTO_INCREMENT - изучить, где стоит его применить в этой базе данных
-- заполнить таблицу пользователей
-- заполнить таблицу товаров
-- заполнить таблицу заказов
-- опционально заполнить таблицы скидок
-- вывести идентификаторы товаров в конкретном заказе
-- вывести все скидки discounts_dated на конкретный товар
--  вывести все скидки discounts_personal для конкретного пользователя