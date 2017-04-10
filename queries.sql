/*
    1. Create a SELECT query that joins at least four tables 
    2. Create a SELECT query that uses an Aggregate function. 
    3. Create a SELECT query that includes an ORDER BY Clause.
    4. Create a SELECT query that includes GROUP BY and HAVING Clauses. 
    5. Create a VIEW that is based on at least THREE Tables. 
    6. Create a SELECT query that includes an OUTER JOIN 
    7. Create a SELECT query that includes a SUB QUERY. 
    8. Create a SELECT query that uses a SELF JOIN. 
    9. Create a SELECT query that uses the CASE conditional structure.
*/

-- 1 Project, project manager, project equipment and project task with interface design and a printer
SELECT ProjectManagerName, TaskType, ProjectName, EquipmentName FROM Project_T p
INNER JOIN Client_T c
    ON p.ClientID = c.ClientID
LEFT OUTER JOIN Equipment_T eq
    ON eq.ProjectID = p.ProjectID
LEFT OUTER JOIN Task_T t
    ON t.ProjectID = p.ProjectID
WHERE p.ProjectID = 1 AND EquipmentName LIKE 'HP%' AND TaskType LIKE 'Interface%';


SELECT SUM(EquipmentCost) FROM Equipment_T e
WHERE e.ProjectID = 2;

-- 3 Order employees by birthday
SELECT EmployeeName, EmployeeDateOfBirth FROM Employee_T ORDER BY EmployeeDateOfBirth;

-- 4 Group employees with birthdays greater than 1983
SELECT SkillName, COUNT(SkillName) FROM Employee_Skill_T es
INNER JOIN Employee_T se
    ON se.EmployeeID = es.EmployeeID
INNER JOIN Skill_T st
    ON st.SkillID = es.SkillID
GROUP BY SkillName
HAVING SkillName LIKE 'S%';

-- 5 Create view to view department employees
CREATE VIEW [Current Department Employees]
    SELECT Current_Department_Employees AS
    INNER JOIN DepartmentName, EmployeeName FROM Department_T d
        ON e.DepartmentID = d.DepartmentID
    WHERE d.DepartmentID = 2;

-- 6 Select all departments and vendors
SELECT * FROM Department_Vendor_T dv
FULL OUTER JOIN Department_T d
    ON d.DepartmentID = dv.DepartmentID
FULL OUTER JOIN Vendor_T v
    ON v.VendorID = v.VendorID
WHERE dv.VendorID = 1;

-- 7
SELECT EmployeeName, EmployeeJobTitle, SkillName, SkillDescription FROM Employee_Skill_T AS es
INNER JOIN Skill_T s
    ON es.SkillID = s.SkillID
INNER JOIN Employee_T e
    on es.EmployeeID = e.EmployeeID
WHERE es.EmployeeID = (
    SELECT EmployeeID FROM Employee_T
    WHERE EmployeeName LIKE 'Bob%'
);

-- 8 Gets an employee and employee's co-workers
SELECT DepartmentName, a.EmployeeName, b.EmployeeName FROM Employee_T a
INNER JOIN Employee_T b
    ON a.DepartmentID = b.DepartmentID
INNER JOIN Department_T d
WHERE a.DepartmentID = b.DepartmentID 
    AND a.DepartmentID = 2 
    AND a.EmployeeID <> b.EmployeeID
    AND d.DepartmentID = 2
ORDER BY A.EmployeeDateOfBirth DESC;

-- 9
SELECT EmployeeName, CASE EmployeeType
    WHEN 'S' THEN 'This is a salaried employee.'
    WHEN 'C' THEN 'This is a consultant.'
    ELSE 'This is neither a consultant or salaried employee'
    END AS Employee Status
FROM Employee_T;