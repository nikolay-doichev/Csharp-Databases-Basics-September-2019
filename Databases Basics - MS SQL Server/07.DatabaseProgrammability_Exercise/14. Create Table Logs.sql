CREATE TABLE Logs (
	LogId INT PRIMARY KEY IDENTITY,
	AccountId INT NOT NULL,
	OldSum DECIMAL(15,2) NOT NULL,
	NewSum DECIMAL(15,2) NOT NULL
)

GO

CREATE TRIGGER tr_NewEntryChanges ON Accounts FOR UPDATE
	AS
	BEGIN
		INSERT INTO Logs(AccountId, OldSum, NewSum)
		SELECT d.AccountHolderId, d.Balance, i.Balance
		FROM inserted AS i
		JOIN deleted AS d ON i.Id = d.Id		
	END
GO

UPDATE Accounts SET Balance = 143.12
Where AccountHolderId = 1

TRUNCATE TABLE Logs