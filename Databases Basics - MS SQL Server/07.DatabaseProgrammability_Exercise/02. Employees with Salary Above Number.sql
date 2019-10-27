CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber(@SalaryNumber DECIMAL(18,4))
	AS
	SELECT FirstName, LastName
		FROM Employees
		WHERE Salary >= @SalaryNumber