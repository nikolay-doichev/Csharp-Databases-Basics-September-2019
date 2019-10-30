--WILDCARDS
SELECT *
	FROM Planes
	WHERE [Name] LIKE '%tr%'
	ORDER BY Id, [Name], Seats, [Range]

--Built-in Function
SELECT *
	FROM Planes
	WHERE CHARINDEX('tr',[Name]) > 0
	ORDER BY Id, [Name], Seats, [Range]