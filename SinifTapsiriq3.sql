use Northwind

select Country, COUNT(Region) from Employees
GROUP BY Country

select Country, COUNT(*) from Employees GROUP BY Country

select [EmployeeID], COUNT(*) from Orders GROUP BY [EmployeeID]

SELECT TOP 5 FirstName, Country, COUNT(Region) from Employees
GROUP BY Country 
ORDER BY 1 

SELECT Country, COUNT(*) AS Eded FROM 
(SELECT TOP 5 * FROM Employees ORDER BY FirstName) AS Personeller 
GROUP BY Country

select [CategoryID],  COUNT(*)  as URUN_BEDELI from [dbo].[Products] WHERE [UnitPrice] <= 35 
GROUP BY [CategoryID]

SELECT CategoryID, COUNT(*), [ProductName] FROM Products WHERE [ProductName] LIKE '[A-K]%' AND [UnitsInStock] BETWEEN 5 AND 50

SELECT [OrderID], SUM([UnitPrice]*[Quantity]-[Discount]) AS UMUMI FROM [Order Details]
WHERE [UnitPrice]*[Quantity]-[Discount] BETWEEN 2500 AND 3500 
GROUP BY OrderID
ORDER BY 2

---------------------------------------------------------------------

SELECT OrderID, SUM([Quantity]) FROM [dbo].[Order Details] 
GROUP BY OrderID
HAVING SUM([Quantity]) < 200
ORDER BY 2
----------------------------------------------------------------------
SELECT [ProductID],[ProductName],Products.CategoryID,[Description] FROM Products INNER JOIN Categories
ON Categories.CategoryID = Products.CategoryID
-----------------------------------------------------------------------
SELECT Shippers.CompanyName, SUM(Orders.Freight) FROM Orders
INNER JOIN Shippers ON Orders.[ShipVia] = Shippers.[ShipperID]
GROUP BY Shippers.CompanyName
-----------------------------------------------------------------------
SELECT Suppliers.[CompanyName], 
SUM([dbo].[Order Details].[Quantity]) AS SAY,
ROUND(SUM([Order Details].[Quantity] *[Order Details].[UnitPrice]* (1-[Order Details].[Discount] )),2) 
FROM Suppliers 
INNER JOIN Products 
ON Suppliers.[SupplierID] = Products.[SupplierID]
INNER JOIN [dbo].[Order Details] ON [dbo].[Order Details].[ProductID] = Products.ProductID
GROUP BY Suppliers.[CompanyName] 
order by CompanyName
---------------------------------------------------------------------------
SELECT [Customers].[CompanyName],
SUM([Order Details].[UnitPrice] * [Order Details].Quantity ) AS UMUMI_XERC
FROM [Customers]
INNER JOIN [Orders] ON [Customers].CustomerID = [Orders].CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = [Orders].OrderID
GROUP BY [Customers].[CompanyName]
ORDER BY 2
-----------------------------------------------------------------------
SELECT [Orders].[ShipCountry],
SUM([Order Details].Quantity)
FROM Orders 
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY  [Orders].[ShipCountry]
-----------------------------------------------------------------------
SELECT 
Employees.FirstName,
Employees.TitleOfCourtesy,
Customers.ContactName,
Customers.CompanyName,
Orders.OrderID
FROM Orders 
INNER JOIN 
Employees ON Orders.[EmployeeID]= Employees.EmployeeID 
INNER JOIN 
Customers ON Orders.[CustomerID] = Customers.[CustomerID]
-------------------------------------------------------------

