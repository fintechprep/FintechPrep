CREATE TABLE config.Markets
(
	Code varchar(3) NOT NULL,
	[Name] varchar(50) NOT NULL,
	CountryCode varchar(2) NOT NULL
)

ALTER TABLE config.Markets 
ADD CONSTRAINT [PK_Markets] PRIMARY KEY
(
	Code
)

ALTER TABLE config.Markets 
ADD CONSTRAINT [Length_Code_Markets]  CHECK(DATALENGTH(Code)=3)
GO

ALTER TABLE config.Markets
ADD CONSTRAINT [FK_CountryCode_Markets] FOREIGN KEY 
(
	CountryCode
)
REFERENCES config.Countries(Code)



