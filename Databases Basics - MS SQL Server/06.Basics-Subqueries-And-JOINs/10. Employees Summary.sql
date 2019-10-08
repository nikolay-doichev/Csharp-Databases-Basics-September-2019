SELECT TOP(50) e.EmployeeID,
		CONCAT(e.FirstName,' ', e.LastName) AS [EmployeeNmae],
		CONCAT(p.FirstName,' ', p.LastName) AS ManagerName,
		d.Name AS [DepartmentName]
	FROM Employees AS e
	JOIN Employees AS p
	ON p.EmployeeID = e.ManagerID
	JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID
	ORDER BY EmployeeID ASC