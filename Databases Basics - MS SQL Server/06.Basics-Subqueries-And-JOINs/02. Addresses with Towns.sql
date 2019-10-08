SELECT TOP(50) e.FirstName,
	   e.LastName,
	   t.[Name],
	   a.AddressText
	FROM Addresses AS a
	JOIN Employees AS e
	ON e.AddressID = a.AddressID
	JOIN Towns AS t
	ON a.TownID = t.TownID
	ORDER BY e.FirstName ASC, e.LastName ASC