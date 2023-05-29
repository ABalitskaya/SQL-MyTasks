use hr;



SELECT 
	g.good_name,
    (og.qty / g.qty) as percent, -- вывести долю заказанного товара от доли товара на складе в процентах
    g.price,
    us.first_name
    FROM orderedGoods og -- og - алиас таблицы, используется вместо названия
INNER JOIN goods g -- g - это алиас таблички goods
ON og.good_id = g.id -- выведет все имена товаров из заказов
WHERE og.order_id = 1;

SELECT 
	o.delivery_status,
	g.good_name,
    u.first_name,
    u.last_name,
    (og.qty / g.qty) as percent, 
    g.price,
    o.delivery_status
    FROM orderedGoods og 
INNER JOIN users u
ON o.clientId = u.id 
INNER JOIN orders o
ON og.order_id = o.id
INNER JOIN goods g
ON og.good_id = g.id 
WHERE og.order_id = 1;

SELECT 
		g.good_name,
        dd.last_date,
        g.price,
        dd.discount,
        g.price * (1 - dd.discount / 100) as discounted_price
FROM discounts_dated dd
INNER JOIN goods g
ON dd.good_id = g.id;

SELECT
	g.good_name,
    dd.last_date,
	g.price,
	dd.discount,
    g.price * (1 - dd.discount / 100) as discounted_price
FROM discounts_dated dd
INNER JOIN goods g
ON dd.good_id = g.id and dd.last_date >=5;

SELECT
	e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT
	e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id and d.department_name IN ('IT','Treasury','IT Support');

-- SELF JOIN
SELECT
	e1.first_name,
    e1.last_name,
    e2.first_name as manager_first_name,
    e2.last_name as manager_last_name
FROM employees e1
INNER JOIN employees e2
ON e1.manager_id = e2.employee_id;

-- SELF JOIN 
-- выберет всех детей родителя
SELECT 
	child.first_name,
    child.last_name,
    parent.first_name,
    parent.last_name
FROM humans child
INNER JOIN humans parent
ON child.parent_id = parent.id;

-- синтаксис для SELF JOIN
-- выведет пары всех, кто живет в одном городе (и не один и тот же человек)
SELECT 
	a.first_name,
    a.last_name,
    b.first_name,
    b.last_name
FROM humans a, humans a
WHERE a.city = b.city
AND a.id <> b.id
