SELECT CONCAT(s.FirstName, ' ', s.LastName) AS [FullName]
	FROM Exams AS e
	RIGHT JOIN StudentsExams AS se ON E.Id = SE.ExamId
	RIGHT JOIN Students AS s ON s.Id = se.StudentId
	WHERE	e.Id is NULL
	ORDER BY FullName