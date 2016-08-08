CREATE SCHEMA `assignment4`
;

CREATE TABLE `assignment4`.`employees` (
Employee_ID int(50),
Person varchar(100),
Title varchar (100),
Class varchar(50),
Supervisor_ID int(100)
);

INSERT INTO `assignment4`.`employees` 
(Employee_ID, Person, Title, Class, Supervisor_ID)
VALUES
('11215', 'Johnny Jones', 'CEO', '1', NULL),
('11211', 'Billy Balls', 'SVP, Research', '2', '11215'),
('76543', 'Freddy Fingers', 'Analyst', '3', '54321'),
('54321', 'Lyla Loads', 'CIO', '2', '11215'),
('02134', 'Bridget Baggies', 'Research Asst', '3', '11211')
;

SELECT level1.person AS 'Level 1', level2.person AS 'Level 2', level3.person AS 'Level 3'
FROM assignment4.employees AS level1
INNER JOIN assignment4.employees AS level2 
ON level1.employee_ID = level2.supervisor_ID
INNER JOIN assignment4.employees AS level3 
ON level3.supervisor_ID = level2.employee_ID 
ORDER BY level1.employee_ID, level2.employee_ID
;
