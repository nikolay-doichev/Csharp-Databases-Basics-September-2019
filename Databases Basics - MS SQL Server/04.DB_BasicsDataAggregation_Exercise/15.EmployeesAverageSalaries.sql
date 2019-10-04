SELECT *
INTO NewEmployeesTable
    FROM Employees
    WHERE Salary > 30000

DELETE from NewEmployeesTable
where ManagerID = 42

UPDATE NewEmployeesTable
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID ,AVG(Salary) AS [AverageSalary]
	FROM NewEmployeesTable
	GROUP BY DepartmentID