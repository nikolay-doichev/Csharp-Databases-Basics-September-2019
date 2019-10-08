SELECT TOP(5) e.EmployeeID AS [EmployeeId], 
	e.JobTitle,
	e.AddressID AS [AddressId],
	d.AddressText AS[AddressText]
	FROM Employees AS e
	JOIN Addresses AS d
	ON e.AddressID = d.AddressID
	ORDER BY AddressID ASC