USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFingerPrints] 
@FingerPrintId	INT =	NULL,
@MemberId		INT	=	NULL
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  * FROM dbo.FingerPrints
	INNER JOIN dbo.Members ON dbo.Members.MemberId = dbo.FingerPrints.MemberId
	WHERE 
		(dbo.Members.Active = 1)	AND
		(dbo.FingerPrints.Active = 1)	AND
		(FingerPrintId	      = COALESCE(@FingerPrintId, FingerPrintId))	AND
		(dbo.Members.MemberId = COALESCE(@MemberId, dbo.Members.MemberId));
	
END
