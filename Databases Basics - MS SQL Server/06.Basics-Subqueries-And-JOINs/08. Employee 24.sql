Select TOP(5) e.EmployeeID, 
			  e.FirstName,
			  IIF((DATEPART(YEAR, p.StartDate) >= 2005), NULL, p.Name) AS [ProjectName]			  
	From Employees AS e
	JOIN EmployeesProjects AS ep
	ON ep.EmployeeID = e.EmployeeID
	JOIN Projects AS p
	ON p.ProjectID = ep.ProjectID
	WHERE e.EmployeeID = 24