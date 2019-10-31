CREATE OR ALTER FUNCTION udf_UserTotalCommits(@username VARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @numberOfCommits INT = (
	SELECT COUNT(c.ContributorId)
		FROM Commits AS c
		WHERE c.ContributorId = (SELECT TOP 1 Id
					FROM Users
					WHERE Username = @username));

	RETURN @numberOfCommits;
END

GO
SELECT dbo.udf_UserTotalCommits('UnderSinduxrein')