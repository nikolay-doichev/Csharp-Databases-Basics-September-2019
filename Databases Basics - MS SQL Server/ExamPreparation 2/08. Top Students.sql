SELECT TOP 10 s.FirstName, 
			  s.LastName, 
			  ROUND(CAST(AVG(se.Grade)AS DECIMAL(3,2)),2) AS Grade
	FROM StudentsExams AS se
	JOIN Students AS s ON se.StudentId = s.Id
	GROUP BY s.Id, s.FirstName, s.LastName
	ORDER BY AVG(se.Grade) DESC, s.FirstName, s.LastName