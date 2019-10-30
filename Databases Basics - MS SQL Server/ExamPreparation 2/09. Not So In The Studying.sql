SELECT CONCAT(s.FirstName, IIF(s.MiddleName IS NULL, ' ', CONCAT(' ',s.MiddleName, ' ')), s.LastName) AS [Full Name]
	FROM Students AS s
	LEFT JOIN StudentsSubjects AS ss ON ss.StudentId = s.Id
	WHERE ss.Id IS NULL
	ORDER BY [Full Name]