SELECT d.DepositGroup, MAX(MagicWandSize) as [LongetMagicWand]
	FROM WizzardDeposits AS d
	GROUP BY d.DepositGroup