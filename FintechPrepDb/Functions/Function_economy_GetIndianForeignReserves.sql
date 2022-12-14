USE [FintechPrepDb]
GO
/****** Object:  UserDefinedFunction [economy].[GetIndianForeignReserves]    Script Date: 12/6/2022 8:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [economy].[GetIndianForeignReserves](@StartDate AS DATE, @EndDate AS DATE)
RETURNS TABLE
RETURN
(
	SELECT
		[Date],
		RupeesCroreForeignCurrencyAssets AS RupeeFCA,
		DollarsMillionForeignCurrencyAssets AS DollarFCA,
		RupeesCroreGold AS RupeeGold,
		DollarsMillionGold AS DollarGold,
		RupeesCroreReserveTranchePosition AS RupeeRTP,
		DollarsMillionReserveTranchePosition AS DollarRTP,
		RupeesCroreSDR AS RupeeSDR,
		DollarsMillionSDR AS DollarSDR,
		MillionSDR,
		RupeesCroreTotal AS RupeeTotal,
		DollarsMillionTotal AS DollarTotal
	FROM economy.IndiaForexReserves I1
	WHERE I1.InsertionDate = 
				(
					SELECT MAX(InsertionDate) FROM economy.IndiaForexReserves I2
					WHERE I1.[Date]=I2.[Date]
				)
	AND I1.[Date]>=IIF(@StartDate IS NULL,I1.[Date], @StartDate) 
	AND I1.[Date]<=IIF(@EndDate IS NULL, I1.[Date], @EndDate)
)