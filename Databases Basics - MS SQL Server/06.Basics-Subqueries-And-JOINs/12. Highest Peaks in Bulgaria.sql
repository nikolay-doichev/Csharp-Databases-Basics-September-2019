SELECT m.CountryCode,
	   mn.MountainRange,
	   p.PeakName,
	   p.Elevation
	FROM MountainsCountries AS m
	JOIN Peaks AS p
	ON p.MountainId = m.MountainId
	JOIN Mountains AS mn
	ON mn.Id = m.MountainId
	WHERE m.CountryCode = 'BG' AND p.Elevation > 2835
	ORDER BY Elevation DESC
