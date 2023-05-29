use hr;
-- DATA DEFINITION LANGUAGE (DDL) - сущности (таблица)
CREATE TABLE table1 (
first_name varchar(10),
last_name varchar(10),
number integer
)
-- varchar - текстas
-- integer - целые числа
-- numeric - для чисел с плавающей запятой

-- DATA MANIPULATION LANGUAGE (DML) - данные (строки)

INSERT INTO table1(
first_name, 
last_name, 
some_number
) VALUES (
'Sasha',
'Balitskaya',
31
)


CREATE VIEW view_for_table1 AS
	SELECT some_number FROM table1
    WHERE  some_number > 2;
    
    
-- UPDATE
UPDATE table1
	SET first_name = 'Vasya',
		last_name = 'Ivanov'
	WHERE last_name = 'Balitskaya';
    

-- goods, идентификатор, название, цена, количество

CREATE TABLE goods (
id integer,
goods_name varchar(128),
price integer,
qty integer
);

INSERT INTO goods(
id, 
goods_name, 
price,
qty
) VALUES (
1,
'Snowboard',
70000,
21
);
INSERT INTO goods(
id, 
goods_name, 
price,
qty
) VALUES (
2,
'Splitboard',
98000,
8
);
INSERT INTO goods(
id, 
goods_name, 
price,
qty
) VALUES (
3,
'ski',
96000,
25
);
INSERT INTO goods(
id, 
goods_name, 
price,
qty
) VALUES (
4,
'bicycle',
92000,
40
);

UPDATE goods
	SET price = 100000
	WHERE goods_name = 'bicycle';
    
DELETE FROM goods
WHERE id = 1;

DELETE FROM goods
WHERE TRUE; -- удалить все данныеa

TRUNCATE TABLE goods; -- удалить все данные, откатить до момента создания таблицыalter

CREATE TABLE Clients(
id integer,
first_name varchar(64),
last_name varchar(64),
phone varchar(64),
email varchar(64),
addres varchar(64)
);

CREATE TABLE Orders(
	id integer,
    clientId integer
);

CREATE TABLE Ordered_goods(
orderId integer,
goodsID integer,
qty integer
);

SELECT id FROM Orders
WHERE clientID = 1;

SELECT goodsID, qty FROM Ordered_goods
WHERE orderID = {id};

SELECT goods_name, price FROM goods
WHERE id IN {goodsID};

/*Orders, goods_locations, clients, delivery_parameters, discounts, payments, Orders*/

