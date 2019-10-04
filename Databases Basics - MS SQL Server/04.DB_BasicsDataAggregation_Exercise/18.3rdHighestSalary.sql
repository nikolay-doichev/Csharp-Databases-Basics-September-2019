SELECT DepartmentID, Salary AS [ThirdHighestSalary] FROM (SELECT DepartmentID, Salary,
	DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Ranking]
    FROM Employees
	GROUP BY DepartmentID, Salary) AS [RankTable]
	WHERE Ranking = 3	