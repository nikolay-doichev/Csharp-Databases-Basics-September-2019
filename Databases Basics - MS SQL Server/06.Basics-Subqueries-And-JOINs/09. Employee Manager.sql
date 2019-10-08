SELECT e.EmployeeID,
		e.FirstName,
		e.ManagerID,
		p.FirstName AS ManagerName
	FROM Employees AS e
	JOIN Employees AS p
	ON p.EmployeeID = e.ManagerID
	WHERE e.ManagerID IS NOT NULL AND e.ManagerID IN(3,7)
	ORDER BY EmployeeID ASC