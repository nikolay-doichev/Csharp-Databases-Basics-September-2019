SELECT pl.[Name] ,pl.Seats, COUNT(p.Id) AS [Passengers Count]
	FROM Tickets AS t
	right JOIN Passengers AS p ON t.PassengerId = p.Id
	right JOIN Flights AS f ON t.FlightId = f.Id
	right JOIN Planes AS pl ON f.PlaneId = pl.Id
	GROUP BY pl.[Name], pl.Seats
	ORDER BY [Passengers Count] DESC, pl.[Name], pl.Seats