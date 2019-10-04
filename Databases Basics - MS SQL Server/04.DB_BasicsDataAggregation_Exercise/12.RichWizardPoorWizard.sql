SELECT SUM([Difference]) AS SumDifference FROM(SELECT FirstName AS [Host Wizzard],
	DepositAmount AS [Host Wizzard Deposit],
	LEAD(FirstName) OVER(Order BY Id) AS [Guest Wizard],
	LEAD(DepositAmount) OVER(ORDER BY Id) AS [Guest Wizard Deposit],
	DepositAmount - LEAD(DepositAmount) OVER(ORDER BY Id) AS [Difference]
	FROM WizzardDeposits) AS DiffTable