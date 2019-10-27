CREATE PROC usp_EmployeesBySalaryLevel(@salaryLevel VARCHAR(7))
AS
BEGIN
SELECT FirstName, LastName
	FROM Employees AS e
	WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @salaryLevel
END