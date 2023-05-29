use issues;

-- Все, кто работает в development
SELECT -- distinct
	us.firstName,
    us.lastName
FROM userscategories u
INNER JOIN users us
ON u.user_id = us.ID
INNER JOIN categories cat
ON u.cat_id = cat.ID
WHERE cat.ID = 1 or cat.parent_id = 1
group by us.ID;

-- без distinct
SELECT 
	us.firstName,
    us.lastName,
    'developer' as role
FROM userscategories u
INNER JOIN users us
ON u.user_id = us.ID
INNER JOIN categories cat
ON u.cat_id = cat.ID
WHERE cat.ID = 1 or cat.parent_id = 1
group by us.ID
UNION
SELECT
	us.firstName,
    us.lastName,
    'manager' as role
FROM userscategories u
INNER JOIN users us
ON u.user_id = us.ID
INNER JOIN categories cat
ON u.cat_id = cat.ID
WHERE cat.ID = 2 or cat.parent_id = 2
group by us.ID;

-- вывести фамилию, имя и роли по отделам всех сотрудников
SELECT 
		u.firstName, u.lastName , 
GROUP_CONCAT(distinct CASE 
	WHEN c.ID = 2 or c.parent_id = 2
	THEN 'manager' 
	WHEN c.ID = 1 or c.parent_id = 1
	THEN 'developer' 
END) as role
FROM users u
INNER JOIN userscategories uc
ON uc.user_id = u.ID
INNER JOIN categories c
ON c.ID = uc.cat_id
GROUP BY u.ID;

-- ДЗ  переделать так, чтоб не использовать DISTINCT
-- Заполнить таблицу tasks
-- Вывести количество просроченных заданий на каждого человека







