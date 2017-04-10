CREATE TABLE Department_T (
    DepartmentID            INTEGER                     AUTO_INCREMENT,
    DepartmentName          VARCHAR(25)    NOT NULL     UNIQUE,
    DepartmentPhoneNumber   VARCHAR(15)    NOT NULL     UNIQUE,
    DepartmentManager       VARCHAR(25)    NOT NULL     UNIQUE,

CONSTRAINT Department_Pk PRIMARY KEY(DepartmentID));

CREATE TABLE Client_T (
    ClientID                   INTEGER                      AUTO_INCREMENT,
    ClientNumberID             CHAR(8)         NOT NULL    UNIQUE,
    ClientCompany              VARCHAR(30)     NOT NULL,
    ClientAddress              VARCHAR(30)     NOT NULL,
    ClientContactPerson        VARCHAR(25)     NOT NULL,
    ClientSince                DATE,
CONSTRAINT Client_Pk PRIMARY KEY(ClientID));

CREATE TABLE Project_T (
    ProjectID                       INTEGER                         AUTO_INCREMENT,
    ProjectNumberID                 CHAR(8)          NOT NULL       UNIQUE,
    ClientID                        INTEGER          NOT NULL,
    ProjectManagerName              VARCHAR(25)      NOT NULL,
    ProjectName                     VARCHAR(25)      NOT NULL,
    StartDate                       DATE             NOT NULL,
    FinishDate                      DATE             NOT NULL,
CONSTRAINT Project_Pk PRIMARY KEY(ProjectID));

CREATE TABLE Vendor_T(
    VendorID              INTEGER                       AUTO_INCREMENT,
    VendorName            VARCHAR2(30)        NOT NULL,
    VendorAddress         VARCHAR2(30),
    VendorEquipmentInfo   VARCHAR2(40),

CONSTRAINT Vendor_Pk PRIMARY KEY(VendorID));

CREATE TABLE Employee_T(
    EmployeeID              INTEGER         AUTO_INCREMENT,
    DepartmentID            INTEGER         NOT NULL, -- Employee belongs to a department
    EmployeeNumberID        CHAR(8)         NOT NULL    UNIQUE,
    EmployeeSpouseID        INTEGER,
    ProjectID               INTEGER,                  -- Employee takes on a project
    SkillID                 INTEGER,                  -- Employee can have a skill
    EmployeeName            VARCHAR(25)     NOT NULL,
    EmployeeAddress         VARCHAR(30),
    EmployeeSIN             VARCHAR(11),
    EmployeeDateOfBirth     DATE,
    EmployeeJobTitle        VARCHAR(30),
    EmployeeType            CHAR(1)         NOT NULL,   -- Determines type of employee  

CONSTRAINT Employee_Fk FOREIGN KEY(EmployeeSpouseID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Employee_Pk PRIMARY KEY(EmployeeID),
CONSTRAINT Employee_Fk1 FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID),
CONSTRAINT Employee_Fk2 FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID));

