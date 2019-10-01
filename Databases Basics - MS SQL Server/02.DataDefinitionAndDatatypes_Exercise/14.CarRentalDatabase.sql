CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName VARCHAR(30) NOT NULL,
	DailyRate DECIMAL(4,2) NOT NULL,
	WeeklyRate DECIMAL(4,2) NOT NULL,
	MounthlyRate DECIMAL(4,2) NOT NULL,
	WeekendRate DECIMAL(4,2) NOT NULL
)

CREATE TABLE Cars (
	Id INT PRIMARY KEY IDENTITY,
	PlateNumber INT NOT NULL,
	Model VARCHAR(30) NOT NULL,
	Manufacturer VARCHAR(30) NOT NULL,
	CarYear INT NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Doors TINYINT NOT NULL,
	Pictures VARBINARY(MAX)
	CHECK(DATALENGTH(Pictures) <=921600),
	Condition NVARCHAR(10) NOT NULL,
	Available CHAR(3)
)

CREATE TABLE Employees (
	Id	INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Title VARCHAR(30) NOT NULL,
	Notes NVARCHAR(30)
)

CREATE TABLE Customers (
	Id INT PRIMARY KEY IDENTITY,
	DriverLicenceNumber INT NOT NULL,
	FullName VARCHAR(60) NOT NULL,
	[Address] NVARCHAR(MAX) NOT NULL,
	City NVARCHAR(30) NOT NULL,
	ZIPCode INT NOT NULL,
	Notes NVARCHAR(30)
)

CREATE TABLE RentalOrders (
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
	CarId INT FOREIGN KEY REFERENCES Cars(Id),
	Tanklevel INT NOT NULL,
	KilometrageStart SMALLINT NOT NULL,
	KilometrageEnd SMALLINT NOT NULL,
	TotalKilometrage SMALLINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT NOT NULL,
	RateApplied BIT,
	TaxRate DECIMAL (4,2) NOT NULL,
	OrderStatus BIT NOT NULL,
	Notes NVARCHAR(30),
	CHECK( TotalDays = DATEDIFF(day, StartDate, EndDate) +1),
	CHECK( TotalKilometrage = KilometrageEnd - KilometrageStart )
)

INSERT INTO Categories ( CategoryName, DailyRate, WeeklyRate, MounthlyRate, WeekendRate) VALUES
('Kupe', 5.5, 9.5, 20, 4),
('Sedan', 3.5, 7.5, 10, 6),
('Limuzina', 6.5, 5.5, 15, 9)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Pictures, Condition, Available) VALUES
(2356, 'BMW', 'X5', 2007, 1, 4, null, 'NEW', 'Yes'),
(8697, 'Audi', 'A4', 2009, 2, 4, null, 'NEW', 'Yes'),
(6425, 'Mercedes', 'C220', 2012, 3, 4, null, 'NEW', 'Yes')

INSERT INTO Employees( FirstName, LastName, Title, Notes) VALUES
('Nikolay', 'Doychev', 'Sir', null),
('Pavlina', 'Yakimova', 'Miss', null),
('Metodi', 'Yakimov', 'Sir', null)

INSERT INTO Customers (DriverLicenceNumber, FullName, [Address], City, ZIPCode, Notes) VALUES
(203020, 'Stefan', 'Some address', 'Radomir', 2400, 'Some text here'),
(203040, 'Maria', 'Some address 2', 'Sofia', 2415, 'Some text here, etc'),
(203050, 'Lora', 'Some address 3', 'Varna', 2200, 'Some text here and so on')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, Tanklevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus,Notes) VALUES
(1, 1, 1, 130, 0, 260, 260, '2001-12-30', '2001-12-31', 2, 1, 2, 0, 'Some text here'),
(2, 2, 2, 150, 0, 300, 300, '2002-03-20', '2002-03-20', 1, 0, 4, 1, 'Some text here, etc'),
(3, 3, 3, 140, 0, 280, 280, '2003-09-15', '2003-09-17', 3, 1, 6, 1, 'Some text here and so on')
