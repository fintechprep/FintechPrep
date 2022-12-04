CREATE TABLE [config].[Securities](
	[Code] varchar(25) NOT NULL,
	[Name] varchar (200) NOT NULL,
	[SecurityTypeCode] varchar(4) NOT NULL,
	[BloombergQuote] varchar (25) NULL,
	[SecurityCurr] varchar (3) NOT NULL,
	[AlternateCurr] varchar (3) NOT NULL,
	[UnitsMultiplier] int NOT NULL,
	[PriceMultiplier] decimal(18,4) NOT NULL,
	[MarketCode] varchar(3) NOT NULL,
	[ExpiryDate] date NULL,
	[ParentSecurity] varchar (25) NOT NULL,
	[OptionType] varchar(4) NULL,
	[Sector] varchar(50) NULL
)

ALTER TABLE FinTechPrepDb.config.[Securities] 
ADD CONSTRAINT [PK_Securities] PRIMARY KEY ([Code])
GO

ALTER TABLE config.Securities
ADD CONSTRAINT [FK_SecurityType_Securities]
FOREIGN KEY ([SecurityTypeCode]) REFERENCES config.SecurityTypes (Code)

ALTER TABLE config.Securities
ADD CONSTRAINT [FK_SecurityCurrency_Securities]
FOREIGN KEY (SecurityCurr) REFERENCES config.Currencies (Code)

ALTER TABLE config.Securities
ADD CONSTRAINT [FK_AlternateCurrency_Securities]
FOREIGN KEY (AlternateCurr) REFERENCES config.Currencies (Code)

ALTER TABLE config.Securities
ADD CONSTRAINT [FK_MarketCode_Securities]
FOREIGN KEY (MarketCode) REFERENCES config.Markets (Code)







