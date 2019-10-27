CREATE OR ALTER PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL(15,4))
AS
BEGIN TRANSACTION
		UPDATE Accounts SET Balance -= @Amount
		WHERE Accounts.Id = @SenderId
		UPDATE Accounts SET Balance += @Amount
		WHERE Accounts.Id = @ReceiverId	
	IF(@Amount < 0)
	BEGIN
	ROLLBACK
	RAISERROR('Invalid number!',16,1)
	return
	END
COMMIT

GO
EXEC usp_TransferMoney 5, 1, 5000.0000

SELECT *
	FROM Accounts