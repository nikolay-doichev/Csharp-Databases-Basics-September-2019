CREATE TABLE Directors (
	Id INT PRIMARY KEY IDENTITY,
	DirectorName VARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Genres (
	Id INT PRIMARY KEY IDENTITY,
	GenreName VARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName VARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Movies (
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(30) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear DATE NOT NULL,
	Lenght INT NOT NULL,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoriesId INT FOREIGN KEY REFERENCES Categories(Id),
	Rating INT NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Directors (DirectorName, Notes) VALUES
('Niko', 'Im movie Director'),
('Poli', 'Im movie quen'),
('Maya', 'Im movie princes'),
('Metodi', 'Im movie hero'),
('Ivan', 'Im movie superhero')

INSERT INTO Genres (GenreName, Notes) VALUES
('Comedy', 'Its funny'),
('Horror', 'Its scary'),
('Action', 'Its epic'),
('Love story', 'Its romantic'),
('Drama', 'Its sad')

INSERT INTO Categories ( CategoryName, Notes) VALUES
('For everyone', 'For everyone who want to laugh '),
('For adult', 'For someone that want adrenaline '),
('For teenage and upper', 'Guns, ladies, alchlo, drugs and a lot of fights'),
('For adult and lonely', 'If you are alone to cheer up somehow'),
('For sad peole', 'If you are unhappy and lonely to cry everything')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Lenght, GenreId, Rating, Notes) VALUES
('ScaryMovie', 1, '2000-03-03', 95, 1, 6, 'Very funny movie'),
('Conjuring', 2, '2016-05-05', 102, 2, 8, 'The best horror movie of all time!') ,
('Avengers', 3, '2012-04-29', 122, 3, 7, 'The beggining of something epic'),
('Unforgitable', 1, '2003-02-11', 101, 4, 5, 'One story for love'),
('Hachicko', 1, '2014-06-06', 112, 5, 9, 'The movie that everyone cries') 