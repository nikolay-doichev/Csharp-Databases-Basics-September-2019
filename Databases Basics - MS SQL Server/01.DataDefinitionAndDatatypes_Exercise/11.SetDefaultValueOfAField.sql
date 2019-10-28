CREATE TABLE Users(
	Id BIGINT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	CHECK(DATALENGTH (ProfilePicture) <= 921600),
	LastLoginTime DATETIME2,
	IsDeleted BIT
	)

INSERT INTO Users (Username, [Password], ProfilePicture, LastLoginTime, IsDeleted) VALUES
('niko11', '11111', null, '2019-09-22', 0),
('niko22', '22222', null, '2019-09-21', 0),
('niko33', '33333', null, '2019-09-20', 0),
('niko44', '44444', null, '2019-09-19', 0),
('niko55', '55555', null, '2019-09-18', 0)

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC07D11A2B66

ALTER TABLE Users
ADD CONSTRAINT PK_CompositeUsername
PRIMARY KEY(Id, Username)

ALTER TABLE Users
ADD CONSTRAINT PK_PassWordConstraint 
CHECK (DATALENGTH([Password]) >= 5)

ALTER TABLE Users
ADD CONSTRAINT DF_LastLoginTime
DEFAULT GETDATE() FOR LastLoginTime

INSERT INTO Users (Username, [Password], ProfilePicture, IsDeleted) VALUES
('Niko21233', '1234512678', null, 1)