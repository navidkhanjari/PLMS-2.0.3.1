USE [Log]

GO

ALTER TABLE Plannings ADD [Percent] int NULL

GO

UPDATE Plannings SET [Percent] = 0;