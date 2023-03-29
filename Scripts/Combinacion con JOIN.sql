-- Combinaciones

-- INNER JOIN
SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp 
JOIN Sales.SalesOrder AS ord
	ON emp.EmployeeID = ord.EmployeeID;
-- Es el tipo determinado de operacion join, al mezclar tipos de combinacion.
-- Example
SELECT p.ProductID, m.Name AS Model, p.Name AS Product
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS m
    ON p.ProductModelID = m.ProductModelID
ORDER BY p.ProductID;


-- LEFT OUTER JOIN
SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp
LEFT OUTER JOIN Sales.SalesOrder AS ord
    ON emp.EmployeeID = ord.EmployeeID;
-- LEFT indica al procesador de consultas que conserve los valores de las fila de la tabla de la izquierda.
-- Al usar LEFT, RIGHT o FULL se puede omitir la palabra OUTER
SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp
LEFT JOIN Sales.SalesOrder AS ord
    ON emp.EmployeeID = ord.EmployeeID;
    

-- CROSS JOIN
SELECT <select_list>
FROM table1 AS t1
CROSS JOIN table2 AS t2;
-- Esta operacion  crea un conjunto de datos con todas las combinaciones posibles

SELECT emp.FirstName, prd.Name
FROM HR.Employee AS emp
CROSS JOIN Production.Product AS prd;
-- Para usar cross join se debe de tomar en cuenta: 
-- No se realiza ninguna coincidencia de filas, por lo que no se usa ninguna cláusula ON. (Es un error usar una cláusula ON con CROSS JOIN).
-- Para usar la sintaxis ANSI SQL-92, separe los nombres de tabla de entrada con el operador CROSS JOIN.


-- Autocombinacionales
SELECT emp.FirstName AS Employee, 
       mgr.FirstName AS Manager
FROM HR.Employee AS emp
LEFT OUTER JOIN HR.Employee AS mgr
  ON emp.ManagerID = mgr.EmployeeID;