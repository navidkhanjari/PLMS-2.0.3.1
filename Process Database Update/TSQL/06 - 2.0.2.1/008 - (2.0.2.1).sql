USE [Log]

GO

ALTER TABLE Messages ADD [ExpireDate] NVARCHAR(10) NULL

GO

UPDATE Messages SET [ExpireDate] = '';