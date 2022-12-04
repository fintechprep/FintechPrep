USE [FintechPrepDb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [reporting].[Employees]
AS
SELECT 
	EmployeeId,
	[Name],
	UserId,
	Title
FROM hr.Employees
GO


