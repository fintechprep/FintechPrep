USE [FintechPrepDb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [reporting].[GetValueTradedForTrader] (@TraderId AS VARCHAR(25))
RETURNS @ValueTradedForTrader TABLE 
(
	Trader VARCHAR(25),
	ValueTraded decimal(18,6)
)
AS BEGIN
	DECLARE @minDate AS date
	DECLARE @maxDate AS date
	SELECT @minDate = MIN(TradeDate) FROM config.Trades WHERE Trader = @TraderId
	SELECT @maxDate = MAX(TradeDate) FROM config.Trades 

	INSERT INTO @ValueTradedForTrader (Trader, ValueTraded)
	SELECT Trader, SUM(DollarValueTraded) TotalTraded
	FROM reporting.GetValueTraded (@minDate, @maxDate)
	WHERE Trader = @TraderId
	GROUP BY Trader	
	RETURN
END
GO


