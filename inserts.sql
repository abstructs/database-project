-- Client
-- Microsoft
INSERT INTO Client_T (ClientID, ClientNumberID, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES (1, '11111111', 'Microsoft', '22 Valley', 'Jarvis Claire', '2017-06-25');

INSERT INTO Client_T (ClientID, ClientNumberID, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES (2, '22222222', 'Apple', '33 Valley', 'Jamal Carp', '2016-03-25');

INSERT INTO Client_T (ClientID, ClientNumberID, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES (3, '33333333', 'AMD', '44 Icerain', 'Ellen Sue', '2014-08-15');

INSERT INTO Client_T (ClientID, ClientNumberID, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES (4, '44444444', 'Intel', '77 Ohio', 'Manwella Zu', '2016-02-03');

INSERT INTO Client_T (ClientID, ClientNumberID, ClientCompany, ClientAddress, ClientContactPerson, ClientSince)
VALUES (5, '55555555', 'York University', '55 Keele', 'Zack Mons', '2016-08-28');

-- Vendors
-- Dell
INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorEquipmentInfo)
VALUES (1, 'Dell', '27 Kensington', 'Supplying computers for project');

INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorEquipmentInfo)
VALUES (2, 'HP', '57 Spadina', 'Supplying printers for project');

INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorEquipmentInfo)
VALUES (3, 'UPS', '10231 Queen', 'Ships stuff out as needed');

INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorEquipmentInfo)
VALUES (4, 'FedEx', '113 Bay', 'Supplies paper.');

INSERT INTO Vendor_T (VendorID, VendorName, VendorAddress, VendorEquipmentInfo)
VALUES (5, 'Logitech', '17 College', 'Supplies computer mice.');

