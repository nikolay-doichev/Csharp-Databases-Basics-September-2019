CREATE PROCEDURE usp_AssignProject (@EmployeeID INT, @ProjectID INT)
	AS
	BEGIN
		DECLARE @totalProjects INT
		SET @totalProjects = 
		(
		SELECT COUNT(*) 
			FROM EmployeesProjects ep
			WHERE ep.EmployeeID = @EmployeeID
		)

		IF (@totalProjects > 3)
		BEGIN
			THROW 50001, 'The employee has too many projects!', 1;
		END

		INSERT INTO [dbo].[EmployeesProjects](EmployeeID, ProjectID)
		VALUES(@EmployeeID, @ProjectID)
	END

GO 
EXEC usp_AssignProject 1,3