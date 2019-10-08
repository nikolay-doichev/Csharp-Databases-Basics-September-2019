SELECT TOP(5) c.CountryName,
	   r.RiverName
	FROM CountriesRivers AS cr
	JOIN Rivers AS r
	ON cr.RiverId = r.Id
	RIGHT JOIN Countries AS c
	ON c.CountryCode = cr.CountryCode
	WHERE c.ContinentCode = 'AF'
	ORDER BY CountryName ASC