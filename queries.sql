-- Employee ALL VALUES
INSERT INTO Employee_T( DepartmentID, EmployeeNumber, EmployeeSpouseID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (1, "12341234", 2, 1, 1, "Andrew Wilson", "12345678","26 St Claire West", "1997-01-10", "Software Engineer", "S");

INSERT INTO Job_Archive_T (EmployeeID, JobTitle, JobDate)
VALUES (1, "Software Engineer", "15-03-2017");

-- archive job
-- dependent

-- Department
INSERT INTO Department_T(DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES("GBC Software", "905-351-4433", "Henry Ford");
-- location

-- department vendor

-- skillt
-- taskt

-- task skill
-- employee task
-- employee skill

-- Client
INSERT INTO Client_T (ClientNumber, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES ("11111111", "Dell", "22 Valley", "Jarvis Claire", "2017-06-25");

-- Project
INSERT INTO Project_T (EmployeeProjectManagerID, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (2, "12345678", "Create Datebase", "04-15-2017", "05-10-2017");
-- archive project

-- Equipment
INSERT INTO Equipment_T (VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (1, 1, 200.00, "Chrome Book", "Cheap laptop for browsing the internet");

-- vendor