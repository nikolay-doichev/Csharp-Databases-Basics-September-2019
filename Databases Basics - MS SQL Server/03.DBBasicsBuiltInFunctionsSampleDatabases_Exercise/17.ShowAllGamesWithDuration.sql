SELECT [Name] AS [Game],
CASE
	WHEN DATEPART(HOUR, [Start]) BETWEEN 0 AND 11 THEN 'Morning'
	WHEN DATEPART(HOUR, [Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
	ELSE 'Evening'
	END AS [Part of the Day],
CASE
	WHEN Duration <= 3 then 'Extra Short'
	WHEN Duration BETWEEN 4 AND 6 then 'Short'
	WHEN Duration > 6 then 'Long'
	WHEN Duration IS NULL then 'Extra Long'
	END AS [Duration]
	FROM Games
	ORDER BY [Game], [Duration], [Part of the Day]