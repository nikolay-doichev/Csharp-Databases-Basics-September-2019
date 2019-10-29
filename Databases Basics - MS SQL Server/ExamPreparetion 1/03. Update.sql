SELECT *
	FROM Flights AS f
	--WHERE Destination = 'Carlsbad'
	JOIN Tickets AS t ON t.FlightId = f.Id
	WHERE Destination = 'Carlsbad'
	UPDATE Tickets SET Price *= 1.13



UPDATE Tickets SET Price *= 1.13
WHERE FlightId IN ( SELECT [Id] FROM Flights
					WHERE Destination = 'Carlsbad')