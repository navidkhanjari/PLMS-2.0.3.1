USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetFingerPrints]    Script Date: 7/20/2022 6:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetFingerPrints] 
@FingerPrintId	INT =	NULL,
@MemberId		INT	=	NULL
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  FingerPrintId, Number, Data, Quality, Members.MemberId FROM dbo.FingerPrints
	INNER JOIN dbo.Members ON dbo.Members.MemberId = dbo.FingerPrints.MemberId
	WHERE 
		(dbo.Members.Active = 1)	AND
		(dbo.FingerPrints.Active = 1)	AND
		(FingerPrintId	      = COALESCE(@FingerPrintId, FingerPrintId))	AND
		(dbo.Members.MemberId = COALESCE(@MemberId, dbo.Members.MemberId));
	
END
