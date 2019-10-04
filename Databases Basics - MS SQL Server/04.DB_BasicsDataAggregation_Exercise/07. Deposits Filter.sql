SELECT c.DepositGroup,
	SUM(c.DepositAmount) AS TotalSum
	FROM WizzardDeposits AS C
	WHERE MagicWandCreator = 'Ollivander family'
	GROUP BY DepositGroup
	HAVING SUM(c.DepositAmount) < 150000
	ORDER BY TotalSum DESC