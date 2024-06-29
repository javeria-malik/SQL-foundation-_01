create database  DemoDB;
use DemoDB;
CREATE TABLE `Student` (
    `StudentID` INT PRIMARY KEY AUTO_INCREMENT,
    `Name`      VARCHAR(50),
    `Course`    VARCHAR(10),
    `Score`     NUMERIC(5,2)
); 
 
-- Insert Sample Records 
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('A', 'CS', 80);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('B', 'CS', 60);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('C', 'IT', 70);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('D', 'IT', 85);
 
INSERT INTO `Student`(`Name`, `Course`, `Score`)
VALUES('E', 'ECE', 88);
SELECT * FROM `Student`;
select Sum(`Score`) as total from `Student`;
SELECT MIN(`Score`) AS `Minimum` FROM `Student`;
SELECT MAX(`Score`) AS `Maximum` FROM `Student`;
SELECT AVG(`Score`) AS `Average` FROM `Student`;
SELECT COUNT(*) AS `TotalStudents` FROM `Student`;
SELECT COUNT(*) AS `TopScorers` FROM `Student`
WHERE `Score` > 80;
-- group by method 
select * from `Student`;
SELECT
    `Course`,
    SUM(`Score`) AS `Total Score`,
    AVG(`Score`) AS `Average`,
    MIN(`Score`) AS `Minimum`,
    MAX(`Score`) AS `Maximum`
FROM `Student`
GROUP BY `Course`;
 SELECT
    `Course`,
    count(*) AS `Total person`
FROM `Student`
GROUP BY `Course`;
 select * from `Student`;
 SELECT
    `Name`,
    Count(*) AS `Total person`
FROM `Student`
GROUP BY `Name`;
-- filtering groups 
SELECT `Course` FROM `Student`
GROUP BY `Course`
HAVING COUNT(*) >= 2;
SELECT `Course`
FROM `Student`
WHERE `Course` IN (
    SELECT `Course`
    FROM `Student`
    GROUP BY `Course`
    HAVING COUNT(*) >= 2
);

SELECT `Course`, COUNT(`StudentID`) AS `Number of Students`
FROM `Student`
GROUP BY `Course`
HAVING COUNT(`StudentID`) >= 2;
CREATE TABLE `Dept1`(
    `DeptID` INT PRIMARY KEY,
    `Name` VARCHAR(50)
); 
 
CREATE TABLE `Employee1`(
    `EmpID` INT PRIMARY KEY,
    `Name` VARCHAR(50),
    `DeptID` INT REFERENCES Dept
); 
 
-- Sample records
-- Department Records
 
INSERT INTO `Dept1`
VALUES(101, 'Inventory');
 
INSERT INTO `Dept1`
VALUES(102, 'Sales');
 
-- Employee Records
	
INSERT INTO `Employee1`
VALUES(1, 'A', 101);
 
INSERT INTO `Employee1`
VALUES(2, 'B', 102);
 
INSERT INTO `Employee1`
VALUES(3, 'C', NULL);
 
-- Individual table queries.
 
SELECT * FROM `Dept1`;
SELECT * FROM `Employee1`;
 
	
-- Cartesian product
 
SELECT * FROM `Employee1`,`Dept1`;
 
-- Cross Join to pick only those records whose DeptID matches.
 
SELECT * FROM `Employee1`, `Dept1`
WHERE `Employee1`.`DeptID` = `Dept1`.`DeptID`;
 
	
-- Query with alias
 
SELECT * FROM `Employee1` as e, `Dept1` as d
WHERE e.`DeptID` = d.`DeptID`;
 
 
-- Same is achieved through INNER JOIN
 
 
SELECT * FROM `Employee` as e
INNER JOIN `Dept` as d ON (e.`DeptID` = d.`DeptID`);
-- sub queries
CREATE TABLE `Dept2`(
    `DeptID` INT PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(50) NOT NULL,
    `Location` VARCHAR(50) NOT NULL
); 
 
CREATE TABLE `Employee2` (
    `EmpID` INT PRIMARY KEY AUTO_INCREMENT,
    `FirstName` VARCHAR(50) NOT NULL,
    `LastName`  VARCHAR(50) NOT NULL,
    `DeptID` INT REFERENCES Dept,
    `Salary` NUMERIC(10,2) NOT NULL CHECK (Salary > 0)
); 
 INSERT INTO `Dept2`(`Name`,`Location`)
VALUES('Inventory', 'Loc1');
 
INSERT INTO `Dept2`(`Name`,`Location`)
VALUES('Sales', 'Loc2');
 
INSERT INTO `Dept2`(`Name`,`Location`)
VALUES('HR', 'Loc2');
 
-- Below insert command is very useful in SQL in Project
-- When you are inserting master data and if you do not know 
-- the generated ID then the query could be used to get the 
-- generated ID and given as input to the insert.
-- Here the output of the select command is given as input for 
-- DeptID column value.
-- NOTE - You need to make sure that it only retrieves one value
-- if it retrieves multiple values then it lead to failure.
 
INSERT INTO `Employee2`(`FirstName`, `LastName`, `DeptID`, `Salary`)
VALUES('A','A', (SELECT `DeptID` FROM `Dept` WHERE `Name`='Inventory'), 11000);
 
INSERT INTO `Employee2`(`FirstName`, `LastName`, `DeptID`, `Salary`)
VALUES('B','B', (SELECT `DeptID` FROM `Dept` WHERE `Name`='Sales'), 12000);
 
INSERT INTO `Employee2`(`FirstName`, `LastName`, `DeptID`, `Salary`)
VALUES('C','C', (SELECT `DeptID` FROM `Dept2` WHERE `Name`='HR'), 21000);
 
INSERT INTO `Employee2`(`FirstName`, `LastName`, `DeptID`, `Salary`)
VALUES('D','D', (SELECT `DeptID` FROM `Dept2` WHERE `Name`='HR'), 22000);
SELECT * FROM `Dept2`;
SELECT * FROM `Employee2`;
 
-- Display employees who work for HR department
-- Here the sub query returns the department ID for the HR 
-- which is then used as input for retrieving employee
-- records for that department.
 
SELECT * FROM `Employee2`
WHERE `DeptID` = (
	SELECT `DeptID` FROM `Dept2`
	WHERE `Name` = 'HR' );
 
-- Display employees whose department location is 'Loc2'
 
SELECT * FROM `Employee2`
WHERE `DeptID` IN (
	SELECT `DeptID` FROM `Dept2`
	WHERE `Location` = 'Loc2' );