USE [SQLServerImport]
GO

CREATE TABLE randomNum
(
numID int IDENTITY(1,1) PRIMARY KEY,
randomNumbers int

);

DECLARE @Upper INT;
DECLARE @Lower INT;

-- Sets lowest and highest possible number for being generated
SET @Lower = 1
SET @Upper = 10000