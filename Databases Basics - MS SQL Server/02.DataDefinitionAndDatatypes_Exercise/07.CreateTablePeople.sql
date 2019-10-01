CREATE TABLE People (
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX),
	CHECK(DATALENGTH (Picture) <= 2097152),
	Height DECIMAL(3,2),
	[Weight] DECIMAL(5,2),
	Gender CHAR(1)
	CHECK(Gender in ('m', 'f')) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
	)

INSERT INTO People ( [Name], Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES
('Felipe', null, 0.25, 2.9, 'm', '2019-09-16', 'Small kity who loves cuddles'),
('Maya', null, 1.0, 17.0, 'f', '2016-05-05', 'I`m princes'),
('Metodi', null, 1.78, 80, 'm', '1957-12-21', 'Super, happy grandfather'),
('Nikolay', null, 1.95, 93.0, 'm', '1984-01-01', 'He love`s Pavlina'),
('Pavlina', null, 1.63, 103, 'f', '1990-12-24', 'Love`s Nikolay')