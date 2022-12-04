USE FintechPrepDb
GO

CREATE TABLE economy.IndiaForexReserves
(
	InsertionDate DATETIME NOT NULL,
	[Date] DATE NOT NULL,
	RupeesCroreForeignCurrencyAssets DECIMAL(18,6) NOT NULL,
	DollarsMillionForeignCurrencyAssets DECIMAL(18,6) NOT NULL,
	RupeesCroreGold DECIMAL(18,6) NOT NULL,
	DollarsMillionGold DECIMAL(18,6) NOT NULL,
	RupeesCroreSDR DECIMAL(18,6) NOT NULL,
	DollarsMillionSDR DECIMAL(18,6) NOT NULL,
	MillionSDR DECIMAL(18,6) NOT NULL,
	RupeesCroreTotal DECIMAL(18,6) NOT NULL,
	DollarsMillionTotal DECIMAL(18,6) NOT NULL
)

ALTER TABLE economy.IndiaForexReserves
ADD CONSTRAINT [PK_IndiaForexReserves] PRIMARY KEY
(
	InsertionDate,
	[Date]
)