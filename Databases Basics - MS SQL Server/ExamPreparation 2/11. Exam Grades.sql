CREATE OR ALTER FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(3,2))
RETURNS NVARCHAR(100)
AS
BEGIN
	DECLARE @result NVARCHAR(100)
	IF(NOT EXISTS(SELECT *
				FROM Students
				WHERE Students.Id = @studentId))
	BEGIN
		SET @result = 'The student with provided id does not exist in the school!'
	END
	ELSE IF(@grade>6.00)
	BEGIN
		SET @result = 'Grade cannot be above 6.00!'
	END
	ELSE
	BEGIN
	DECLARE @count INT = (SELECT COUNT(s.Id) AS [CountStudents]
								FROM StudentsExams AS se
								JOIN Students AS s ON se.StudentId = s.Id
								WHERE s.Id = @studentId AND se.Grade >= @grade AND se.Grade <= @grade+0.5
								GROUP BY s.Id);
	DECLARE @studentName VARCHAR(10) = (SELECT s.FirstName
								FROM StudentsExams AS se
								JOIN Students AS s ON se.StudentId = s.Id
								WHERE s.Id = @studentId AND se.Grade >= @grade AND se.Grade <= @grade+0.5
								GROUP BY s.Id, s.FirstName);
	SET @result = CONCAT('You have to update ', @count, ' grades for the student ', @studentName)
	END
	RETURN @result
END

GO
SELECT dbo.udf_ExamGradesToUpdate(12, 6.20)
SELECT dbo.udf_ExamGradesToUpdate(12, 5.50)
SELECT dbo.udf_ExamGradesToUpdate(121, 5.50)