-- Esta consulta devuelve el valor maximo
select max(SalesOrderID)
from Sales.SalesOrderHeader;

-- Para indicar una subconsulta se escribe entre parentesis
select SalesOrderID, ProductID, OrderQty
from Sales.SalesOrderDetail
where SalesOrderID = 
   (select MAX(SalesOrderID)
    from Sales.SalesOrderHeader);
    
-- Subconsulta escalar
SELECT SalesOrderID, ProductID, OrderQty,
    (SELECT AVG(OrderQty)
     FROM SalesLT.SalesOrderDetail) AS AvgQty
FROM SalesLT.SalesOrderDetail
WHERE SalesOrderID = 
    (SELECT MAX(SalesOrderID)
     FROM SalesLT.SalesOrderHeader);
     
-- Multivalor
SELECT CustomerID, SalesOrderID
FROM Sales.SalesOrderHeader
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Sales.Customer
    WHERE CountryRegion = 'Canada');
    

SELECT c.CustomerID, o.SalesOrderID
FROM Sales.Customer AS c
JOIN Sales.SalesOrderHeader AS o
    ON c.CustomerID = o.CustomerID
WHERE c. CountryRegion = 'Canada';