CREATE OR ALTER PROC usp_WithdrawMoney(@AccountId INT, @MoneyAmount DECIMAL(15,4))
	AS
	BEGIN TRANSACTION
	IF(@MoneyAmount > 0)
	BEGIN
		UPDATE Accounts SET Balance -= @MoneyAmount
		WHERE Accounts.Id = @AccountId
	END
	
	COMMIT
GO

EXEC usp_WithdrawMoney 1, 10
SELECT * FROM Accounts
WHERE AccountHolderId = 1