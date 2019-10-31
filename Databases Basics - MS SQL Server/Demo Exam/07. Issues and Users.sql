SELECT i.Id,
	   CONCAT(u.Username, ' : ', i.Title) AS [IssueAssignee]
	FROM Issues AS i
	LEFT JOIN Users AS u ON i.AssigneeId = u.Id
	ORDER BY i.Id DESC, i.AssigneeId ASC