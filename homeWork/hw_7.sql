-- Найти мин/стоимость товаров для каждой категории
SELECT c.CategoryName, MIN(Price) MinProductPrice
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
GROUP BY p.CategoryID
ORDER BY MinProductPrice;


-- Вывести названия категорий, в которых более 10 товаров
SELECT c.CategoryName
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID
HAVING COUNT(*) > 10;


-- Вывести три самых дешевых заказа
SELECT o.*
FROM orders o
JOIN order_details od ON od.OrderID = o.OrderID
JOIN products p on p.ProductID = od.ProductID
GROUP BY OrderID
ORDER BY SUM(od.Quantity * p.Price)
LIMIT 3;


-- Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT e.FirstName, e.LastName, COUNT(*) OrdersQuantity
FROM employees e
JOIN orders o ON e.EmployeeID = o.EmployeeID
GROUP BY o.EmployeeID
HAVING OrdersQuantity < 15;


-- Вывести ТОП-1 стран по ко-ву клиентов
SELECT Country
FROM customers
GROUP BY Country
ORDER BY COUNT(*) DESC
LIMIT 1;