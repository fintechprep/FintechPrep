USE [FintechPrepDb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [reporting].[GetValueTraded](@StartDate AS date, @EndDate AS date)
RETURNS TABLE
RETURN
(
	-- Find the dollar value traded for each trade from the config.Trades table
SELECT
	T.*,
	S.[Name] SecurityName,
	ST.[name] SecurityTypeName,
	CASE
		WHEN ST.Code IN ('BITC','EQTY','CORP','SOVG','EQOP') 
			THEN T.Units*S.UnitsMultiplier*T.Price*S.PriceMultiplier/T.XratePerUSD
		-- Exposure traded in USD rather than value (AltCurr=USD)
		WHEN ST.Code IN ('FXFD') AND AlternateCurr = 'USD' 
			THEN T.Units*S.UnitsMultiplier*T.Price*S.PriceMultiplier
		-- Exposure traded in USD rather than value (AltCur <> USD)
		WHEN ST.Code IN ('FXFD') THEN T.Units*S.UnitsMultiplier
		---- Exposure traded in USD rather than value
		WHEN ST.Code IN ('CMFT','IXFT') 
		THEN T.Units*S.UnitsMultiplier*T.Price*S.PriceMultiplier/T.XratePerUSD
	END [DollarValueTraded]
	FROM config.Trades T
	JOIN config.Securities S ON T.SecurityCode = S.Code
	JOIN config.SecurityTypes ST on ST.Code = S.SecurityTypeCode	
	WHERE T.TradeDate>=@StartDate AND T.TradeDate<=@EndDate
);
GO


