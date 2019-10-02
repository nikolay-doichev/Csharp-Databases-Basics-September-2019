CREATE VIEW V_EmployeesHiredAfter2000 AS
     SELECT FirstName, LastName
         FROM Employees
         WHERE CAST(DATEPART(YEAR, HireDate) AS SMALLINT) > 2000