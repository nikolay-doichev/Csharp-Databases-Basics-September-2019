SELECT u.Username, AVG(f.Size) AS [Size]
	FROM Users AS u
	LEFT JOIN Commits AS c ON u.Id = c.ContributorId
	JOIN Files AS f ON c.Id = f.CommitId
	GROUP BY u.Username
	ORDER BY AVG(f.Size) DESC, u.Username