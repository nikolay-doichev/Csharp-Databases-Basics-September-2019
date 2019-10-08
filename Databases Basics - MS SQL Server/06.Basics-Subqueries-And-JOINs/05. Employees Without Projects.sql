Select TOP(3) e.EmployeeID, e.FirstName
	From Employees AS e
	Left JOIN EmployeesProjects AS ep
	ON ep.EmployeeID = e.EmployeeID
	WHERE ep.ProjectID IS NULL
	ORDER BY e.EmployeeID ASC