USE [Log]
GO

DELETE FROM ModelInformations;

GO

DECLARE @Date		[NVARCHAR](10);
DECLARE @Time		[NVARCHAR](8);

SET @Date	=	CONVERT(varchar, GETDATE(), 111);
SET @Time	=	CONVERT(varchar, GETDATE(), 108);

UPDATE ModelInformations SET
	[Version]	=	'2.0.2.8',
	[Date]		=	@Date,
	[Time]		=	@Time;

GO


