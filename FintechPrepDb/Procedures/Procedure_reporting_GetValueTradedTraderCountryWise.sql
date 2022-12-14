USE [FintechPrepDb]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [reporting].[GetValueTradedTraderCountryWise] @StartDate AS DATE, @EndDate AS DATE
AS
BEGIN
	DECLARE @Sql AS VARCHAR(MAX)
	DECLARE @CountryList AS VARCHAR(MAX)
	
	SELECT 
		@CountryList = COALESCE (@CountryList + ', [' + CAST(Country AS VARCHAR) + ']', 
								 '['+ CAST(Country AS VARCHAR) + ']')	
	FROM 
		(SELECT DISTINCT reporting.GetCountryForSecurity(SecurityCode) Country 
		  FROM config.Trades
		  WHERE TradeDate>=@StartDate AND TradeDate<=@EndDate) [CountryData]

	SET @Sql = '
				SELECT * FROM
					(
						SELECT
							Trader,
							reporting.GetCountryForSecurity(SecurityCode) Country,
							DollarValueTraded
						FROM reporting.GetValueTraded (''' + CAST(@StartDate AS VARCHAR) + ''',''' + CAST(@EndDate AS VARCHAR) + ''')
					) [Data]
					PIVOT
					(
						SUM(DollarValueTraded)
						FOR [Country] IN (' + @CountryList + ')
					) [PivotData]
					'
	EXEC (@Sql)
END