-- INSERT THE FOLLOWING DATA IN SQL DATABASE

-- Query 1: 

CREATE DATABASE Hr_data_db;
USE Hr_data_db;

-- Query 2:

create table  Department
( 
DepID int Primary Key, 
DepName varchar(25) Not Null Default 'Department' 
); 

-- Query 3: 

Create table Employee 
( 
EmpId int Primary Key, 
EmpName varchar(100), 
StartYear int, 
EndYear int, 
StartSalary Float, 
CurrentSalary Float, 
EndSalary Float, 
DepId int Not Null, 
FOREIGN KEY (DepID) REFERENCES Department(DepID ) 
); 

-- Query 4: 

Insert into Department values (1,'Department' ), (2,'HR' ), (3 ,'IT' ),(4 ,'Sales' ); 

-- Query 5: 

INSERT INTO Employee (EmpId, DepId, EmpName, StartYear, EndYear, StartSalary,CurrentSalary, EndSalary )  
VALUES  
(1,1,'Bill Gates', 2000,NULL, 310000.00, 310000.00,NULL), 
(2,1,'John Lenon', 2000,NULL, 110000.00,110000.00,NULL), 
(3,2,'Haily Anderson', 2010,NULL, 90000.00, 90000.00,NULL), 
(4,2,'Nicolaus  Michelson', 2009,NULL, 95000.00, 95000.00,NULL), 
(5,2,'Rebecca  Michelson', 2010,NULL, 85000.00, 85000.00,NULL), 
(6,3,'Elena Gilbert', 2010,NULL, 55000.00, 55000.00,NULL), 
(7,3,'John Smith', 2010,NULL, 65000.00, 65000.00,NULL), 
(8,3,'Alex Red', 2013,NULL, 68000.00, 68000.00,NULL), 
(9,3,'Richard Blue', 2013,NULL, 1198000.00, 1198000.00,NULL), 
(10,3,'Edward Cullen', 2013,NULL, 1298000.00, 1298000.00,NULL); 
