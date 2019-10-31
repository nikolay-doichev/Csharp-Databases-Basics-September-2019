SELECT p.Id,
	   p.[Name],
	   CONCAT(p.[Size], 'KB') AS [Size]
	FROM Files AS f
	RIGHT JOIN Files AS p ON f.ParentId = p.Id
	WHERE F.ParentId IS NULL