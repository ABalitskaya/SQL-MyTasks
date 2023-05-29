use hr;

-- union объединяет таблицы, сортирует таблицу и убирает дубли
-- union all - не сортирует и не убирает дубли (то есть это быстрее происходит)
-- distinct - удаляет дубли и сортирует

SELECT 
	first_name,
    last_name,
    'employee' as type
FROM employees
UNION
SELECT
	last_name,
    first_name,
    'user'
FROM users;
	
SELECT
	discount,
	'1' as type
FROM discount_personal 
UNION
SELECT 
	discount,
    '2' as type
FROM discounts_dated
UNION    
SELECT discount,
		'3' as type
FROM pers_discount