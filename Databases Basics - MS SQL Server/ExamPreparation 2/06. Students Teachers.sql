SELECT s.FirstName, s.LastName, COUNT(t.Id) AS [TeachersCount]
	FROM StudentsTeachers AS st
	JOIN Students AS s ON st.StudentId = s.Id
	JOIN Teachers AS t ON st.TeacherId = t.Id
	GROUP BY s.FirstName, s.LastName