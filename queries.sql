-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName
FROM product as p    
JOIN category AS c ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, s.CompanyName, o.ShippedDate
FROM [order] AS o
JOIN shipper AS s ON o.shipVia = s.Id

WHERE o.ShippedDate < '2012-08-09'
ORDER BY o.ShippedDate ASC;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT od.Quantity, p.ProductName
FROM orderdetail as od
JOIN product AS p ON od.productId = p.id

WHERE od.OrderId = 10251
ORDER BY p.ProductName ASC;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id AS [Order ID], c.CompanyName AS [Company Name], e.LastName AS [Employee's Last Name]
FROM [order] AS o

JOIN customer AS c ON o.CustomerId = c.id
JOIN employee AS e ON o.EmployeeId = e.Id;