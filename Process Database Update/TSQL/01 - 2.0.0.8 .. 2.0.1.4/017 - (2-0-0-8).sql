USE [LOG]
UPDATE Members SET [Date] = (SELECT MIN(RegisterDate) AS DATE FROM Registers WHERE Registers.MemberId = Members.MemberId)