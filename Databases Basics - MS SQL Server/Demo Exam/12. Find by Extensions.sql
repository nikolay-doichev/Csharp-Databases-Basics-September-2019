CREATE PROC usp_FindByExtension(@extension VARCHAR(15))
AS
BEGIN
	SELECT Id, [Name], CONCAT([Size], 'KB') AS [Size]
		FROM Files
		WHERE SUBSTRING([Name],CHARINDEX('.',[Name],0)+1, LEN([Name])) = @extension
END

EXEC usp_FindByExtension 'txt'