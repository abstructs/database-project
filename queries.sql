-- Employee ALL VALUES
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumber, EmployeeSpouseID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (1, 1, "12341234", 2, 1, 1, "Andrew Wilson", "12345678","26 St Claire West", "1997-01-10", "Software Engineer", "S");

INSERT INTO Salaried_T (EmployeeID, SalariedSalary, SalariedBonus, SalariedHealthCoverage)
VALUES (1, 49999.99);

-- CALCUALTE BONUS

INSERT INTO Job_Archive_T (EmployeeID, JobTitle, JobDate)
VALUES (1, "Software Engineer", "15-03-2017");

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillDescription)
VALUES (1, "12345678", "Software developers make software.");

INSERT INTO Employee_Skill_T (EmployeeID, SkillID)
VALUES (1, 2);

-- archive job
-- dependent

-- Department
INSERT INTO Department_T (DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES("GBC Software", "905-351-4433", "Henry Ford");

INSERT INTO Department_Location_T (DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (1, "2", "112");

-- location

INSERT INTO Department_Vendor_T (DepartmentID, VendorID)
VALUES (1, 1);

-- department vendor

-- taskt

-- task skill
-- employee task
-- employee skill

-- Client
INSERT INTO Client_T (ClientNumber, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES ("11111111", "Dell", "22 Valley", "Jarvis Claire", "2017-06-25");

-- Project
INSERT INTO Project_T (ProjectID, EmployeeProjectManagerID, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (1, 2, "12345678", "Create Datebase", "04-15-2017", "05-10-2017");
-- archive project

-- Equipment
INSERT INTO Equipment_T (VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (1, 1, 200.00, "Chrome Book", "Cheap laptop for browsing the internet");

-- vendor