CREATE TABLE Job_Archive_T( -- Stores the job titles of an employee
    ArchiveID   INTEGER         AUTO_INCREMENT,
    EmployeeID  INTEGER         NOT NULL,
    JobTitle    VARCHAR(25)     NOT NULL,
    JobDate     DATE            NOT NULL,
CONSTRAINT Job_Archive_PK PRIMARY KEY(ArchiveID),
CONSTRAINT Job_Archive_Fk FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Consultant_T(
    EmployeeID                INTEGER         AUTO_INCREMENT,
    ConsultantID              INTEGER,
    ConsultantHourlyRate      NUMERIC(4, 4)   NOT NULL,
    ConsultantHoursWorked     INTEGER         NOT NULL,

CONSTRAINT Consultant_Pk  PRIMARY KEY(ConsultantID),
CONSTRAINT Consultant_Fk  FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Salaried_T(
    EmployeeID                      INTEGER         AUTO_INCREMENT,
    SalariedID                      INTEGER,
    SalariedSalary                  NUMERIC(7,4),
    SalariedBonus                   NUMERIC(7,4),  --calculated field
    SalariedHealthCoverage          NUMERIC(7,4),  -- assumption

CONSTRAINT Salaried_Pk  PRIMARY KEY(SalariedID),
CONSTRAINT Salaried_Fk  FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Dependent_T ( 
    DependentID         INTEGER         AUTO_INCREMENT,
    SalariedID          INTEGER, -- Dependent relies to employee
    DependentName       VARCHAR(25)     NOT NULL,
    DependentAddress    VARCHAR(30),
    DependentBirthday   DATE,
    DependentSIN        VARCHAR(11),

CONSTRAINT Dependent_Pk PRIMARY KEY(DependentID),
CONSTRAINT Dependent_Fk FOREIGN KEY(SalariedID) REFERENCES Salaried_T(SalariedID));

CREATE TABLE Department_Location_T(
    Department_LocationID   INTEGER                 AUTO_INCREMENT,
    DepartmentID            INTEGER,
    DepartmentFloor         CHAR(1)     NOT NULL    UNIQUE,
    DepartmentRoom          CHAR(3)     NOT NULL    UNIQUE,

CONSTRAINT Department_Location_Pk PRIMARY KEY(Department_LocationID),
CONSTRAINT Department_Location_Fk FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID));

CREATE TABLE Task_T(
    TaskID              INTEGER         AUTO_INCREMENT,
    ProjectID           INTEGER         NOT NULL, -- Task belongs to project
    TaskType            VARCHAR(30)     NOT NULL,
    TaskDescription     VARCHAR(150)    NOT NULL,
    TaskStartDate       DATE            NOT NULL,
    TaskEndDate         DATE            NOT NULL,
    
CONSTRAINT Task_Fk FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID),
CONSTRAINT Task_Pk PRIMARY KEY(TaskID));

CREATE TABLE Skill_T (
    SkillID             INTEGER                     AUTO_INCREMENT,
    SkillNumberID       CHAR(8)         NOT NULL    UNIQUE, -- "each skill is given a unique number"
    SkillName           VARCHAR(25)     NOT NULL,
    SkillDescription    VARCHAR(150)    NOT NULL,

CONSTRAINT Skill_Pk PRIMARY KEY(SkillID));

CREATE TABLE Task_Skill_T( -- Task can take multiple skills to complete, skills can belong to multiple tasks
    Task_SkillID  INTEGER       AUTO_INCREMENT,
    TaskID        INTEGER,
    SkillID       INTEGER,

CONSTRAINT Task_Skill_Pk PRIMARY KEY(Task_SkillID),
CONSTRAINT Task_Skill_Fk FOREIGN KEY(TaskID) REFERENCES Task_T(TaskID),
CONSTRAINT Task_Skill_Fk1 FOREIGN KEY(SkillID) REFERENCES Skill_T(SkillID));

CREATE TABLE Employee_Skill_T( -- Task can take multiple skills to complete, skills can belong to multiple tasks
    Employee_SkillID    INTEGER     AUTO_INCREMENT,
    EmployeeID          INTEGER,
    SkillID             INTEGER,

CONSTRAINT Employee_Skill_Pk PRIMARY KEY(EmployeeID, SkillID),
CONSTRAINT Employee_Skill_Fk FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Employee_Skill_Fk1 FOREIGN KEY(SkillID) REFERENCES Skill_T(SkillID));

CREATE TABLE Employee_Task_T(
    Employee_Task_T         INTEGER     AUTO_INCREMENT,
    EmployeeID              INTEGER,
    TaskID                  INTEGER,
    EmployeeHoursWorked     INTEGER,
    
CONSTRAINT Employee_Task_Pk PRIMARY KEY(Employee_Task_T),
CONSTRAINT Employee_Task_Fk FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Employee_Task_Fk1 FOREIGN KEY(TaskID) REFERENCES Task_T(TaskID));

CREATE TABLE Project_Archive_T(
    ProjectArchiveID    INTEGER     AUTO_INCREMENT,
    ProjectID           INTEGER     NOT NULL,
    ClientID            INTEGER     NOT NULL,
    ArchivedDate        DATE NOT    NULL,

CONSTRAINT Project_Client_Pk PRIMARY KEY(ProjectArchiveID),
CONSTRAINT Project_Client_Fk FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID),
CONSTRAINT Project_Client_Fk1 FOREIGN KEY(ClientID) REFERENCES Client_T(ClientID));

CREATE TABLE Equipment_T(
    EquipmentID             INTEGER     AUTO_INCREMENT,
    VendorID                INTEGER     NOT NULL,
    ProjectID               INTEGER, -- Equipment belongs to project
    EquipmentCost           NUMERIC(7, 4),
    EquipmentName           VARCHAR(30),
    EquipmentDescription    VARCHAR(150),

CONSTRAINT Equipment_Fk FOREIGN KEY(VendorID) REFERENCES Vendor_T(VendorID),
CONSTRAINT Equipment_Fk1 FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID),
CONSTRAINT Equipment_Pk PRIMARY KEY(EquipmentID));

CREATE TABLE Department_Vendor_T(
    Department_VendorID INTEGER     AUTO_INCREMENT,
    DepartmentID        INTEGER,
    VendorID            INTEGER,

CONSTRAINT Department_Vendor_Pk PRIMARY KEY(Department_VendorID),
CONSTRAINT Department_Vendor_Fk FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID),
CONSTRAINT Department_Vendor_Fk1 FOREIGN KEY(VendorID) REFERENCES Vendor_T(VendorID));