SELECT DepartmentID, MIN(Salary) AS [MinimumSalary]
	FROM Employees
	where DATEPART(YEAR, HireDate) > 2000 AND DepartmentID IN (2, 5, 7)	
	GROUP BY DepartmentID