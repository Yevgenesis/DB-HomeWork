-- Вывести ко-во товаров с ценой от 10 до 250 EUR
SELECT COUNT(*)  AS Quantity
FROM products
WHERE Price BETWEEN 10 AND 250;


-- Вывести ко-во поставщиков не из UK и не из China
SELECT COUNT(*) AS Quantity
FROM suppliers
WHERE Country NOT IN ('UK', 'China');


-- Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT AVG(Price) AS AvgPrice,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice,
       COUNT(*) AS Qantity
FROM products
WHERE CategoryID IN (3, 5);


-- Вывести общую сумму проданных товаров
SELECT SUM(o.Quantity * p.Price) Total_SUM
FROM products p
         JOIN order_details o ON p.ProductID = o.ProductID;


-- Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)
SELECT o.OrderID,
       c.CustomerName,
       c.Country AS CustomerCountry,
       e.LastName AS ManagerLastName,
       s.ShipperName
FROM orders o
         JOIN customers c ON c.CustomerID = o.CustomerID
         JOIN shippers s ON o.ShipperID = s.ShipperID
         JOIN employees e ON e.EmployeeID = o.EmployeeID;


-- Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT SUM(p.Price * od.Quantity) AS GermanyOrderedSUM
FROM products p
         JOIN order_details od ON p.ProductID = od.ProductID
         JOIN orders o ON od.OrderID = o.OrderID
         JOIN customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany';

