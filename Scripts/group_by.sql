-- Group by
-- Util para agrupar filas, especificando uno o varios elementos en la cláusula group by
-- GROUP BY <value1< [, <value2>, …]

SELECT CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- La consulta anterior es equivalente a la siguiente
SELECT DISTINCT CustomerID
FROM Sales.SalesOrderHeader;

-- La función de agregado más sensilla es count().
-- Nos muestra cuantas filas de la tabla pertenecen a cada cliente.
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- group by no garantiza el orden de los resultados.
-- Para ordenar se usa la clausula ORDER
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID;

SELECT CustomerID AS Customer,
       COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY Customer
ORDER BY Customer;

-- Errores de group by
-- Se permite la siguiente consulta porque cada columna de la lista select es una columna de la cláusula
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- La anterior consulta devolvera error porque PurschaseOrderNumber no forma parte de group by
SELECT CustomerID, PurchaseOrderNumber, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- Si deseamos ver los pedidos por identificador de cliente.
SELECT CustomerID, PurchaseOrderNumber, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, PurchaseOrderNumber;






