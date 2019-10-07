CREATE TABLE Manufacturers(
	ManufacturerID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(30) NOT NULL,
	EstablishedOn DATE NOT NULL
)

CREATE TABLE Models(
	ModelID INT PRIMARY KEY,
	[Name] NVARCHAR(30) NOT NULL,
	ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufactureRID) NOT NULL
)

INSERT INTO Manufacturers ([Name], EstablishedOn) Values
('BMW', '1916-07-03'),
('Tesla', '2003-01-01'),
('Lada', '1966-05-01')

INSERT INTO Models (ModelID, [Name], ManufacturerID) VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3)