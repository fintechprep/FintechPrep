CREATE TABLE config.Currencies
(
	Code varchar(3) NOT NULL,
	[Name] varchar(50) NOT NULL
)

ALTER TABLE config.Currencies 
ADD CONSTRAINT [PK_Currencies] PRIMARY KEY
(
	Code
)

ALTER TABLE config.Currencies 
ADD CONSTRAINT [Length_Code_Currencies] CHECK
(
	DATALENGTH(Code)=3
)
