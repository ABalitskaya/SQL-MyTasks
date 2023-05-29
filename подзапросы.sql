SELECT
	t1.discount,
    t1.type,
    t1.discount - (SELECT max(discount) from discounts_dated) as defference
FROM(
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
) t1
WHERE t1.discount > ((SELECT max(discount) from discounts_dated)/2);

SELECT first_name,
last_name
FROM
	users
WHERE first_name IN (SELECT 
	first_name FROM employees);
    

SELECT 
	*,
    (SELECT max(t1.discount) FROM (
    SELECT discount FROM  discount_personal dp
    WHERE dp.user_id = u.id
    UNION
    SELECT discount FROM pers_discount pd
    WHERE pd.user_id = u.id
    ) t1) as max_discount
FROM users u;

SELECT 
	*,
    (SELECT max(t1.discount) FROM (
    SELECT discount, user_id FROM  discount_personal dp
    UNION
    SELECT discount, user_id FROM pers_discount pd
    ) t1 
    WHERE t1.user_id = u.id
    ) as max_discount
FROM users u;

SELECT *
FROM t1
INNER JOIN t2
ON t1.r_id = t2.f_id;

