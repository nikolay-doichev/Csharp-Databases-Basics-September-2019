CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan(@moneyChecked MONEY)
AS
BEGIN
	SELECT a.FirstName, a.LastName
	FROM(SELECT FirstName, 
				LastName, 
				AccountHolderId ,
				SUM(Balance) AS [TotalBalance]
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON ah.Id = a.AccountHolderId
	GROUP BY AccountHolderId, FirstName, LastName) AS a
	WHERE TotalBalance > @moneyChecked
	ORDER BY FirstName, LastName
END