create table Employee_T(
EmployeeID              integer       not null,
EmployeeName            char(20)      not null,
EmployeeAddress         char(40),   --need to decide on size, and whethre or not to to split it.   
DateOfBirth             date          not null,
SocialInsurance         integer       not null,
JobTitle                varchar(20),
    --ArchivedTitles
     --skills
TypeofEmployee         char(1)        not null,   --shall be used to take note of type of employee     

constraint Employee_PK Primary key (EmployeeID)
);

create table Department_T (
DepartmentID                          integer        not null,
DepartmentName                        varchar2(20)   not null,
DepartmentLocation                    varchar2(20),
PhoneNumber                           varchar(15),
DepartmentManager                     varchar(20),

constraint Department_PK Primary Key(DepartmentID)

);

create table Project_T(
ProjectID            integer          not null,
ProjectName          varchar(10)      not null,
--{tasks{skills},type}
StartDate            date             not null,
FinishDate           date             not null,
ProjectManager       varchar(20)      not null,   -- we need to take note whether this shall be compound attribute or not. first name and last name

constraint Project_Pk Primary key(ProjectID)
);

Create table Vendor_T(
VendorID        integer          not null,
VendorName      VARCHAR2(20)     not null,
Address         VARCHAR2(30),
EquipmentInfo   VARCHAR2(40),

constraint Vendor_PK Primary KEY(VendorID)
);

create table Equipment_T(
EquipmentID            integer     not null,
EquipmentName          varchar(20),
Description            varchar(40),

constraint Equipment_Pk Primary key(EquipmentID)

);


--we need to decide whether we even need this table or perhaps have this info derived from a query
--if we do keep the table then we have to realise all attributes will be foreign keys from other tables. which comes back to idea of having this a table
Create table Project_Equipment_T (

EquipmentID         integer     not null,
ProjectID           char(8)     not null,
EquipmentName       varchar(20),
Description         varchar(40),

constraint Project_Equipment_PK Primary key(EquipmentID,ProjectID),
constraint Project_Equipment_FK1 foreign key(EquipmentID) references Equipment_T(EquipmentID),
constraint Project_Equipment_FK2 foreign key(ProjectID) references Project_T(ProjectID)
);

create table Salaried_T(
EmployeeID              integer     not null,  -- created to allow for merge.. should be added to EER
Salary                  number(6),
Bonus                   number(6),          --calculated field
HealthCoverage          number(6),

constraint Salaried_FK  foreign key(EmployeeID) references Employee_T(EmployeeID)
);

create table Consultant_T(
EmployeeID              integer  not null,  -- created to allow for merge.. should be added to EER
HourlyRate,  -- we need to decide on datatype

constraint Consultant_FK  foreign key(EmployeeID) references Employee_T(EmployeeID)
);

/*Department_Vendor table has a composite primary key...... do we need this table.?????? */
create table Department_Vendor_T(

DepartmentID        integer   not null,
VendorID            char(8)   not null,

constraint Department_Vendor_PK Primary key(DepartmentID,VendorID),
constraint Department_Vendor_FK1 Foreign key(DepartmentID) REFERENCES Department_T(DepartmentID),
constraint Department_Vendor_FK2 Foreign key(VendorID) REFERENCES Vendor_T(VendorID)

);



/*
COMMENTS
*we need an attribute in salary table to record whether an individual has dependants, either a yes or no or numbers.
*department_vendor table could be another query,instead we can have foreign key from the other table in Department table and In the Vendor table then draw a query from there
*Archived info should be based on a query which then translates to a "report"
*lets add a timestap to the project to record changes/alterations to records
*we need a foreign key for department in employee table so as to link employee to department
*/