CREATE SCHEMA FinalBridgeAssignment
;

CREATE TABLE FinalBridgeAssignment.EnergyCategories (
Category_ID int(10),
Category varchar(100)
);

INSERT INTO FinalBridgeAssignment.EnergyCategories
(Category_ID, Category)
VALUES
('1', 'Fossil'),
('2', 'Renewable')
;

CREATE TABLE FinalBridgeAssignment.EnergyTypes (
Type_ID int(10),
Type varchar(100),
Category_ID int(10)
);

INSERT INTO FinalBridgeAssignment.EnergyTypes
(Type_ID, Type, Category_ID)
VALUES
('1', 'Electricity', '1'),
('2', 'Gas', '1'),
('3', 'Steam', '1'),
('4', 'Fuel Oil', '1'),
('5', 'Solar', '2'),
('6', 'Wind', '2')
;

SELECT FinalBridgeAssignment.EnergyCategories.category, FinalBridgeAssignment.EnergyTypes.type
FROM FinalBridgeAssignment.EnergyCategories
INNER JOIN FinalBridgeAssignment.EnergyTypes
ON EnergyCategories.Category_ID = EnergyTypes.Category_ID
ORDER BY FinalBridgeAssignment.EnergyTypes.type
;

CREATE TABLE FinalBridgeAssignment.Buildings (
Building_ID int(10),
Building varchar(100)
);

INSERT INTO FinalBridgeAssignment.Buildings
(Building_ID, Building)
VALUES
('1', 'Empire State Building'),
('2', 'Chrysler Building'),
('3', 'Borough of Manhattan Community College')
;

CREATE TABLE FinalBridgeAssignment.BuildingsEnergy (
Building_ID int(10),
Type_ID int(10)
);

INSERT INTO FinalBridgeAssignment.BuildingsEnergy
(Building_ID, Type_ID)
VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('2', '1'),
('2', '3'),
('3', '1'),
('3', '3'),
('3', '5')
;
SELECT FinalBridgeAssignment.Buildings.Building, FinalBridgeAssignment.EnergyTypes.type
FROM FinalBridgeAssignment.Buildings
LEFT JOIN FinalBridgeAssignment.BuildingsEnergy
ON Buildings.Building_ID = BuildingsEnergy.Building_ID
LEFT JOIN FinalBridgeAssignment.energytypes
ON EnergyTypes.Type_ID = BuildingsEnergy.Type_ID
ORDER BY FinalBridgeAssignment.Buildings.Building
;
INSERT INTO FinalBridgeAssignment.Buildings
(Building_ID, Building)
VALUES
('4', 'Bronx Lion House'),
('5', 'Brooklyn Childrens Museum')
;
INSERT INTO FinalBridgeAssignment.EnergyTypes
(Type_ID, Type, Category_ID)
VALUES
('7', 'Geothermal', '2')
;
INSERT INTO FinalBridgeAssignment.BuildingsEnergy
(Building_ID, Type_ID)
VALUES
('4', '7'),
('5', '1'),
('5', '7')
;
SELECT FinalBridgeAssignment.Buildings.Building, FinalBridgeAssignment.EnergyTypes.type,FinalBridgeAssignment.energycategories.Category
FROM FinalBridgeAssignment.buildings
LEFT JOIN FinalBridgeAssignment.BuildingsEnergy
ON BuildingsEnergy.Building_ID = buildings.Building_ID 
LEFT JOIN FinalBridgeAssignment.EnergyTypes
ON EnergyTypes.Type_ID = BuildingsEnergy.Type_ID
INNER JOIN FinalBridgeAssignment.energycategories
ON energytypes.category_ID = FinalBridgeAssignment.energycategories.category_ID where EnergyCategories.Category_ID = 2
;
SELECT FinalBridgeAssignment.energytypes.Type, count(distinct FinalBridgeAssignment.BuildingsEnergy.building_ID) 
FROM FinalBridgeAssignment.BuildingsEnergy
INNER JOIN FinalBridgeAssignment.energytypes
ON FinalBridgeAssignment.BuildingsEnergy.Type_ID = FinalBridgeAssignment.energytypes.Type_ID
group by FinalBridgeAssignment.energytypes.Type
order by FinalBridgeAssignment.energytypes.Type
;