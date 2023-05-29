create database learn;
use learn;

create table product(
id integer primary key auto_increment,
title varchar(128),
price integer,
discount decimal(2,1)
);

insert into learn.product (title, price, discount) values 
					 ('Велосипед', 50000, 0.9),
                     ('Ролики', 15000, 0.1),
                     ('Лыжи', 25000, null),
                     ('Самокат', 10000, 0.8),
                     ('Сноуборд', 30000, 0.9),
                     ('Санки', 10000, null);


/*SELECT title, price FROM learn.product;*/
/*SELECT title AS name, price FROM learn.product;*/
SELECT title, price FROM learn.product WHERE price > 20000;
