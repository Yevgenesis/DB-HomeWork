-- Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT products.ProductName, products.Price * 1.09 AS PriceUSD
FROM order_details
         JOIN products ON products.ProductID = order_details.ProductID
ORDER BY products.Price DESC
LIMIT 1;


-- Вывести два самых дорогих товара из категории Beverages из USA
SELECT products.*
FROM products
         JOIN categories ON products.CategoryID = categories.CategoryID
         JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE categories.CategoryName = 'Beverages'
  AND suppliers.Country = 'USA'
ORDER BY Price DESC
LIMIT 2;

-- Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT suppliers.Country
FROM suppliers
         JOIN products ON products.SupplierID = suppliers.SupplierID
         JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.CategoryName = 'Seafood';