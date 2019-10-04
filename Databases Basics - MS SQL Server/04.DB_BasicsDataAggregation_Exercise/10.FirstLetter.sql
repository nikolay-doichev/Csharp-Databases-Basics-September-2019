SELECT LEFT(FirstName,1) AS [FirstLetter]
	FROM WizzardDeposits
	WHERE DepositGroup = 'Troll Chest'
	Group by LEFT(FirstName,1)
	ORDER BY FirstLetter