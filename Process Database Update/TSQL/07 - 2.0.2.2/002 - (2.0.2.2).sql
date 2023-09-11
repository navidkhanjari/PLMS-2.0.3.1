USE [Log]

GO

ALTER TABLE Registers ADD [ClubDiscount] DECIMAL(18, 0) NULL

GO

ALTER TABLE Registers ADD [CoachDiscount] DECIMAL(18, 0) NULL

GO

UPDATE Registers SET [ClubDiscount] = [Discount], [CoachDiscount] = 0;