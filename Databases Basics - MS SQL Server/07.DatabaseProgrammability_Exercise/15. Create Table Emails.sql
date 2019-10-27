CREATE TABLE NotificationEmails (
	Id INT PRIMARY KEY IDENTITY,
	Recipient INT NOT NULL,
	[Subject] VARCHAR(30) NOT NULL,
	Body VARCHAR(100) NOT NULL
)

GO

CREATE TRIGGER tr_EmailTriger ON Logs FOR INSERT	
	AS
	BEGIN
		INSERT INTO NotificationEmails(Recipient, [Subject], Body)
		SELECT i.AccountId, 
		CONCAT('Balance change for account: ', i.AccountId),
		CONCAT('On ', GETDATE(),' ', 'your balance was changed from',' ', 
		l.OldSum, ' to ', l.NewSum)
		FROM inserted AS i
		JOIN Logs AS l ON i.LogId = l.LogId	
	END

GO

UPDATE Accounts SET Balance = 113.12
Where AccountHolderId = 1

TRUNCATE TABLE Logs

SELECT *
FROM NotificationEmails