create database issues;
use issues;

CREATE table users(
	ID int primary key auto_increment,
    firstName varchar(64),
    lastName varchar(64),
	email varchar(128) unique,
	teamLeader_id int, 
    foreign key (teamLeader_id)
    references users(ID)
);

CREATE table categories(
	ID int primary key auto_increment,
    catName varchar(256) NOT NULL unique,
    catDescription varchar(256),
    parent_id int,
    foreign key(parent_id)
    references categories(ID)
);

CREATE table usersCategories(
	cat_id int,
    foreign key(cat_ID)
    references categories(ID),
    user_id int,
    foreign key(user_id)
    references users(ID),
    PRIMARY KEY (cat_id, user_id),
    responsible boolean default false NOT NULL
);

CREATE table tasks(
	ID int primary key auto_increment,
    taskName varchar(256) NOT NULL,
    taskDescription varchar(256),
    creationDate TIMESTAMP default current_timestamp NOT NULL,
    deadline TIMESTAMP default (DATE_ADD(creationDate, INTERVAL 1 DAY)), 
    CHECK (deadline > creationDate),
    creator_id int NOT NULL,
    foreign key (creator_id)
    references users(ID),
    assignee_id int default (creator_id),
    foreign key (assignee_id)
    references users(ID),
    category_id int,
    foreign key (category_id)
    references categories(ID)
);

INSERT INTO users (firstName,
  lastName,
  email,
  teamLeader_id
 )
 VALUES ('Boris' , 'Risker', 'boris@gmail.com', null),
 ('Maria', 'Belova', 'maria@gmail.com', 1),
 ('Martin','Belousov', 'martin@gmail.com', null),
 ('Anna','Shmukler', 'anna@gmail.com', 3),
 ('Iryna', 'Marchenko', 'iryna@gmail.com', 4),
 ('Alex', 'Suhanov', 'alex@gmail.com', 1);

INSERT INTO categories (catName,parent_id)
VALUES ('development', null),
       ('management', null),
       ('frontend', 1),
       ('backend', 1),
       ('database', 1),
       ('hr', 2),
       ('finance', 2);
       
INSERT INTO usersCategories (user_id, cat_id, responsible)
VALUES (1, 2, true), (1, 6, false), (1, 7 , false),
	   (2, 6, true),(2, 2, false),
	   (6, 7, true), (6, 2, false);
       
INSERT INTO usersCategories (user_id, cat_id, responsible)
VALUES (3, 1, true), (3, 3, true), (3, 4, true), (3, 5, true),
	   (4, 1, false), (4, 4, true), (4, 5, false),
       (5, 5, true);