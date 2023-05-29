use hr;

-- GROUP BY работает только с аггрегированными полями
-- COUNT(*) считает все строки не null
-- нельзя делать WHERE по аггрегированным полям
-- HAVING то же, что WHERE, но для аггрегированных функций

SELECT 
	department_id, 
    COUNT(*) 
FROM employees
GROUP BY department_id;

SELECT 
	department_id, 
    COUNT(*) as empl_count
FROM employees
GROUP BY department_id
HAVING empl_count > 10;

-- Найдите имена и фамилии сотрудников с максимальной зарплатой
-- в каждом департаменте HR.EMPLOYEES

SELECT
	e1.first_name,
    e1.last_name,
    e1.department_id,
    e2.max_salary
FROM employees e1
INNER JOIN (
	SELECT
    department_id,
    max(salary) as max_salary
    FROM employees
    GROUP BY department_id
) e2
ON e1.department_id = e2.department_id
AND e1.salary = e2.max_salary;

SELECT
	e1.first_name,
    e1.last_name,
    e1.department_id,
    e1.salary
FROM employees e1
INNER JOIN (
	SELECT
    department_id,
    min(salary) as min_salary,
    max(salary) as max_salary
    FROM employees
    WHERE commission_pct > 0
    GROUP BY department_id
    HAVING max_salary > 10000
) e2
ON e1.department_id = e2.department_id
AND (e1.salary = e2.max_salary
	or e1.salary = e2.min_salary)
-- WHERE e2.max_salary > 10000
ORDER BY e1.department_id;

/*
Выведите название отделов с кол-вом сотрудников больше 10
*/

SELECT
	d.department_name,
    count(e.employee_id)
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING count(e.employee_id) > 10;

SELECT
	d.department_name,
    e.e_count
FROM departments d
INNER JOIN (
	SELECT 
		department_id,
        count(*) as e_count
    FROM employees
	GROUP BY department_id
	HAVING e_count > 10) e
ON d.department_id = e.department_id;

-- Найти количество сотрудников у каждого менеджера. 
-- Вывести manager_id и employees_cnt

SELECT
	e.manager_id,
    count(e.employee_id)
FROM employees e
INNER JOIN employees e1
ON e.employee_id = e1.employee_id
GROUP BY e.manager_id;

SELECT
	manager_id,
    count(*)
FROM employees
GROUP BY manager_id;

SELECT
	e1.first_name,
    e1.last_name,
    e2.count_of
FROM employees e1
INNER JOIN (SELECT
	manager_id,
    count(*) as count_of
    FROM employees
    GROUP BY manager_id
) e2
ON e1.employee_id = e2.manager_id;

SELECT 
	t2.id,
    sum(good_id),
    sum(qty)
FROM orderedgoods t1
INNER JOIN orders t2
ON t1.order_id = t2.id
GROUP BY t2.id;

SELECT 
	 og.order_id,
	 count(og.good_id),
     sum(og.qty * g.price)
FROM orderedgoods og
INNER JOIN goods g
ON g.id = og.good_id
GROUP BY order_id;

SELECT *
FROM orderedgoods og
INNER JOIN goods g
ON g.id = og.good_id;

-- Вывести количество каждог проданного товара

SELECT
	good_id,
	sum(qty) as count
FROM orderedgoods
GROUP BY good_id;

-- Вывести колличество каждого проданного товара 
SELECT  og.good_id,
		g.goods_name,
		sum(og.qty)
FROM orderedgoods og
INNER JOIN goods g
ON g.id = og.good_id
GROUP BY og.good_id;

-- ----

SELECT  g.id,
		g.goods_name,
        gg.qty_goods
FROM goods g
INNER JOIN (SELECT good_id, sum(qty) as qty_goods
					FROM orderedgoods 
					GROUP BY good_id) gg
ON g.id = gg.good_id;
    