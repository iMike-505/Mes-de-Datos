-- Funciones escalares

-- Ejemplo en el que sae usan varias funciones de fecha y hora
SELECT  SalesOrderID,
    OrderDate,
        YEAR(OrderDate) AS OrderYear,
        DATENAME(mm, OrderDate) AS OrderMonth,
        DAY(OrderDate) AS OrderDay,
        DATENAME(dw, OrderDate) AS OrderWeekDay,
        DATEDIFF(yy,OrderDate, GETDATE()) AS YearsSinceOrder
FROM Sales.SalesOrderHeader;

-- Con algunas funciones matematicas
SELECT TaxAmt,
       ROUND(TaxAmt, 0) AS Rounded,
       FLOOR(TaxAmt) AS Floor,
       CEILING(TaxAmt) AS Ceiling,
       SQUARE(TaxAmt) AS Squared,
       SQRT(TaxAmt) AS Root,
       LOG(TaxAmt) AS Log,
       TaxAmt * RAND() AS Randomized
FROM Sales.SalesOrderHeader;

-- Usando funciones de cadena
SELECT  CompanyName,
        UPPER(CompanyName) AS UpperCase,
        LOWER(CompanyName) AS LowerCase,
        LEN(CompanyName) AS Length,
        REVERSE(CompanyName) AS Reversed,
        CHARINDEX(' ', CompanyName) AS FirstSpace,
        LEFT(CompanyName, CHARINDEX(' ', CompanyName)) AS FirstWord,
        SUBSTRING(CompanyName, CHARINDEX(' ', CompanyName) + 1, LEN(CompanyName)) AS RestOfName
FROM Sales.Customer;



-- Funciones logicas --

-- IIF
-- La función IIF evalúa una expresión de entrada booleana y devuelve un valor especificado si la expresión se evalúa como True, y un valor alternativo si la expresión se evalúa como False.
SELECT AddressType,
      IIF(AddressType = 'Main Office', 'Billing', 'Mailing') AS UseAddressFor
FROM Sales.CustomerAddress;

-- CHOOSE
-- La función CHOOSE evalúa una expresión de entero y devuelve el valor correspondiente de una lista en función de su posición ordinal (basada en 1).
SELECT SalesOrderID, Status,
CHOOSE(Status, 'Ordered', 'Shipped', 'Delivered') AS OrderStatus
FROM Sales.SalesOrderHeader;



-- Funciones de categoria
-- Las funciones de clasificación permiten realizar cálculos en un conjunto de filas definido por el usuario. Estas funciones incluyen funciones de clasificación, desplazamiento, agregado y distribución.
SELECT TOP 100 ProductID, Name, ListPrice,
RANK() OVER(ORDER BY ListPrice DESC) AS RankByPrice
FROM Production.Product AS p
ORDER BY RankByPrice;



-- OVER
-- Puede usar la cláusula OVER para definir particiones o agrupaciones dentro de los datos.
SELECT c.Name AS Category, p.Name AS Product, ListPrice,
  RANK() OVER(PARTITION BY c.Name ORDER BY ListPrice DESC) AS RankByPrice
FROM Production.Product AS p
JOIN Production.ProductCategory AS c
ON p.ProductCategoryID = c.ProductcategoryID
ORDER BY Category, RankByPrice;


-- Funciones de conjuntos de filas
-- Las funciones OPENDATASOURCE, OPENQUERY y OPENROWSET permiten pasar una consulta a un servidor de bases de datos remoto. A continuación, el servidor remoto devolverá un conjunto de filas de resultados.
SELECT a.*
FROM OPENROWSET('SQLNCLI', 'Server=SalesDB;Trusted_Connection=yes;',
    'SELECT Name, ListPrice
    FROM AdventureWorks.Production.Product') AS a;


