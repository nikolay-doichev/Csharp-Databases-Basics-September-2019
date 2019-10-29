SELECT CONCAT(FirstName, ' ',LastName) AS [Full Name],
	   pl.[Name] AS [Plane Name],
	   CONCAT(f.Origin, ' - ', f.Destination) AS [Trip],
	   lt.[Type]
	FROM Passengers AS p
	LEFT JOIN Tickets AS t ON p.Id = t.PassengerId
	LEFT JOIN Flights AS f ON t.FlightId = f.Id
	LEFT JOIN Planes AS pl ON pl.Id = f.PlaneId 
	LEFT JOIN Luggages AS l ON l.Id = t.LuggageId
	LEFT JOIN LuggageTypes AS lt ON lt.Id = l.LuggageTypeId
	WHERE t.Id IS NOT NULL
	ORDER BY [Full Name], pl.[Name], f.Origin, f.Destination, lt.[Type]