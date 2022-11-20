CREATE TABLE config.MarketSecurityTypeMapping
(
	MarketCode varchar(3) NOT NULL,
	SecurityTypeCode varchar(4) NOT NULL
)

ALTER TABLE config.MarketSecurityTypeMapping 
ADD CONSTRAINT [PK_MarketSecurityTypeMapping] PRIMARY KEY
(
	MarketCode,
	SecurityTypeCode
)

ALTER TABLE config.MarketSecurityTypeMapping
ADD CONSTRAINT [FK_MarketCode_MarketSecurityTypeMapping] FOREIGN KEY 
(
	MarketCode
)
REFERENCES config.Markets(Code)

ALTER TABLE config.MarketSecurityTypeMapping
ADD CONSTRAINT [FK_SecurityTypeCode_MarketSecurityTypeMapping] FOREIGN KEY 
(
	SecurityTypeCode
)
REFERENCES config.SecurityTypes(Code)


