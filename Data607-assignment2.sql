CREATE SCHEMA Data607_Assignment2
;

CREATE TABLE Data607_Assignment2.Reviewers (
Person_ID int(10),
Real_Name varchar(100),
Relationship varchar(100)
);

INSERT INTO Data607_Assignment2.Reviewers
(Person_ID, Real_Name, Relationship)
VALUES
('1', 'David', 'Brother'),
('2', 'John', 'Father'),
('3', 'Jenny', 'Friend'),
('4', 'Grace', 'Friend'),
('5', 'Kate', 'Wife')
;

CREATE TABLE Data607_Assignment2.Pop_Movies (
Movie_ID int(10),
Real_Name varchar(100),
Genre varchar(100)
);

INSERT INTO Data607_Assignment2.Pop_Movies
(Movie_ID, Real_Name, Genre)
VALUES
('1', 'Star Wars Ep. VII: The Force Awakens', 'Adventure'),
('2', 'Jurassic World', 'Action'),
('3', 'The Avengers: Age of Ultron','Action'),
('4', 'Inside Out', 'Adventure'),
('5', 'Furious 7','Action'),
('6', 'American Sniper', 'Drama')
;

CREATE TABLE Data607_Assignment2.PopMovieReviews (
Person_ID int(10),
Movie_ID int(10),
Rating int(1)
);

INSERT INTO Data607_Assignment2.PopMovieReviews
(Person_ID, Movie_ID, Rating)
VALUES
('1', '1', '4'),
('1', '2', '3'),
('1', '3', null),
('1', '4', '2'),
('1', '5', '5'),
('1', '6', '3'),
('2', '1', '2'),
('2', '2', null),
('2', '3', '1'),
('2', '4', '3'),
('2', '5', '5'),
('2', '6', '2'),
('3', '1', '5'),
('3', '2', '1'),
('3', '3', null),
('3', '4', '4'),
('3', '5', '4'),
('3', '6', '3'),
('4', '1', '5'),
('4', '2', '5'),
('4', '3', '5'),
('4', '4', '1'),
('4', '5', '5'),
('4', '6', '2'),
('5', '1', '1'),
('5', '2', null),
('5', '3', '5'),
('5', '4', '1'),
('5', '5', '2'),
('5', '6', '3')
;
