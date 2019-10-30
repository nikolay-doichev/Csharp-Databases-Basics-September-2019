CREATE PROC usp_ExcludeFromSchool(@StudentId INT)
AS
BEGIN 
	IF(NOT EXISTS(SELECT *
				FROM Students
				WHERE Students.Id = @studentId))
	BEGIN;	
	RAISERROR('This school has no student with the provided id!',16,1);
	END
	ELSE
	BEGIN
	DELETE FROM StudentsTeachers WHERE StudentId = @StudentId
	DELETE FROM StudentsSubjects WHERE StudentId = @StudentId
	DELETE FROM StudentsExams WHERE StudentId = @StudentId

	DELETE FROM Students WHERE Id = @StudentId
	END
END

EXEC usp_ExcludeFromSchool 1
SELECT COUNT(*) FROM Students

EXEC usp_ExcludeFromSchool 301