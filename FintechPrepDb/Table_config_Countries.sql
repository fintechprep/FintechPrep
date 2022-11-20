CREATE TABLE config.Countries
(
	Code varchar(2) NOT NULL,
	[Name] varchar(50) NOT NULL,
	CurrencyCode varchar(3) NOT NULL
)

ALTER TABLE config.Countries 
ADD CONSTRAINT [PK_Countries] PRIMARY KEY
(
	Code
)

ALTER TABLE config.Countries 
ADD CONSTRAINT [Length_Code_Countries]  CHECK(DATALENGTH(Code)=2)
GO

ALTER TABLE config.Countries 
ADD CONSTRAINT [FK_CurrencyCode_Countries] FOREIGN KEY
(
	CurrencyCode
)
REFERENCES config.Currencies(Code)




