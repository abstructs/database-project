CREATE TABLE Employee_T(
    EmployeeID              INTEGER         NOT NULL,
    DepartmentID            INTEGER         NOT NULL,
    ProjectID               INTEGER,
    EmployeeName            VARCHAR(25)     NOT NULL,
    EmployeeAddress         VARCHAR(30),
    EmployeeSIN             VARCHAR(11),
    EmployeeDateOfBirth     DATE,
    EmployeeJobTitle        VARCHAR(30),
        --ArchivedTitles
        --skills
    EmployeeType            CHAR(1)        NOT NULL,   --shall be used to take note of type of employee     

CONSTRAINT Employee_Pk PRIMARY KEY(EmployeeID),
CONSTRAINT Employee_Fk FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID)
CONSTRAINT Employee_Fk1 FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID));

CREATE TABLE Dependents_T (
    EmployeeID          INTEGER         NOT NULL,
    DependentID         INTEGER         NOT NULL,
    DependentName       VARCHAR(25)     NOT NULL,
    DependentAddress    VARCHAR(30),
    DependentBirthday   DATE,
    DependentSIN        VARCHAR(11),

CONSTRAINT Dependent_Pk PRIMARY KEY(DependentID)
CONSTRAINT Dependent_Fk FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Department_T (
    DepartmentID            INTEGER        NOT NULL,
    DepartmentName          VARCHAR(25)    NOT NULL,
    DepartmentLocation      VARCHAR(30),
    DepartmentPhoneNumber   VARCHAR(15),
    DepartmentManager       VARCHAR(25),

CONSTRAINT Department_Pk PRIMARY KEY(DepartmentID));

CREATE TABLE Project_T (
    ProjectID            INTEGER          NOT NULL,
    ProjectName          VARCHAR(25)      NOT NULL,
    --{tasks{skills},type}
    StartDate            DATE             NOT NULL,
    FinishDate           DATE             NOT NULL,
    ProjectManager       VARCHAR(25)      NOT NULL,   -- we need to take note whether this shall be compound attribute or not. first name and last name

CONSTRAINT Project_Pk PRIMARY KEY(ProjectID));

CREATE TABLE Vendor_T(
    VendorID        INTEGER             NOT NULL,
    VendorName      VARCHAR2(30)        NOT NULL,
    VendorAddress         VARCHAR2(30),
    VendorEquipmentInfo   VARCHAR2(40),

CONSTRAINT Vendor_Pk PRIMARY KEY(VendorID));

CREATE TABLE Equipment_T(
    EquipmentID             INTEGER     NOT NULL,
    EquipmentName           VARCHAR(30),
    EquipmentDescription    VARCHAR(150),

CONSTRAINT Equipment_Pk PRIMARY KEY(EquipmentID));

CREATE TABLE Client_T (
    ClientID    INTEGER NOT NULL,
    ClientCompany VARCHAR(30),
    ClientAddress VARCHAR(30),
    ClientPhoneNumber VARCHAR(15),
    ClientSince DATE,
    -- archive
    CONSTRAINT Client_Pk PRIMARY KEY(ClientID));

--we need to decide whether we even need this table or perhaps have this info derived from a query
--if we do keep the table then we have to realise all attributes will be FOREIGN KEYs from other tables. which comes back to idea of having this a table
CREATE TABLE Project_Equipment_T (
    EquipmentID         INTEGER     NOT NULL,
    ProjectID           INTEGER     NOT NULL,
    EquipmentName       VARCHAR(30),
    Description         VARCHAR(150),

CONSTRAINT Project_Equipment_Pk PRIMARY KEY(EquipmentID,ProjectID),
CONSTRAINT Project_Equipment_Fk1 FOREIGN KEY(EquipmentID) REFERENCES Equipment_T(EquipmentID),
CONSTRAINT Project_Equipment_Fk2 FOREIGN KEY(ProjectID) REFERENCES Project_T(ProjectID));

CREATE TABLE Salaried_T(
    EmployeeID              INTEGER     NOT NULL,
    Salary                  NUMERIC(7,4),
    Bonus                   NUMERIC(7,4),  --calculated field
    HealthCoverage          NUMERIC(7,4),

CONSTRAINT Salaried_Fk  FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

CREATE TABLE Consultant_T(
    EmployeeID      INTEGER         NOT NULL,
    HourlyRate      NUMERIC(4, 4),

CONSTRAINT Consultant_FK  FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID));

/*Department_Vendor table has a composite PRIMARY KEY...... do we need this table.?????? */
CREATE TABLE Department_Vendor_T(
    DepartmentID        INTEGER   NOT NULL,
    VendorID            INTEGER   NOT NULL,

CONSTRAINT Department_Vendor_PK PRIMARY KEY(DepartmentID,VendorID),
CONSTRAINT Department_Vendor_FK1 FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID),
CONSTRAINT Department_Vendor_FK2 FOREIGN KEY(VendorID) REFERENCES Vendor_T(VendorID));



/*
COMMENTS
*we need an attribute in salary table to record whether an individual has dependants, either a yes or no or numbers.
*department_vendor table could be another query,instead we can have FOREIGN KEY from the other table in Department table and In the Vendor table then draw a query from there
*Archived info should be based on a query which then translates to a "report"
*lets add a timestap to the project to record changes/alterations to records
*we need a FOREIGN KEY for department in employee table so as to link employee to department
*/