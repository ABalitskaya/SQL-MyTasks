use hr;

SELECT * from countries;

SELECT country_name as name,
region_id from countries where country_name = 'Zimbabwe';

SELECT * from countries where region_id <> 4;

SELECT * from hr.employees WHERE department_id = 90;

SELECT first_name, last_name, department_id FROM hr.employees WHERE department_id not in (80, 110);

SELECT first_name, last_name FROM hr.employees WHERE last_name LIKE '%kk%' OR last_name LIKE '%ll%';

X = (salary = 6000)

x and TRUE = x
x and FALSE = FALSE
TRUE and X = X
FALSE and X = FALSE

X or TRUE = TRUE
X or FALSE = X
TRUE or X = TRUE
FALSE or X = X

SELECT 
	salary as money,
    salary + 1 as money1,
    salary -1  as money2,
    salary * 2 as money3,
    salary / 2 as money4,
    salary % 13 as money5,
    round(sqrt(salary)) as new_salary /*Квадратный корень из зарплаты + округление*/
FROM employees;

SELECT functionName(-1) as value1;
SELECT abs(-1) as value1;
SELECT pow(2,3) as value1;
SELECT round(-2.1) as value1;
SELECT sqrt(4) as value1;

SELECT 'привет, друг' AS string1;
SELECT concat('привет, друг', ' ', 'как дела') AS string1; /*Объединение строк */
SELECT concat_ws(' ','привет', 'друг', 'как', 'дела') AS string1;

SELECT insert('привет, друг', 8,4,'мой') AS string1; /* 8 - с какого по счету символа делать вставку, 4 - вместо скольких символов*/

SELECT insert('привет мой друг', 8, 3, 'дорогой') AS string1;

SELECT length('друг') AS string1; /*возвращает длину строк в байтах*/

SELECT trim('    hi friend   ') AS string1;

SELECT left('hi my friend', 3) as result; /*выбирает первые три символа*/

SELECT right('hi my friend', 3) as result;

SELECT substring('hi my friend', 4, 3) as result;

SELECT replace('hi my friend', 'my', 'dear') as result; /*поменять что-то в строке*/

SELECT lower('HI MY DEAR FRIEND') as result;

SELECT upper('HI MY DEAR FRIEND') as result;
