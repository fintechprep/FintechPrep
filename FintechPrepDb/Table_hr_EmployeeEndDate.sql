CREATE TABLE hr.EmployeeEndDate
(
	EmployeeId INT NOT NULL,
	EndDate DATE NOT NULL
)

ALTER TABLE FinTechPrepDb.hr.EmployeeEndDate 
ADD CONSTRAINT [PK_EmployeeEndDate] PRIMARY KEY (EmployeeId, EndDate)
GO

