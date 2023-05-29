use hr;

-- 1970.01.01 - UNIX Epoch
-- TimeStamp - запись в милисекундах Integer

-- Date Time - это обычная запись даты и времени, используется редакоalter
-- YYYY-MM-DD hh:mm:ss[.fraction] - в скобках милисекундыalter

CREATE TABLE some_events(
event_name varchar(128),
hapened TIMESTAMP
);

INSERT INTO some_events values('first test', current_timestamp());

CREATE TABLE holidays(
event_name varchar(128),
hapened TIMESTAMP
);

INSERT INTO some_events2 values ('test2', current_date());
INSERT INTO some_events2 values ('test3', current_time());
INSERT INTO some_events2 values ('timestamp', current_timestamp());
INSERT INTO some_events2 values ('now', now());

-- NOW - это то же самое, что и current_timestamp

SELECT 
	event_name,
    DATE(hapened),
    TIME(hapened),
    YEAR(hapened),
    MONTH(hapened),
    DATE_FORMAT(hapened, '%W %M %Y'),
    DAY(hapened), -- день месяца
    DAYOFMONTH(hapened),
    DAYOFWEEK(hapened),
    DAYOFYEAR(hapened),
    date_format()
FROM some_events2;

-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format
-- Инструкция по выводу формата даты
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
-- функции для дат

INSERT INTO holidays values ('Mothers day', '2022-03-03 12:00:00');
INSERT INTO holidays values ('День независимости', '2022-05-26 10:30:05');
INSERT INTO holidays values ('Георгоба', '2024-05-06 06:20:30');
INSERT INTO holidays values ('Георгоба2', '2019-10-23 09:10:07');
INSERT INTO holidays values ('выходной', now());
INSERT INTO holidays values ('NY', '2025-01-01 00:00:00');

-- DATEDIF(date1, date2)

SELECT
	event_name,
    DATEDIFF(hapened, 
		(SELECT min(hapened) FROM holidays))
FROM holidays;

SELECT
	event_name,
    DATEDIFF(
    (SELECT hapened FROM holidays WHERE event_name = 'NY'),
    (SELECT hapened FROM holidays WHERE event_name = 'Mothers day')
    )
FROM holidays;
 
SELECT
	event_name,
    (SELECT 
		min(DATEDIFF( -- разница в днях
			h1.hapened,
			h2.hapened
    ))
    FROM holidays h2
    WHERE h2.hapened < h1.hapened)
FROM holidays h1 order by h1.hapened;

SELECT
	event_name,
    (SELECT 
		min(TIMESTAMPDIFF( -- надо менять местами порядок аргументов
			YEAR, -- в чем выводить разницу
			h2.hapened,
			h1.hapened
    ))
    FROM holidays h2
    WHERE h2.hapened < h1.hapened)
FROM holidays h1 order by h1.hapened;

SELECT 
	event_name, 
    hapened, 
    DATE_ADD(hapened, INTERVAL 1 DAY), -- показать следующий день
    DATE_SUB(hapened, INTERVAL 1 MONTH), -- показать предыдущий месяц
    DATE_SUB(hapened, INTERVAL 1 YEAR), -- показать предыдуший год
    DATE_ADD(hapened, INTERVAL 1 HOUR) -- показать следующий час
FROM holidays;

SELECT
	event_name,
    hapened,
    DATE(DATE_SUB(hapened, INTERVAL 1 DAY)),
    DATE(DATE_ADD(hapened, INTERVAL 1 DAY))
FROM holidays;

    
    SELECT
	event_name,
    hapened,
	DATE_SUB(hapened, INTERVAL (SELECT
		min(TIMESTAMPDIFF(
			DAY,
			h2.hapened,
			h1.hapened
		))
	FROM holidays h2
    WHERE h2.hapened < DATE_SUB(h1.hapened, INTERVAL 1 YEAR)) DAY)
FROM holidays h1;
 
    

