USE [Log]
GO

ALTER TABLE Registers
ADD LogDate varchar(50);

GO

UPDATE Registers SET LogDate = Dateout;

GO