-- В рамках БД "песочница" выведите З/П каждого менеджера, исходя из ставки в 5% от суммы заказов
SELECT e.FirstName, e.LastName, sum(p.Price*od.Quantity) * 0.05 As Salary
FROM employees e
JOIN orders o ON e.EmployeeID = o.EmployeeID
JOIN order_details od ON o.OrderID = od.OrderID
JOIN products p ON p.ProductID = od.ProductID
GROUP BY o.EmployeeID;


-- Используя MySQL WorkBench (или аналогичный инструмент) создайте БД music (сервис онлайн-музыки)
-- и в рамках нее таблицы users, tracks с полями на Ваше усмотрение
CREATE DATABASE music;
use music;
CREATE table users
(
    id         int,
    first_name varchar(20),
    last_name  varchar(20),
    age        int,
    email      varchar(50),
    created_at timestamp,
    updated_at timestamp,
    isDeleted  boolean
);

CREATE TABLE tracks
(
    id        int,
    author    varchar(100),
    title     varchar(100),
    genre     varchar(30),
    duration  int,
    rating    int,
    released  timestamp,
    create_at timestamp,
    update_at timestamp
);

