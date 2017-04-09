CREATE TABLE Employee_T(
    EmployeeID              INTEGER         NOT NULL    UNIQUE,
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

CONSTRAINT Spouse_Fk FOREIGN KEY(EmployeeSpouseID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Employee_Pk PRIMARY KEY(EmployeeID),
CONSTRAINT Department_Fk FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID),
CONSTRAINT Project_Fk FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID));

CREATE TABLE Job_Archive_T( -- Stores the job titles of an employee
    EmployeeID  INTEGER         NOT NULL,
    JobTitle    VARCHAR(25)     NOT NULL,
    JobDate     DATE            NOT NULL,

CONSTRAINT Employee_Fk FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Dependent_T ( 
    DependentID         INTEGER         NOT NULL    UNIQUE,
    SalariedID          INTEGER         NOT NULL, -- Dependent relies to employee
    DependentName       VARCHAR(25)     NOT NULL,
    DependentAddress    VARCHAR(30),
    DependentBirthday   DATE,
    DependentSIN        VARCHAR(11),

CONSTRAINT Dependent_Pk PRIMARY KEY(DependentID),
CONSTRAINT Employee_Fk FOREIGN KEY(SalariedID) REFERENCES Employee_T(Salaried_T));

CREATE TABLE Department_Location_T(
    DepartmentID        INTEGER     NOT NULL    UNIQUE,
    DepartmentFloor     CHAR(1)     NOT NULL    UNIQUE,
    DepartmentRoom      CHAR(3)     NOT NULL    UNIQUE,

CONSTRAINT Department_Fk FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID));

CREATE TABLE Department_T (
    DepartmentID            INTEGER        NOT NULL     UNIQUE,
    DepartmentName          VARCHAR(25)    NOT NULL     UNIQUE,
    DepartmentPhoneNumber   VARCHAR(15)    NOT NULL     UNIQUE,
    DepartmentManager       VARCHAR(25)    NOT NULL     UNIQUE,

CONSTRAINT Department_Pk PRIMARY KEY(DepartmentID));

CREATE TABLE Task_T(
    TaskID              INTEGER         NOT NULL        UNIQUE,
    ProjectID           INTEGER         NOT NULL, -- Task belongs to project
    TaskType            VARCHAR(30)     NOT NULL,
    TaskDescription     VARCHAR(150)    NOT NULL,
    TaskStartDate       DATE            NOT NULL,
    TaskEndDate         DATE            NOT NULL,
    
CONSTRAINT Project_Fk FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID),
CONSTRAINT Task_Pk PRIMARY KEY(TaskID));

CREATE TABLE Task_Skill_T( -- Task can take multiple skills to complete, skills can belong to multiple tasks
    TaskID        INTEGER   NOT NULL,
    SkillID       INTEGER   NOT NULL,

CONSTRAINT Task_Skill_Pk PRIMARY KEY(TaskID, SkillID),
CONSTRAINT Task_Fk FOREIGN KEY(TaskID) REFERENCES Task_T(TaskID),
CONSTRAINT Skill_Fk FOREIGN KEY(SkillID) REFERENCES Skill_T(SkillID));

CREATE TABLE Employee_Skill_T( -- Task can take multiple skills to complete, skills can belong to multiple tasks
    EmployeeID    INTEGER   NOT NULL,
    SkillID       INTEGER   NOT NULL,

CONSTRAINT Employee_Skill_Pk PRIMARY KEY(EmployeeID, SkillID),
CONSTRAINT Employee_Fk FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Skill_Fk FOREIGN KEY(SkillID) REFERENCES Skill_T(SkillID));

CREATE TABLE Employee_Task_T(
    EmployeeID              INTEGER     NOT NULL,
    TaskID                  INTEGER     NOT NULL,
    EmployeeHoursWorked     INTEGER,
    
CONSTRAINT Employee_Task_Pk PRIMARY KEY(EmployeeID, TaskID),
CONSTRAINT Employee_Fk FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Task_Fk FOREIGN KEY(TaskID) REFERENCES Task_T(TaskID));

CREATE TABLE Skill_T (
    SkillID             INTEGER         NOT NULL    UNIQUE,
    SkillNumberID       CHAR(8)         NOT NULL    UNIQUE, -- "each skill is given a unique number"
    SkillName           VARCHAR(25)     NOT NULL,
    SkillDescription    VARCHAR(150)    NOT NULL,

CONSTRAINT Skill_Pk PRIMARY KEY(SkillID));

