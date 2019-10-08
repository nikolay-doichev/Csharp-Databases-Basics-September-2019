Select MIN(temp.AvgSalary) AS [MinAverageSalary]
	FROM(SELECT AVG(e.Salary) AS [AvgSalary]
	FROM Employees AS e
	GROUP BY DepartmentID) AS temp	