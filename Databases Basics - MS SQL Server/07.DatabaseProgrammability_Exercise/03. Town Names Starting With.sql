CREATE PROCEDURE usp_GetTownsStartingWith(@Index VARCHAR(MAX))
	AS
	SELECT t.[Name]
		FROM Towns AS t
		WHERE SUBSTRING(t.[Name],1, LEN(@Index)) = @Index