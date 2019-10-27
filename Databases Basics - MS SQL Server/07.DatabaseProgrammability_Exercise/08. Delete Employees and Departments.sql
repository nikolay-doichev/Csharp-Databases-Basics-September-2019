CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT) 
AS
BEGIN
	--Delete all working on project that are intended to be deleted
	DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (
						 --People i want to delete
						 SELECT EmployeeID 
						 FROM Employees 
						 WHERE DepartmentID = @departmentId)
	--Set ManagerID to NULL on all the people which manager is being deleted
	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN(	 SELECT EmployeeID 
						 FROM Employees 
						 WHERE DepartmentID = @departmentId)
	--Set column ManagerId(Depratments) to be nullable
	ALTER TABLE Departments
	ALTER COLUMN ManagerID INT

	--Set ManagerID to NULL for all deparments whose manager was deleted
	UPDATE  Departments
	SET ManagerID = NULL
	WHERE DepartmentID = @departmentId

	--As Employees doesn,t have any more relations we can safely delete all employees in wanted depatment
	DELETE FROM Employees
	WHERE DepartmentID = @departmentId

	--As Departments doesn,t have any more relations we can safely delete all employees in wanted depatment the whole department
	DELETE FROM Departments
	WHERE DepartmentID = @departmentId

	SELECT COUNT(*) FROM Employees
	WHERE DepartmentID = @departmentId
END