CREATE TABLE `assignment2`.`youtube_video` (
ID int(3),
Title varchar(50),
Length float(10),
URL varchar(100) );

INSERT INTO `assignment2`.`youtube_video` 
(ID, Title, Length, URL)
VALUES
('1', 'Do_You_Remember_the_First_Time', '3.48', 'https://www.youtube.com/watch?v=sPGepgWupTw'),
('2', 'Disco 2000', '5.03', 'https://www.youtube.com/watch?v=qJS3xnD7Mus'),
('3', 'This is Hardcore', '6.32', 'https://www.youtube.com/watch?v=JXbLyi5wgeg')

CREATE TABLE `assignment2`.`youtube_reviews` (
User_name varchar(50),
Rating int(3),
Review varchar(255),
ID int(12) );

INSERT INTO `assignment2`.`youtube_reviews` 
(User_name, Rating, Review, ID)
VALUES
('Sid', '5', 'Existential crises never felt so good', '3'),
('Malcom', '4', 'Smashing, loved it', '2'),
('Johnny', '1', 'Awful - I want my money back', '2'),
('Joe', '3', 'My raincost almost blew away', '3')

SELECT *
FROM assignment2.youtube_video
INNER JOIN assignment2.youtube_reviews
ON youtube_video.ID = youtube_reviews.ID