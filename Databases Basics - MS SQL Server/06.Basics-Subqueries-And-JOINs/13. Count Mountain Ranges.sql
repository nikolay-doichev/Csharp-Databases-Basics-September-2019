	Select a.CountryCode,
		   COUNT(a.MountainRange) AS [MountainRanges] 
	FROM (SELECT *
	FROM Mountains AS m
	JOIN MountainsCountries AS mn
	ON m.Id = mn.MountainId) AS a
	WHERE a.CountryCode IN('BG', 'RU', 'US')
	GROUP BY a.CountryCode	