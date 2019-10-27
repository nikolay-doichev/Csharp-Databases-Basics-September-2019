CREATE TABLE Deleted_Employees(
	EmployeeId INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	MiddleName VARCHAR(50),
	JobTitle VARCHAR(50),
	DepartmentId INT,
	Salary MONEY)

go

CREATE TRIGGER tr_DeletedEmployees ON Employees FOR DELETE
AS
BEGIN
	INSERT INTO Deleted_Employees( 
								  FirstName, 
								  LastName, 
								  MiddleName, 
								  JobTitle, 
								  DepartmentId, 
								  Salary) 
								  SELECT 
										  d.FirstName,
										  d.LastName,
										  d.MiddleName,
										  d.JobTitle,
										  d.DepartmentID,
										  d.Salary
									FROM deleted AS d
END

go