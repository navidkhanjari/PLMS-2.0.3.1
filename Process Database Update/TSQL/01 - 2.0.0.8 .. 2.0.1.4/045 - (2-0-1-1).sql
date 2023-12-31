USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetAccounts]    Script Date: 12/03/2016 22:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetUnits] 
@UnitId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Units
	WHERE Active = 1 AND 
	UnitId = COALESCE(@UnitId, UnitId)
	ORDER BY Title
END