CREATE TABLE Project_T (
    ProjectID                       INTEGER          NOT NULL       UNIQUE,
    ClientID                        INTEGER          NOT NULL,
    EmployeeProjectManagerID        INTEGER          NOT NULL,
    ProjectNumberID                 CHAR(8)          NOT NULL       UNIQUE,
    ProjectName                     VARCHAR(25)      NOT NULL,
    StartDate                       DATE             NOT NULL,
    FinishDate                      DATE             NOT NULL,
CONSTRAINT Manager_Fk FOREIGN KEY(EmployeeProjectManagerID) REFERENCES Employee_T(EmployeeID),
CONSTRAINT Project_Pk PRIMARY KEY(ProjectID));

CREATE TABLE Project_Archive_T(
    ProjectID       INTEGER NOT NULL,
    ClientID        INTEGER NOT NULL,
    ArchivedDate    DATE NOT NULL,

CONSTRAINT Project_Client_Pk PRIMARY KEY(ProjectID, ClientID),
CONSTRAINT Project_Fk FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID),
CONSTRAINT Client_Fk FOREIGN KEY(ClientID) REFERENCES Client_T(ClientID));

CREATE TABLE Vendor_T(
    VendorID              INTEGER             NOT NULL      UNIQUE,
    VendorName            VARCHAR2(30)        NOT NULL,
    VendorAddress         VARCHAR2(30),
    VendorEquipmentInfo   VARCHAR2(40),

CONSTRAINT Vendor_Pk PRIMARY KEY(VendorID));

CREATE TABLE Equipment_T(
    EquipmentID             INTEGER     NOT NULL        UNIQUE,
    VendorID                INTEGER     NOT NULL,
    ProjectID               INTEGER, -- Equipment belongs to project
    EquipmentCost           NUMERIC(7, 4),
    EquipmentName           VARCHAR(30),
    EquipmentDescription    VARCHAR(150),

CONSTRAINT Vendor_Fk FOREIGN KEY(VendorID) REFERENCES Vendor_T(VendorID),
CONSTRAINT Project_Fk FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID),
CONSTRAINT Equipment_Pk PRIMARY KEY(EquipmentID));

CREATE TABLE Client_T (
    ClientID                   INTEGER         NOT NULL    UNIQUE,
    ClientNumberID             CHAR(8)         NOT NULL    UNIQUE,
    ClientCompany              VARCHAR(30)     NOT NULL,
    ClientAddress              VARCHAR(30)     NOT NULL,
    ClientContactPerson        VARCHAR(25)     NOT NULL,
    ClientSince                DATE,
CONSTRAINT Client_Pk PRIMARY KEY(ClientID));

CREATE TABLE Salaried_T(
    EmployeeID                     INTEGER        NOT NULL      UNIQUE,
    SalariedSalary                  NUMERIC(7,4),
    SalariedBonus                   NUMERIC(7,4),  --calculated field
    SalariedHealthCoverage          NUMERIC(7,4),  -- assumption

CONSTRAINT Salaried_Fk  FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Consultant_T(
    EmployeeID                INTEGER         NOT NULL      UNIQUE,
    ConsultantHourlyRate      NUMERIC(4, 4)   NOT NULL,
    ConsultantHoursWorked     INTEGER         NOT NULL,

CONSTRAINT Consultant_Fk  FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Department_Vendor_T(
    DepartmentID        INTEGER   NOT NULL,
    VendorID            INTEGER   NOT NULL,

CONSTRAINT Department_Vendor_Pk PRIMARY KEY(DepartmentID,VendorID),
CONSTRAINT Department_Fk FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID),
CONSTRAINT Vendor_Fk FOREIGN KEY(VendorID) REFERENCES Vendor_T(VendorID));



/*
COMMENTS
*we need an attribute in salary table to record whether an individual has dependants, either a yes or no or numbers. 
^ UPDATE: Use dependents table to check for employee ID

*department_vendor table could be another query,instead we can have FOREIGN KEY from the other table in Department table and In the Vendor table then draw a query from there 
^ UPDATE: Deparments to Vendors is a many to many relationship

*Archived info should be based on a query which then translates to a "report"
^ UPDATE: Created archive table

*lets add a timestap to the project to record changes/alterations to records
^ UPDATE Project has started and finishing dates

*we need a FOREIGN KEY for department in employee table so as to link employee to department
^ UPDATE: Added department FK in employee

*/