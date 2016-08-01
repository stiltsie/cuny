CREATE SCHEMA `assignment3`
;

CREATE TABLE `assignment3`.`user3` (
Person varchar(100),
Grp varchar(50)
);

INSERT INTO `assignment3`.`user3` 
(Person, Grp)
VALUES
('Modesto', 'IT'),
('Ayine', 'IT'),
('Christopher', 'Sales'),
('Cheong woo', 'Sales'),
('Salat', 'Administration'),
('Heidy', NULL),
(NULL, 'Operations')
;

CREATE TABLE `assignment3`.`rm4` (
Grp varchar(50),
Room101 varchar(50),
Room102 varchar(50),
AuditoriumA varchar(50),
AuditoriumB varchar(50)
);

INSERT INTO `assignment3`.`rm4` 
(Grp, Room101, Room102, AuditoriumA, AuditoriumB)
VALUES
('IT', 'Y', 'Y', NULL, NULL),
('Sales', NULL, 'Y', 'Y', NULL),
('Administration', NULL, NULL, NULL, NULL),
('Operations', NULL, NULL, NULL, NULL)
;

SELECT *
FROM assignment3.user3
;

SELECT *
FROM assignment3.rm4
;

SELECT person, user3.grp,Room101, Room102, AuditoriumA, AuditoriumB
FROM assignment3.user3
LEFT JOIN assignment3.rm4
ON user3.Grp = rm4.Grp
where person is not NULL
ORDER BY person, user3.grp,Room101, Room102, AuditoriumA, AuditoriumB
;
