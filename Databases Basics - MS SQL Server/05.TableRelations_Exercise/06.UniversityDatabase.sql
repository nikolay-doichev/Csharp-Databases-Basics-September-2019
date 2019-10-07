CREATE TABLE Majors(
	MajorID INT PRIMARY KEY, 
	[Name]  NVARCHAR(30) NOT NULL
)

CREATE TABLE Students(
	StudentsID INT PRIMARY KEY,
	StudentNumber NVARCHAR(15) NOT NULL,
	StudentName NVARCHAR(60) NOT NULL,
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID) NOT NULL
	)

CREATE TABLE Payments (
	PaymentID INT PRIMARY KEY,
	PaymentDate SMALLDATETIME NOT NULL,
	PaymentAmount DECIMAL(10, 2) NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentsID) NOT NULL
)

CREATE TABLE Subjects (
	SubjectID INT PRIMARY KEY,
	SubjectName NVARCHAR(30) NOT NULL,
)

CREATE TABLE Agenda (
	StudentID INT FOREIGN KEY REFERENCES Students(StudentsID),
	SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
	CONSTRAINT PK_CompositStudentIDSubjectID
	PRIMARY KEY(StudentID, SubjectID)
)