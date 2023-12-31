USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetMessages] 
@Place bit = null,
@Type int = null,
@FirstDate nvarchar(50) = null,
@DateOut nvarchar(50) = null,
@Mobile nvarchar(50) = null
AS
BEGIN

	SET NOCOUNT ON;
	IF @FirstDate IS Null AND @DateOut IS Null BEGIN
		SELECT	MessageId, dbo.GetMessageTypeTitle(Type) As Type, Mobile, Text, Date, ExpireDate
		FROM    dbo.Messages 
		WHERE dbo.Messages.Place = COALESCE(@Place, dbo.Messages.Place)	
		AND dbo.Messages.Type = COALESCE(@Type, dbo.Messages.Type)	
		AND dbo.Messages.Mobile = COALESCE(@Mobile, dbo.Messages.Mobile)
		AND dbo.Messages.Active = 1
		ORDER BY Date ASC;
	END
	ELSE BEGIN
		SELECT	MessageId, dbo.GetMessageTypeTitle(Type) As Type, Mobile, Text, Date, ExpireDate
		FROM    dbo.Messages 
		WHERE dbo.Messages.Place = COALESCE(@Place, dbo.Messages.Place)	
		AND dbo.Messages.Type = COALESCE(@Type, dbo.Messages.Type)	
		AND dbo.Messages.Mobile = COALESCE(@Mobile, dbo.Messages.Mobile)
		AND dbo.Messages.Active = 1
		AND dbo.Messages.Date BETWEEN @FirstDate AND @DateOut	
		ORDER BY Date ASC;	
	END
END
