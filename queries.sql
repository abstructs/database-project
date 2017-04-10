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

-- 2 Equipment and consultant cost for project
SELECT ConsultantHoursWorked * ConsultantHourlyRate + SUM(EquipmentCost) FROM Consultant_T ct
INNER JOIN Employee_T e
    ON e.EmployeeID = ct.EmployeeID
INNER JOIN Equipment_T et
    ON et.ProjectID = e.ProjectID
WHERE e.ProjectID = 1;

-- 3 Order employees by birthday
SELECT EmployeeName, EmployeeDateOfBirth FROM Employee_T ORDER BY EmployeeDateOfBirth;

-- 4 Group employees with birthdays greater than 1983
SELECT COUNT(EmployeeName), SkillName FROM Employee_Skill_T es
INNER JOIN Employee_T se
    ON se.EmployeeID = es.EmployeeID
INNER JOIN Skill_T st
    ON st.SkillID = es.SkillID
GROUP BY SkillName
HAVING EmployeeDateOfBirth > '1983-01-01';

-- 5 Create view to view department employees
CREATE VIEW [Current Department Employees]
    SELECT DepartmentName, EmployeeName, SkillName FROM Department_T d
    INNER JOIN Employee_T e
        ON e.DepartmentID = d.DepartmentID
    INNER JOIN Skill_T s
    INNER JOIN Employee_Skill_T est
        ON est.EmployeeID = e.EmployeeID AND est.SkillID = s.SkillID
    WHERE d.DepartmentID = 2;

-- 6 Select all departments and vendors
SELECT * FROM Department_Vendor_T dv
FULL OUTER JOIN Department_T d
    ON d.DepartmentID = db.DepartmentID
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
SELECT DepartmentName, a.EmployeeName, b.EmployeeName FROM Employee_T a, Employee_T b
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
    END
    'Employee Status'
FROM Employee_T;