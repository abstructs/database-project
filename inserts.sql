-- Client
-- Microsoft
INSERT INTO Client_T (ClientID, ClientNumberID, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES (1, '11111111', 'Microsoft', '22 Valley', 'Jarvis Claire', '2017-06-25');

-- Vendors
-- Dell
INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorEquipmentInfo)
VALUES (1, 'Dell', '27 Kensington', 'Supplying computers for project');

-- HP
INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorEquipmentInfo)
VALUES (2, 'HP', '57 Spadina', 'Supplying printers for project');

-- Project
-- Create Database
INSERT INTO Project_T (ProjectID, ClientID, ProjectManagerName, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (1, 1, 'Bob Dylan', '12345678', 'Create Datebase', '2016-04-15', '2017-05-10');

INSERT INTO Project_Archive_T (ProjectID, ClientID, ArchivedDate)
VALUES (1, 1, '2016-04-10');

-- Equipment
-- XPS Laptop
INSERT INTO Equipment_T (EquipmentID, VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (1, 1, 1, 5000.00, 'XPS Laptops', 'Laptops required for writing software on.');

INSERT INTO Equipment_T (EquipmentID, VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (2, 2, 1, 1000.00, 'HP Printers', 'Printers required for printing diagrams');

-- Department
-- GBC Software
INSERT INTO Department_T (DepartmentID, DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES(1, 'GBC Software', '905-351-4433', 'John Doe');

INSERT INTO Department_Location_T (Department_LocationID, DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (1, 1, '2', '212');

INSERT INTO Department_Vendor_T (DepartmentID, VendorID)
VALUES (1, 1);

-- GBC Design
INSERT INTO Department_T (DepartmentID, DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES(2, 'GBC Design', '905-451-4433', 'Bob Dylan');

INSERT INTO Department_Location_T (Department_LocationID, DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (2, 2, '3', '312');

INSERT INTO Department_Vendor_T (DepartmentID, VendorID)
VALUES (2, 2);

-- Employee
-- Daniela Doe
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, EmployeeSpouseID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (1, 1, '12341234', 2, 1, 1, 'Daniela Doe', '12345678','26 St Claire West', '1985-01-15', 'Software Engineer', 'S');

INSERT INTO Salaried_T (EmployeeID, SalariedSalary, SalariedHealthCoverage)
VALUES (1, 49999.99, 5000);

INSERT INTO Job_Archive_T (EmployeeID, JobTitle, JobDate)
VALUES (1, 'Software Engineer', '2015-03-09');

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (1, '12345678', 'Software Development', 'Software developers make software.');

INSERT INTO Employee_Skill_T (EmployeeID, SkillID)
VALUES (1, 1);

INSERT INTO Dependent_T (DependentID, SalariedID, DependentName, DependentAddress, DependentBirthday, DependentSIN) 
VALUES (1, 1, 'Jessica Doe', '26 St Claire West', '2000-06-17', '09876543');

INSERT INTO Dependent_T (DependentID, SalariedID, DependentName, DependentAddress, DependentBirthday, DependentSIN) 
VALUES (2, 1, 'Daniel Doe', '26 St Claire West', '2002-06-17', '90874321');

-- John Doe
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, EmployeeSpouseID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (2, 1, '12312312', 1, 1, 2, 'John Doe', '32132132','26 St Claire West', '1987-05-23', 'Database Manager', 'S');

INSERT INTO Salaried_T (EmployeeID, SalariedSalary, SalariedHealthCoverage)
VALUES (2, 44999.99, 5000);

INSERT INTO Job_Archive_T (EmployeeID, JobTitle, JobDate)
VALUES (2, 'Database Management', '2015-02-13');

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (2, '12341234', 'Database Management', 'Database managers manage databases.');

INSERT INTO Employee_Skill_T (EmployeeID, SkillID)
VALUES (2, 2);

-- Bob Dylan
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (3, 2, '12121212', 1, 3, 'Bob Dylan', '77777777','77 University Ave', '1987-02-11', 'UX Designer', 'C');

INSERT INTO Consultant_T (EmployeeID, ConsultantHourlyRate, ConsultantHoursWorked)
VALUES (3, 47.00, 0);

INSERT INTO Job_Archive_T (EmployeeID, JobTitle, JobDate)
VALUES (3, 'UX Designer', '2016-01-05');

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (3, '44444444', 'User Experience', 'User experience people create software that is enjoyable to use.');

INSERT INTO Employee_Skill_T (EmployeeID, SkillID)
VALUES (3, 3);

-- William Lewis
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (4, 2, '31313131', 2, 3, 'William Lewis', '65656565', '33 Spadina Ave', '1983-02-11', 'UX Designer', 'S');

INSERT INTO Salaried_T (EmployeeID, SalariedSalary, SalariedBonus, SalariedHealthCoverage)
VALUES (4, 30000, 0, 2500);

INSERT INTO Job_Archive_T (EmployeeID, JobTitle, JobDate)
VALUES (4, 'UX Designer', '2017-01-05');

INSERT INTO Employee_Skill_T (EmployeeID, SkillID)
VALUES (4, 3);

-- Matsvei Chambers
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (5, 2, '32413241', 2, 1, 'Matsvei Chambers', '12411241', '77 Downsview Ave', '1980-02-11', 'Software Engineer', 'S');

INSERT INTO Salaried_T (EmployeeID, SalariedSalary, SalariedBonus, SalariedHealthCoverage)
VALUES (5, 80000, 5000, 10000);

INSERT INTO Job_Archive_T (EmployeeID, JobTitle, JobDate)
VALUES (5, 'Software Engineer', '2014-05-15');

INSERT INTO Employee_Skill_T (EmployeeID, SkillID)
VALUES (5, 1);






-- Tasks
-- Database creation
INSERT INTO Task_T (TaskID, ProjectID, TaskType, TaskDescription, TaskStartDate, TaskEndDate)
VALUES (1, 1, 'Database Creation', 'Write SQL scripts to create tables', '2016-05-15', '2016-08-15');

-- Manage Database
INSERT INTO Task_T (TaskID, ProjectID, TaskType, TaskDescription, TaskStartDate, TaskEndDate)
VALUES (2, 1, 'Database Management', 'Database needs to be managed and ensure proper protocols are being used.', '2016-10-15', '2017-03-15');

-- Interface Creation
INSERT INTO Task_T (TaskID, ProjectID, TaskType, TaskDescription, TaskStartDate, TaskEndDate)
VALUES (3, 1, 'Interface Creation', 'From end development with Javascript for user experience.', '2016-11-15', '2017-01-15');

-- Task Skill
INSERT INTO Task_Skill_T (TaskID, SkillID)
VALUES (1, 1);

INSERT INTO Task_Skill_T (TaskID, SkillID)
VALUES (2, 2);

INSERT INTO Task_Skill_T (TaskID, SkillID)
VALUES (3, 3);

-- Employee Task
INSERT INTO Employee_Task_T (EmployeeID, TaskID)
VALUES (1, 1);

INSERT INTO Employee_Task_T (EmployeeID, TaskID)
VALUES (2, 2);

INSERT INTO Employee_Task_T (EmployeeID, TaskID, EmployeeHoursWorked)
VALUES (3, 3, 80);

-- Consultant
UPDATE Consultant_T SET ConsultantHoursWorked = ConsultantHoursWorked + 50
WHERE EmployeeID = 3;


