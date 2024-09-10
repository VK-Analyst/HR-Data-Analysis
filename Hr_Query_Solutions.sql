-- HR DATA ANALYSIS PROJECT
USE Hr_data_db;

-- QUERY SOLUTIONS

SELECT * FROM Employee;
SELECT * FROM Department;

-- To show the names of the employees whose name starts with 'B'.
SELECT * FROM Employee
WHERE EmpName LIKE 'B%';

-- To show the names of the employees belonging to the department having department id
SELECT E.EmpName , D.*
FROM Employee AS E LEFT JOIN Department AS D
ON E.DepId = D.DepID;

-- To calculate the number of records in the Employee table.
SELECT
COUNT(EMPNAME) AS Total_Records
FROM Employee;

-- To calculate maximum StartSalary for the StartYear ‘2010’.
SELECT 
MAX(StartSalary) AS Maximum_StartSalary
FROM Employee
WHERE StartYear = DATEPART(YEAR,'2010');

-- To show names of the employees and their starting salary sorted by StartSalary (from higher to lower) who joined after 2010 (Your output must include the employees who joined in 2010 as well).
SELECT * FROM Employee
WHERE StartYear >= '2010'
ORDER BY StartSalary DESC;

-- To show a summarized StartSalary for each DepID.
SELECT E.DepId,
AVG(E.StartSalary) AS summarized_StartSalary
FROM Employee AS E LEFT JOIN Department D
ON E.DepId = D.DepID
GROUP BY  E.DepId;

-- To show department names and employee names belonging in each department. (Hint: Join 2 tables)
SELECT E.EmpName , D.*
FROM Employee AS E LEFT JOIN Department AS D
ON E.DepId = D.DepID;

-- To show names of the employee in the following departments: HR, Sales, and IT.
SELECT E.EmpName, D.*
FROM Employee AS E LEFT JOIN Department AS D
ON E.DepId = D.DepID
WHERE D.DepName IN ('HR','Sales','IT');

-- INSERT QUERY (A new department "Accounting" is to be created in the department table).
INSERT INTO Department 
VALUES (5,'Accounting');

-- INSERT QUERY (New Employee "Brian Latona" joined "Sales" in 2014 with starting salary of 120000.00)
INSERT INTO Employee
VALUES (11,'Brian Latona',2014,NULL,120000,,NULL,4);

-- INSERT QUERY (Meredith Whitney and Mario Gabelli started in 2011 with a starting salary of 350000.00 and 420000.00 in the department Accounting).
INSERT INTO Employee
VALUES (12,'Meredith Whitney',2011,NULL,350000,350000,NULL,5),(13,'Mario Gabelli',2011,NULL,420000,420000,NULL,5);

-- UPDATE (Ms. Haily Anderson left in 2013 with an EndSalary 3000.00 greater than the CurrentSalary).
UPDATE Employee
SET EndYear = 2013,
EndSalary = CurrentSalary + 3000
WHERE EmpName = 'Haily Anderson';

-- Display Total (Summary) CurrentSalary for the department,HR. Your output must include existing employees only. (Hint: Join Employee and Department tables)
SELECT D.DepName,
SUM(E.CurrentSalary) AS Total_CurrentSalary
FROM Employee E LEFT JOIN Department D
ON E.DepId = D.DepId
WHERE D.DepName IN ('HR', 'DEPARTMENT') AND E.EndYear IS NULL
GROUP BY D.DepName;

-- UPDATE QUERY (A 6% increment is to be made to current salary for all existing employees in the department with department id ‘2’)
UPDATE Employee
SET CurrentSalary = CurrentSalary * 1.06
WHERE DepId = 2 AND EndYear IS NULL;

/* Write SQL to create a single View, ‘Week3_DepartmentEmployee_vi’, that displays the following: 
Department ID, DepartmentName, EmployeeID, EmployeeName, StartSalary, CurrentSalary, Difference between StartSalary and CurrentSalary as Promoted, EndSalary.*/
CREATE VIEW Week3_DepartmentEmployee_vi AS
SELECT D.DepID,D.DepName,E.EmpId,E.EmpName,E.StartSalary,E.CurrentSalary,(E.CurrentSalary - E.StartSalary) AS PROMOTED
FROM EMPLOYEE AS E LEFT JOIN DEPARTMENT AS D
ON E.DepId = D.DepID;

-- VIEW 
SELECT * FROM Week3_DepartmentEmployee_vi;