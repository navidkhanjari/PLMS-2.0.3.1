USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetListOfMessages]    Script Date: 09/13/2016 00:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetListOfMessages] 
@MessageId decimal = null,
@DataField1 nvarchar(50) = null,
@DataField2 nvarchar(50) = null,
@DataField3 nvarchar(50) = null,
@Place bit = null,
@Type int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	*
	FROM    dbo.Messages 
	WHERE 
	dbo.Messages.Place = COALESCE(@Place, dbo.Messages.Place)	
	AND dbo.Messages.Type = COALESCE(@Type, dbo.Messages.Type)	
	AND dbo.Messages.MessageId = COALESCE(@MessageId, dbo.Messages.MessageId)	
	AND dbo.Messages.DataField1 = COALESCE(@DataField1, dbo.Messages.DataField1)
	AND dbo.Messages.DataField2 = COALESCE(@DataField2, dbo.Messages.DataField2)
	AND dbo.Messages.DataField3 = COALESCE(@DataField3, dbo.Messages.DataField3)
	ORDER BY Date ASC;
END
