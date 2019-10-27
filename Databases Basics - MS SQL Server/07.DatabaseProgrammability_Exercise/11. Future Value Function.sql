CREATE OR ALTER FUNCTION ufn_CalculateFutureValue 
(@sum DECIMAL(15,4), @yearlyInterestRate FLOAT, @years INT)
RETURNS DECIMAL(15,4) AS
BEGIN
	DECLARE @value DECIMAL(15,6);
	SET @value = @sum * (POWER((1+@yearlyInterestRate), @years))
	RETURN @value
END