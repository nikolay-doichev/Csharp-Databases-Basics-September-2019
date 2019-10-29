CREATE FUNCTION udf_CalculateTickets
		(@origin VARCHAR(30), 
		 @destination VARCHAR(30), 
		 @peopleCount INT)
		 RETURNS VARCHAR(30)
	AS	
	BEGIN
	DECLARE @stringResult VARCHAR(30) 
	IF(EXISTS ( SELECT * 
					FROM Flights AS f
					WHERE f.Origin = @origin AND f.Destination = @destination
				) AND @peopleCount > 0)
	BEGIN
		DECLARE @result DECIMAL(15,2)
		DECLARE @prizeTicket DECIMAL(15,2) 
		SET @prizeTicket = (SELECT t.Price
								FROM Flights AS f
								LEFT JOIN Tickets AS t
								ON f.Id = t.FlightId
								WHERE f.Origin = @origin AND f.Destination = @destination)		
		SET @result = @prizeTicket * @peopleCount
		SET @stringResult = CONCAT('Total price ', @result)
	END
	ELSE IF (NOT EXISTS ( SELECT * 
					FROM Flights AS f
					WHERE f.Origin = @origin AND f.Destination = @destination))
	BEGIN
		SET @stringResult = 'Invalid flight!'
	END
	ELSE IF (@peopleCount <= 0)
	BEGIN
		SET @stringResult = 'Invalid people count!'
	END
	RETURN @stringResult
	END