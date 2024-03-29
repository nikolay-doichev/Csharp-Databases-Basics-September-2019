CREATE DATABASE School

CREATE TABLE Students (
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(30) NOT NULL,
	MiddleName NVARCHAR(25),
	LastName NVARCHAR(30) NOT NULL,
	Age SMALLINT,
	[Address] NVARCHAR(50),
	Phone NCHAR(10),
	CONSTRAINT CHK_Age CHECK (Age >= 5 AND Age < 100)
)

CREATE TABLE Subjects (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(20) NOT NULL,
	[Lessons] INT NOT NULL,
	CONSTRAINT CHK_LessonsCount CHECK ([Lessons] > 0)
)

CREATE TABLE StudentsSubjects (
	Id INT PRIMARY KEY IDENTITY,
	StudentId INT FOREIGN KEY REFERENCES Students(Id) NOT NULL,
	SubjectId INT FOREIGN KEY REFERENCES Subjects(Id) NOT NULL,
	Grade DECIMAL(3,2) NOT NULL,
	CONSTRAINT CHK_GradeVerification CHECK (Grade BETWEEN 2 AND 6)
)

CREATE TABLE Exams (
	Id INT PRIMARY KEY IDENTITY,
	[Date]  DATETIME,
	SubjectId INT FOREIGN KEY REFERENCES Subjects(Id) NOT NULL
)

CREATE TABLE StudentsExams (
	StudentId INT FOREIGN KEY REFERENCES Students(Id) NOT NULL,
	ExamId INT FOREIGN KEY REFERENCES Exams(Id) NOT NULL,
	Grade DECIMAL(3,2) NOT NULL,
	CONSTRAINT CHK_GradeVerification2 CHECK (Grade BETWEEN 2 AND 6),
	CONSTRAINT PK_CompositePrimaryKey PRIMARY KEY(StudentId, ExamId)
)

CREATE TABLE Teachers (
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	[Address] NVARCHAR(20) NOT NULL,
	Phone NCHAR(10),
	SubjectId INT FOREIGN KEY REFERENCES Subjects(Id) NOT NULL
)

CREATE TABLE StudentsTeachers (
	StudentId INT FOREIGN KEY REFERENCES Students(Id) NOT NULL,
	TeacherId INT FOREIGN KEY REFERENCES Teachers(Id) NOT NULL,
	CONSTRAINT PK_CompositePrimaryKey_StudentsTeacher PRIMARY KEY(StudentId, TeacherId)
)