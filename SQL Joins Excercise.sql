SELECT * from Products;
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS "Product Name", Categories.Name AS "Category" 
FROM products
INNER JOIN categories
on products.CategoryID = categories.CategoryID
WHERE categories.Name = "computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name AS "Name", p.Price AS "Price", r.Rating AS "Star Rating"
 FROM products as p
 INNER Join reviews as r
 ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- LEFT JOIN
SELECT CONCAT(Employees.FirstName,' ', Employees.LastName) AS "Full Name", SUM(Sales.Quantity) AS "Quantity Sold"
FROM sales
LEFT JOIN employees
ON Employees.EmployeeID = sales.EmployeeID
GROUP BY employees.employeeID
ORDER BY SUM(sales.Quantity) DESC
LIMIT 2;
-- INNER JOIN
SELECT e.FirstName AS 'First Name', e.LastName AS 'Last Name',SUM(s.Quantity) AS Total
FROM sales as s
JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.FirstName, e.LastName
ORDER BY Total DESC
LIMIT 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department Name', c.Name as 'Category Name'
FROM departments AS d
JOIN categories as c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS "Total Sold", (p.Price * SUM(s.Quantity)) AS "Total Price Sold"
FROM products as p
JOIN sales as s
ON p.ProductID = s.ProductID
WHERE p.ProductID = 97
GROUP BY p.Name, p.Price;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
from products as p
INNER JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
-- 3 tables to join
SELECT e.EmployeeID as "Employee ID", e.FirstName AS 'First Name', e.LastName AS 'Last Name', p.Name, SUM(s.Quantity) As 'Total Sold'
FROM sales AS s
INNER JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
INNER JOIN products as p
ON p.ProductID = s.SalesID
GROUP BY e.EmployeeID, p.ProductID;