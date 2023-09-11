USE [Log]
GO

DELETE FROM ModelInformations;

GO

DECLARE @Date		[NVARCHAR](10);
DECLARE @Time		[NVARCHAR](8);

SET @Date	=	CONVERT(varchar, GETDATE(), 111);
SET @Time	=	CONVERT(varchar, GETDATE(), 108);

INSERT INTO ModelInformations
(
	[Version],
	[Date],
	[Time]
)
VALUES
(
	'2.0.2.1',
	@Date,
	@Time
);


GO


