SELECT d.DepositGroup,
	d.MagicWandCreator,
	MIN(DepositCharge) AS MinDepositCharge
	FROM WizzardDeposits AS d
	GROUP BY d.DepositGroup, d.MagicWandCreator
	ORDER BY MagicWandCreator, DepositGroup