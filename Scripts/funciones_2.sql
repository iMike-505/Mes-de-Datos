-- Funciones de agregado

SELECT AVG(ListPrice) AS AveragePrice,
       MIN(ListPrice) AS MinimumPrice,
       MAX(ListPrice) AS MaximumPrice
FROM Production.Product;

-- Podemos modificar la consulta para devolver los prcios medios, minimos y maximos con where
SELECT AVG(ListPrice) AS AveragePrice,
       MIN(ListPrice) AS MinimumPrice,
       MAX(ListPrice) AS MaximumPrice
FROM Production.Product
WHERE ProductCategoryID = 15;

-- Cuando se usan agregados en una clausula select, todas las columnas a las que hace referencia se usan como entradas para una funcion
SELECT ProductCategoryID, AVG(ListPrice) AS AveragePrice,
MIN(ListPrice) AS MinimumPrice,
MAX(ListPrice) AS MaximumPrice
FROM Production.Product;

-- Esta consulta devuelve la primera y la ultima empresa por nombre, mediante MIN y MAX
SELECT MIN(CompanyName) AS MinCustomer, 
       MAX(CompanyName) AS MaxCustomer
FROM SalesLT.Customer;

-- USO DE DISTINCT con  funciones de agregado
SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM Sales.SalesOrderHeader;

-- En esta consulta se muestra la diferencia entre como avg controla null
SELECT SUM(c2) AS sum_nonnulls, 
    COUNT(*) AS count_all_rows, 
    COUNT(c2) AS count_nonnulls, 
    AVG(c2) AS average, 
    (SUM(c2)/COUNT(*)) AS arith_average
FROM t1;


