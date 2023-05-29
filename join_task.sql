use hr;
SELECT
	e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
ON  e.department_id = d.department_id;

SELECT
	e.first_name,
    e.last_name,
    l.city
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
INNER JOIN locations l
ON l.location_id = d.location_id;

SELECT
	e.first_name,
    e.last_name,
    l.city,
    r.region_name
FROM employees e 
INNER JOIN departments d 
ON d.department_id = e.department_id
INNER JOIN locations l 
ON l.location_id = d.location_id
INNER JOIN countries c 
ON c.country_id = l.country_id
INNER JOIN regions r 
ON r.region_id = c.region_id
WHERE region_name LIKE 'Europe';

select
 t1.first_name,
    t1.last_name,
    t3.city,
    t5.region_name
from employees t1
inner join departments t2
on t1.department_id = t2.department_id
inner join locations t3
on t2.location_id = t3.location_id
inner join countries t4
on t3.country_id = t4.country_id
inner join regions t5
on t4.region_id = t5.region_id
where t5.region_name = 'Europe';

-- ДЗ
-- 1. Вывести имя, фамилию и зарплату работников, проживающих в Venice и Toronto
SELECT
	e.first_name,
    e.last_name,
    e.salary,
    l.city -- чтоб увидеть, что вывелось нужное
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE l.city LIKE 'Venice' or l.city LIKE 'Toronto';
    
-- 2. Вывести имя и фамилию работников, проживающих в Америке

SELECT
	e.first_name,
    e.last_name,
    l.country_id, -- для наглядности
    e.department_id, -- для себя (сортировка)
    d.location_id -- -- для себя (сортировка)
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE l.country_id LIKE 'US';
	
-- 3. Вывести имя, фамилию и страну работников, проживающих в Японии и Канаде

SELECT
	e.first_name,
    e.last_name,
    c.country_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON l.location_id = d.location_id
INNER JOIN countries c
ON l.country_id = c.country_id
WHERE c.country_name LIKE 'Japan' or c.country_name LIKE 'Canada';
    