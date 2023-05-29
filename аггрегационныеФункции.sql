-- count() - количество строк not null
-- count(Distinct) - количество уникальных значений
-- summ() - сумма значений
-- avg() - среднее арифметическое
-- max()
-- min()

use hr;

SELECT 
	max(salary),
    min(salary),
    avg(salary),
    count(salary),
    sum(salary)
FROM employees;

-- средняя цена наших goods

SELECT 
	avg(price)
FROM goods;

INSERT INTO employees
(employee_id,
first_name,
last_name,
email,
phone_NUMERIC,
job_id,
salary,
commission_pct,
manager_id,
department_id) VALUES (
1289,
'Ilia',
'Chavchavadze',
null,
83782347239,
2,
null,
0.2,
87,
5
);

SELECT 
	avg(salary)
FROM employees;

SELECT
	first_name,
    last_name,
    salary
FROM employees
WHERE salary > (SELECT avg(salary) from employees);

-- вывести количество сотрудников, у которых зарплата выше средней
SELECT count(salary) FROM employees
WHERE salary > (SELECT avg(salary) FROM employees);

-- вывести на сколько нужно увеличить зарплатный бюджет,
-- что бы повысить зарплату всем сотрудникам, которые получают меньше среднего
-- до текущего среднего

SELECT 
	sum((SELECT avg(salary) FROM employees) - salary) as diff
FROM employees
WHERE salary < (SELECT avg(salary) from employees);


SELECT
	first_name,
    last_name,
    salary as old_salary,
    salary - 
		(SELECT 
			sum((SELECT avg(salary) FROM employees) - salary) /
				(SELECT
					count(salary)
				FROM employees
				WHERE salary > (SELECT avg(salary) FROM employees))
		FROM employees
		WHERE salary < (SELECT avg(salary) FROM employees)) as new_salary	
FROM employees
WHERE salary > (SELECT avg(salary) FROM employees);

SELECT
	first_name,
    last_name,
    salary
FROM employees
WHERE salary = (SELECT max(salary) FROM employees);
	
SELECT
	first_name, 
    last_name,
    salary
FROM employees
WHERE
	salary = (SELECT max(salary) FROM employees
	WHERE salary < (SELECT max(salary) FROM employees));
	
SELECT * FROM employees
LIMIT 1;

-- LIMIT - выводит нужное количество строк: LINIT 3 (3 строки выведет)

SELECT * FROM employees
LIMIT 3,2; -- отступить три строки и вывести следующие две

SELECT 
	first_name,
    last_name,
    salary
FROM employees ORDER BY salary desc
LIMIT 1,1;

-- Вычислить медианную зарплату (50 персентиль)

SET@a = (SELECT count(salary)/2 FROM employees);
PREPARE statement FROM '
SELECT
	salary
FROM employees  
ORDER BY salary
LIMIT ?,1';
EXECUTE statement USING @a;

-- найти среднюю зарплату среди 10 больше всего зарабатывающих сотрудников

SELECT
	avg(t1.salary)
FROM (
	SELECT salary 
    FROM employees 
    ORDER BY salary desc
    LIMIT 10) t1;
    
-- найти департамент, у сторудников которого самая высокая 
-- средняя зарплата

SELECT
	d.department_name,
    (SELECT avg(salary) FROM employees e
    WHERE e.department_id = d.department_id
    ) as avg_salary
FROM departments d
ORDER BY avg_salary desc
LIMIT 1;

