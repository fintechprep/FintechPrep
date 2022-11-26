USE [FintechPrepDb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [reporting].[GetCountryForSecurity] (@SecurityCode AS VARCHAR(50))
RETURNS VARCHAR(2)
AS BEGIN
	DECLARE @countryCode AS VARCHAR(2)
	SELECT @countryCode = M.CountryCode 
	FROM config.Securities S
	JOIN config.Markets M ON M.Code = S.MarketCode
	WHERE S.Code = @SecurityCode
	RETURN @countryCode
END
GO


