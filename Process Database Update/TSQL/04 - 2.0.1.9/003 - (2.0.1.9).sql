USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeletePlan]    Script Date: 7/6/2019 10:47:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteFingerPrint] 
	@FingerPrintId INT
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE FingerPrints SET Active=0 WHERE FingerPrintId = @FingerPrintId;
END
