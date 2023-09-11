USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetLockSalons]    Script Date: 04/16/2019 09:51:46 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ClearLockSalons] 
@LockID INT	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM LockSalons  WHERE
	LockID = @LockID
	
END
