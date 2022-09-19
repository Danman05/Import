USE [SQLServerImport]
GO

CREATE TABLE randomNum
(
numID int IDENTITY(1,1) PRIMARY KEY,
randomNumbers int

)
GO-- Declares 3 int typeDECLARE @Random INT
DECLARE @Upper INT
DECLARE @Lower INT

-- Sets lowest and highest possible number for being generated
SET @Lower = 1
SET @Upper = 10000SELECT @RandomDECLARE @Count intSet @Count = 1-- Loop runs until the count is greater than 1 millionWhile @Count <= 1000000Begin-- Random number functionSELECT @Random = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower), 0)insert into randomNum values (@Random)SET @Count = @Count + 1END-- Gets the rows with randomNumbers as 4711SELECT * FROM randomNumwhere randomNumbers = 4711;GO-- Makes an view for getting the frequency of the numbersCREATE VIEW NumberFrequencyASSELECT COUNT(*) AS 'Frequency', randomNum.randomNumbersFROM randomNumGROUP BY randomNumbersGOSELECT * FROM NumberFrequencyORDER BY 'Frequency' DESC-- Finds the frequency of the lowest numberDECLARE @lowfrequency INT;SELECT @lowfrequency = MIN(Frequency) FROM NumberFrequencySELECT @lowfrequency-- Find the frequency of the highest numberDECLARE @maxfrequency INT;SELECT @maxfrequency = MAX(Frequency) FROM NumberFrequencySELECT @maxfrequency;