-- Project
-- Create Database
INSERT INTO Project_T (ProjectID, ClientID, ProjectManagerName, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (1, 1, 'Bob Dylan', '12345678', 'Create Database', '2016-04-15', '2017-05-10');

INSERT INTO Project_T (ProjectID, ClientID, ProjectManagerName, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (2, 2, 'William Lewis', '32324141', 'Create Software', '2015-07-15', '2017-02-10');

INSERT INTO Project_T (ProjectID, ClientID, ProjectManagerName, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (3, 3, 'TO BE ANNOUNCED', '33333333', 'Work on robot', '2016-03-05', '2017-02-15');

INSERT INTO Project_T (ProjectID, ClientID, ProjectManagerName, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (4, 4, 'TO BE ANNOUNCED', '44444444', 'Work on hardware', '2015-01-25', '2016-08-03');

INSERT INTO Project_T (ProjectID, ClientID, ProjectManagerName, ProjectNumberID, ProjectName, StartDate, FinishDate)
VALUES (5, 5, 'TO BE ANNOUNCED', '55555555', 'Supply IT Training', '2014-01-25', '2015-02-03');

-- Project Archive
INSERT INTO Project_Archive_T (Project_ArchiveID, ProjectID, ClientID, ArchivedDate)
VALUES (1, 1, 1, '2016-04-10');

INSERT INTO Project_Archive_T (Project_ArchiveID, ProjectID, ClientID, ArchivedDate)
VALUES (2, 2, 1, '2015-07-15');

INSERT INTO Project_Archive_T (Project_ArchiveID, ProjectID, ClientID, ArchivedDate)
VALUES (3, 3, 2, '2016-03-05');

INSERT INTO Project_Archive_T (Project_ArchiveID, ProjectID, ClientID, ArchivedDate)
VALUES (4, 4, 3, '2015-01-25');

INSERT INTO Project_Archive_T (Project_ArchiveID, ProjectID, ClientID, ArchivedDate)
VALUES (5, 5, 5, '2015-01-25');

-- Equipment
-- XPS Laptop
INSERT INTO Equipment_T (EquipmentID, VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (1, 1, 1, 5000.00, 'XPS Laptops', 'Laptops required for writing software on.');

INSERT INTO Equipment_T (EquipmentID, VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (2, 2, 1, 1000.00, 'HP Printers', 'Printers required for printing diagrams');

INSERT INTO Equipment_T (EquipmentID, VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (3, 3, 3, 500.00, 'Shipping', 'Boxes to ship stuff in.');

INSERT INTO Equipment_T (EquipmentID, VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (4, 4, 1, 100.00, 'Paper', 'Paper for printing.');

INSERT INTO Equipment_T (EquipmentID, VendorID, ProjectID, EquipmentCost, EquipmentName, EquipmentDescription)
VALUES (5, 5, 1, 1000.00, 'Mice', 'Mice for computers.');

-- Department
-- GBC Software
INSERT INTO Department_T (DepartmentID, DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES(1, 'GBC Software', '905-351-4433', 'John Doe');

INSERT INTO Department_Location_T (Department_LocationID, DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (1, 1, '2', '212');

INSERT INTO Department_Vendor_T (Department_VendorID, DepartmentID, VendorID)
VALUES (1, 1, 1);

-- GBC Design
INSERT INTO Department_T (DepartmentID, DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES(2, 'GBC Design', '905-451-4433', 'Bob Dylan');

INSERT INTO Department_Location_T (Department_LocationID, DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (2, 2, '3', '312');

INSERT INTO Department_Vendor_T (Department_VendorID, DepartmentID, VendorID)
VALUES (2, 2, 2);

-- GBC Wireframing
INSERT INTO Department_T (DepartmentID, DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES(3, 'GBC Wireframing', '905-421-3333', 'William Lewis');

INSERT INTO Department_Location_T (Department_LocationID, DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (3, 3, '4', '425');

INSERT INTO Department_Vendor_T (Department_VendorID, DepartmentID, VendorID)
VALUES (3, 3, 3);

-- GBC Datascience
INSERT INTO Department_T (DepartmentID, DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES(4, 'GBC Datascience', '905-221-3223', 'TO BE ANNOUNCED');

INSERT INTO Department_Location_T (Department_LocationID, DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (4, 4, '5', '331');

INSERT INTO Department_Vendor_T (Department_VendorID, DepartmentID, VendorID)
VALUES (4, 4, 3);

-- GBC AI
INSERT INTO Department_T (DepartmentID, DepartmentName, DepartmentPhoneNumber, DepartmentManager)
VALUES(5, 'GBC AI', '905-333-4444', 'COMING SOON');

INSERT INTO Department_Location_T (Department_LocationID, DepartmentID, DepartmentFloor, DepartmentRoom)
VALUES (5, 5, '1', '252');

INSERT INTO Department_Vendor_T (Department_VendorID, DepartmentID, VendorID)
VALUES (5, 5, 4);

-- Skills
INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (1, '12345678', 'Software Development', 'Software developers make software.');

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (2, '12341234', 'Database Management', 'Database managers manage databases.');

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (3, '44444444', 'User Experience', 'User experience people create software that is enjoyable to use.');

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (4, '555555555', 'User Interface', 'User inferface people create the interfaces.');

INSERT INTO Skill_T (SkillID, SkillNumberID, SkillName, SkillDescription)
VALUES (5, '66666666', 'Information Technology', 'Information technology people answer tech questions.');

-- Employee
-- Daniela Doe
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, EmployeeSpouseID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (1, 1, '12341234', 2, 1, 1, 'Daniela Doe', '12345678','26 St Claire West', '1985-01-15', 'Software Engineer', 'S');

-- John Doe
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, EmployeeSpouseID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (2, 1, '12312312', 1, 1, 2, 'John Doe', '32132132','26 St Claire West', '1987-05-23', 'Database Manager', 'S');

-- Bob Dylan
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (3, 2, '12121212', 1, 3, 'Bob Dylan', '77777777','77 University Ave', '1987-02-11', 'UX Designer', 'C');

INSERT INTO Consultant_T (ConsultantID, EmployeeID, ConsultantHourlyRate, ConsultantHoursWorked)
VALUES (1, 3, 47.00, 50);

-- William Lewis
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (4, 2, '31313131', 2, 3, 'William Lewis', '65656565', '33 Spadina Ave', '1983-02-11', 'UX Designer', 'S');

-- Matsvei Chambers
INSERT INTO Employee_T (EmployeeID, DepartmentID, EmployeeNumberID, ProjectID, SkillID, EmployeeName, EmployeeAddress, EmployeeSIN, EmployeeDateOfBirth, EmployeeJobTitle, EmployeeType) 
VALUES (5, 2, '32413241', 2, 1, 'Matsvei Chambers', '12411241', '77 Downsview Ave', '1980-02-11', 'Software Engineer', 'S');

-- Employee Skills
INSERT INTO Employee_Skill_T (Employee_SkillID, EmployeeID, SkillID)
VALUES (1, 1, 1);

INSERT INTO Employee_Skill_T (Employee_SkillID, EmployeeID, SkillID)
VALUES (2, 2, 2);

INSERT INTO Employee_Skill_T (Employee_SkillID, EmployeeID, SkillID)
VALUES (3, 3, 3);

INSERT INTO Employee_Skill_T (Employee_SkillID, EmployeeID, SkillID)
VALUES (4, 4, 3);

INSERT INTO Employee_Skill_T (Employee_SkillID, EmployeeID, SkillID)
VALUES (5, 5, 1);

-- Salaried
INSERT INTO Salaried_T (SalariedID, EmployeeID, SalariedSalary, SalariedHealthCoverage)
VALUES (1, 1, 49999.99, 5000);

INSERT INTO Salaried_T (SalariedID, EmployeeID, SalariedSalary, SalariedHealthCoverage)
VALUES (2, 2, 44999.99, 5000);

INSERT INTO Salaried_T (SalariedID, EmployeeID, SalariedSalary, SalariedBonus, SalariedHealthCoverage)
VALUES (3, 4, 30000, 0, 2500);

INSERT INTO Salaried_T (SalariedID, EmployeeID, SalariedSalary, SalariedBonus, SalariedHealthCoverage)
VALUES (4, 5, 80000, 5000, 10000);

-- Dependents
INSERT INTO Dependent_T (DependentID, SalariedID, DependentName, DependentAddress, DependentBirthday, DependentSIN) 
VALUES (1, 1, 'Jessica Doe', '26 St Claire West', '2000-06-17', '09876543');

INSERT INTO Dependent_T (DependentID, SalariedID, DependentName, DependentAddress, DependentBirthday, DependentSIN) 
VALUES (2, 1, 'Daniel Doe', '26 St Claire West', '2002-06-17', '90874321');

INSERT INTO Dependent_T (DependentID, SalariedID, DependentName, DependentAddress, DependentBirthday, DependentSIN) 
VALUES (3, 3, 'John M', '26 Eglington', '1997-02-17', '12351341');

INSERT INTO Dependent_T (DependentID, SalariedID, DependentName, DependentAddress, DependentBirthday, DependentSIN) 
VALUES (4, 3, 'Mary M', '26 Eglington', '1996-01-02', '31225123');

INSERT INTO Dependent_T (DependentID, SalariedID, DependentName, DependentAddress, DependentBirthday, DependentSIN) 
VALUES (5, 3, 'Nicolas M', '26 Eglington', '1994-08-01', '312451231');

-- Job Archives 
INSERT INTO Job_Archive_T (Job_ArchiveID, EmployeeID, JobTitle, JobDate)
VALUES (1, 1, 'Software Engineer', '2015-03-09');

INSERT INTO Job_Archive_T (Job_ArchiveID, EmployeeID, JobTitle, JobDate)
VALUES (2, 2, 'Database Management', '2015-02-13');

INSERT INTO Job_Archive_T (Job_ArchiveID, EmployeeID, JobTitle, JobDate)
VALUES (3, 3, 'UX Designer', '2016-01-05');

INSERT INTO Job_Archive_T (Job_ArchiveID, EmployeeID, JobTitle, JobDate)
VALUES (4, 4, 'UX Designer', '2017-01-05');

INSERT INTO Job_Archive_T (Job_ArchiveID, EmployeeID, JobTitle, JobDate)
VALUES (5, 5, 'Software Engineer', '2014-05-15');

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

INSERT INTO Task_T (TaskID, ProjectID, TaskType, TaskDescription, TaskStartDate, TaskEndDate)
VALUES (4, 3, 'Interface Creation', 'From end development with Javascript for user experience.', '2016-05-15', '2017-01-07');

INSERT INTO Task_T (TaskID, ProjectID, TaskType, TaskDescription, TaskStartDate, TaskEndDate)
VALUES (5, 4, 'Database Management', 'Database needs to be managed and ensure proper protocols are being used.', '2015-02-15', '2016-04-18');

-- Task Skill
INSERT INTO Task_Skill_T (Task_SkillID, TaskID, SkillID)
VALUES (1, 1, 1);

INSERT INTO Task_Skill_T (Task_SkillID, TaskID, SkillID)
VALUES (2, 2, 2);

INSERT INTO Task_Skill_T (Task_SkillID, TaskID, SkillID)
VALUES (3, 3, 3);

INSERT INTO Task_Skill_T (Task_SkillID, TaskID, SkillID)
VALUES (4, 1, 1);

INSERT INTO Task_Skill_T (Task_SkillID, TaskID, SkillID)
VALUES (5, 5, 4);

-- Employee Task
INSERT INTO Employee_Task_T (Employee_TaskID, EmployeeID, TaskID)
VALUES (1, 1, 1);

INSERT INTO Employee_Task_T (Employee_TaskID, EmployeeID, TaskID)
VALUES (2, 2, 2);

INSERT INTO Employee_Task_T (Employee_TaskID, EmployeeID, TaskID, EmployeeHoursWorked)
VALUES (3, 3, 3, 80);

INSERT INTO Employee_Task_T (Employee_TaskID, EmployeeID, TaskID)
VALUES (4, 3, 3);

INSERT INTO Employee_Task_T (Employee_TaskID, EmployeeID, TaskID)
VALUES (5, 4, 4);

INSERT INTO Employee_Task_T (Employee_TaskID, EmployeeID, TaskID)
VALUES (6, 5, 5);


