CREATE TABLE [config].Trades(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TradeDate] date NOT NULL,
	[SecurityCode] varchar (25) NOT NULL,
	[Units] int NOT NULL,
	[Action] varchar (4) NOT NULL,
	[Trader] varchar(50) NOT NULL,
	[Price] decimal(18,4) NULL,
	[XRatePerUSD] decimal(18,4) NULL	
)

ALTER TABLE FinTechPrepDb.config.Trades 
ADD CONSTRAINT [PK_Trades] PRIMARY KEY CLUSTERED(Id)
GO

ALTER TABLE FinTechPrepDb.config.Trades 
ADD CONSTRAINT [FK_SecurityCode_Trades] FOREIGN KEY ([SecurityCode]) REFERENCES config.Securities([Code])
GO

ALTER TABLE FinTechPrepDb.config.Trades 
ADD CONSTRAINT [FK_Trader_Trades] FOREIGN KEY ([Trader]) REFERENCES hr.Employees([UserId])
GO

