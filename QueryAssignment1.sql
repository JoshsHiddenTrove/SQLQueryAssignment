SELECT CompanyName, Country
  FROM hwSuppliers
 WHERE Country IN ('Japan', 'Germany');
 
SELECT ProductName, QuantityPerUnit, UnitPrice
 FROM hwProducts
 WHERE UnitPrice BETWEEN 4.01 AND 6.99;
 
 SELECT CompanyName,City,Country
 FROM hwCustomers
 WHERE (Country = 'USA' AND City = 'Portland') OR (Country = 'Canada' AND City = 'Vancouver');
 
 SELECT ContactName, ContactTitle
 FROM hwSuppliers
 WHERE SupplierID BETWEEN 4 AND 9
 ORDER BY ContactName DESC;
 
SELECT hwProducts.ProductName , hworderdetails.UnitPrice
 FROM hwProducts
 INNER JOIN hworderdetails 
 WHERE hworderdetails.UnitPrice in (SELECT MIN(hworderdetails.UnitPrice) FROM hworderdetails);

SELECT hworders.ShipCountry, COUNT(hworders.ShipCountry)
 FROM hworders
 WHERE hworders.ShipCountry NOT IN (SELECT hworders.ShipCountry FROM hworders WHERE hworders.ShipCountry = 'USA'AND ShippedDate BETWEEN 2015-04-04 AND 2015-04-10) 
 GROUP BY ShipCountry
 HAVING (count(hworders.ShipCountry) > 3);
 
 SELECT FirstName, LastName, DATE_FORMAT(HireDate,'%d/%m/%Y')
 FROM hwEmployees
 WHERE Country != 'USA' AND DATEDIFF(CURDATE(),HireDate) > 5*365;
 
 
 SELECT ProductName, UnitsInStock * UnitPrice AS InventoryValue
 FROM hwProducts
 WHERE UnitsInStock * UnitPrice BETWEEN 3000 AND 4000;
 
 SELECT ProductName, UnitsInStock, ReorderLevel
 FROM hwProducts
 WHERE UnitsInStock >1 AND UnitsInStock * UnitPrice >= ReorderLevel AND ProductName LIKE 'B%';
 
 SELECT ProductName, UnitPrice
 FROM hwProducts
 WHERE QuantityPerUnit LIKE '%boxes%' AND Discontinued = 1;
 
 SELECT country, count(hwcustomers.CustomerID)
 FROM hwcustomers
GROUP BY Country
HAVING (count(hwcustomers.CustomerID) > 8);

SELECT ShipCountry,ShipCity, COUNT(hworders.ShipCountry) AS OrderCount
FROM hworders
WHERE shipCountry = 'Austria' OR shipCountry = 'Argentina'
GROUP BY shipCountry;

SELECT hwsuppliers.companyName, hwproducts.ProductName
FROM hwproducts
INNER JOIN hwsuppliers
WHERE hwsuppliers.COuntry = 'Spain';

SELECT  ROUND(AVG(unitPrice),2) AS AverageUnitPrice 
FROM hwProducts
WHERE productName like '%t';

SELECT firstname,lastname,title, COUNT(OrderID)
FROM hwemployees
INNER JOIN hwOrders
GROUP BY firstname
Having COUNT(OrderID) > 120;

SELECT companyName, Country
FROM hwcustomers
INNER JOIN hworders
WHERE orderID IS NULL OR orderID = '';

SELECT CategoryName, ProductName
FROM hwcategories
INNER JOIN hwProducts
WHERE UnitsInStock = 0;

SELECT productName, QuantityPerUnit
FROM hwproducts
INNER JOIN hwSuppliers
WHERE (QuantityPerUnit LIKE '%pkg%' OR  QuantityPerUnit LIKE '%pkgs%' OR  QuantityPerUnit LIKE '%jars%') AND  country='japan';

SELECT hwCustomers.companyName, hworders.ShipName, hworderdetails.Unitprice * hworderdetails.Quantity AS TotalValue
FROM hwCustomers, hworders, hworderdetails
WHERE hwCustomers.country = 'Mexico';

SELECT hwproducts.productName, hwSuppliers.region
FROM hwSuppliers
INNER JOIN hwproducts
 WHERE ProductName LIKE 'L%' AND (region != '' OR region IS NULL);
 
 SELECT shipCountry,ShipName, DATE_FORMAT(orderDate,'%M %Y') AS Date
 FROM hworders
 INNER JOIN hwcustomers
 WHERE hworders.shipCity = 'Versailles' AND (hwcustomers.CustomerID IS NULL OR hwcustomers.CustomerID - '');
 
 SELECT  RANK() OVER (
	ORDER BY UnitsInStock
    ) ranking,ProductName, UnitsInStock
 FROM hwproducts
 WHERE ProductName LIKE 'F%'
 GROUP BY UnitsInStock;
 
  SELECT  RANK() OVER (
	ORDER BY UnitPrice
    ) ranking,ProductName, UnitPrice
 FROM hwproducts
 WHERE ProductID BETWEEN 1 AND 5;
 
   SELECT  RANK() OVER (
	ORDER BY BirthDate
    )Ranking,firstName,LastName,country,DATE_FORMAT(BirthDate,'%M %d %Y') AS Birthday
 FROM hwEmployees
 WHERE YEAR(BirthDate) > 1984;
