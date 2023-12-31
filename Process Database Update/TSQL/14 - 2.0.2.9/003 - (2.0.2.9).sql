USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetMessages]    Script Date: 10/31/2021 2:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetMessages] 
@MessageId				decimal(18, 0)	= NULL,
@Reference				NVARCHAR(50)	= NULL,
@ReferenceId			NVARCHAR(50)	= NULL,
@Value					NVARCHAR(50)	= NULL,
@Type					INT				= NULL,
@Expired				BIT				= NULL,
@Mobile					NVARCHAR(50)	= NULL,
@Sent					BIT				= NULL,
@GenerateDateStart		NVARCHAR(10)	= NULL,
@GenerateDateFinish		NVARCHAR(10)	= NULL,
@SentDateStart			NVARCHAR(10)	= NULL,
@SentDateFinish			NVARCHAR(10)	= NULL
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
	*, 
	(GenerateDate + ' ' + GenerateTime)								AS GenerateDateTime,
	(SentDate + ' ' + SentTime)										AS SentDateTime,
	(dbo.GetMessageTypeTitle(dbo.Messages.Type))					AS MessageType,
	(dbo.GetMessageStatus(dbo.Messages.Sent,dbo.Messages.Expired))	AS MessageStatus
	FROM dbo.Messages
	WHERE
		dbo.Messages.Active			= 1	AND
		dbo.Messages.MessageId		= COALESCE(@MessageId, dbo.Messages.MessageId)	AND
		dbo.Messages.Reference		= COALESCE(@Reference, dbo.Messages.Reference)	AND
		dbo.Messages.ReferenceId	= COALESCE(@ReferenceId, dbo.Messages.ReferenceId)	AND
		dbo.Messages.Value			= COALESCE(@Value, dbo.Messages.Value) AND
		dbo.Messages.Type			= COALESCE(@Type, dbo.Messages.Type) AND
		dbo.Messages.Expired		= COALESCE(@Expired, dbo.Messages.Expired) AND
		dbo.Messages.Mobile			= COALESCE(@Mobile, dbo.Messages.Mobile) AND
		dbo.Messages.Sent			= COALESCE(@Sent, dbo.Messages.Sent) AND
		dbo.Messages.GenerateDate	>= COALESCE(@GenerateDateStart, dbo.Messages.GenerateDate) AND
		dbo.Messages.GenerateDate	<= COALESCE(@GenerateDateFinish, dbo.Messages.GenerateDate) AND
		dbo.Messages.SentDate		>= COALESCE(@SentDateStart, dbo.Messages.SentDate) AND
		dbo.Messages.SentDate		<= COALESCE(@SentDateFinish, dbo.Messages.SentDate) 

END
