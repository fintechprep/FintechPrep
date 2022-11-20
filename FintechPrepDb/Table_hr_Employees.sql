CREATE TABLE hr.Employees
(
	EmployeeId int IDENTITY(1,1) NOT NULL,
	[Name] varchar(50) NOT NULL,
	UserId varchar(50) NOT NULL,
	DateOfBirth date NOT NULL,
	StartDate date NOT NULL,
	EndDate date NULL,
	MonthlySalary decimal NOT NULL,
	Title varchar(50) NOT NULL
)

ALTER TABLE hr.Employees
ADD CONSTRAINT Unique_UserId_Employees UNIQUE
(
	UserId
)

ALTER TABLE hr.Employees
ADD CONSTRAINT PK_Employees Primary Key
(
	EmployeeId
)

ALTER TABLE hr.Employees
ADD CONSTRAINT Check_MonthlySalary_Employees
CHECK (MonthlySalary > 0)