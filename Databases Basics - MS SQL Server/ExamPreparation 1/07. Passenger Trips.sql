SELECT CONCAT(p.FirstName, ' ', p.LastName) AS [FullName],
	   f.Origin,
	   f.Destination
	FROM Tickets AS t
	JOIN Passengers AS p ON p.Id = t.PassengerId
	JOIN Flights AS f ON f.Id = t.FlightId
	ORDER BY FullName, Origin, Destination 