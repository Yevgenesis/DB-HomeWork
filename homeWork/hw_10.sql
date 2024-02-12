-- 1. Создать таблицу students(1)
-- firstname varchar not null
-- lastname varchar not null
-- age integer
-- subject varchar not null
-- mark numeric(2, 1) от 0 до 5
create table students
(
    firstname varchar(50)  not null,
    lastname  varchar(50)  not null,
    age       int,
    subject   varchar(100) not null,
    mark      numeric(2, 1) check ( mark between 0 AND 5)
);


-- Добавить поле id уникальное значение, не null, автозаполнение в начало таблицы
alter table students
    add column id int primary key auto_increment first;


-- Изменить тип mark на integer
alter table students
    modify mark int;


-- Удалить поле age
alter table students
    drop column age;


-- Добавить поле class integer от 1 до 10, вставить после lastname
alter table students
    add class int check ( class between 1 AND 10) after lastname;


-- Заполнить таблицу строками (10 шт)
insert into students(firstname, lastname, class, subject, mark)
values ('Mihail', 'Mihailov', 1, 'test1', 0),
       ('Ivan', 'Ivanov', 2, 'test1', 1),
       ('Petr', 'Petrov', 1, 'test2', 2),
       ('Lu', 'Alaya', 2, 'test3', 3),
       ('Alexandr', 'Siniy', 1, 'test4', 0),
       ('Valera', 'Joltiy', 3, 'test5', 5),
       ('Yan', 'Artemov', 4, 'test6', 4),
       ('Rafik', 'Nevinovnik', 5, 'test1', 3),
       ('Grigoriy', 'Olenin', 2, 'test2', 0),
       ('Zarina', 'Abdulova', 1, 'test1', 0);


-- Удалить из таблицы студентов, у которых оценка 0
delete from students
where mark=0;


-- Найти всех студентов, у которых оценка выше 3
SELECT *
FROM students
WHERE mark>3;


-- Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
SELECT *
FROM students
WHERE class=1 AND mark<3;


-- Удалить из таблицы этих студентов
delete
FROM students
WHERE class=1 AND mark<3;


-- Найти всех студентов, у которых длина имени больше 4 букв
SELECT *
FROM students
WHERE firstname LIKE '_____%';

-- или

SELECT *
FROM students
WHERE char_length(firstname)>4;


-- Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 символов.
SELECT *
FROM students
WHERE lastname like 'a__%';


-- Удалить таблицу.
drop table students;