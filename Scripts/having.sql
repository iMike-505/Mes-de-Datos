-- Having - filtro de grupos
-- Cuando hayamos creado grupos con una clausula group se puede filtrar aún más

-- Usando having permite crear una condición de búsqueda.

-- En este ejemplo se cuentan los pedidos de cada cliente
SELECT CustomerID,
      COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 10;

-- Una clausula where filtra las filas antes de formar grupos

-- Having filtra grupos completos y normalmente examina los resultados de una agregación