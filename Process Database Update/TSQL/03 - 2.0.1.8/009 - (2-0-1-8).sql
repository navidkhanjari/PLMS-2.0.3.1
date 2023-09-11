USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetLocks]    Script Date: 04/15/2019 05:16:18 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLockSalons] 
@LockID INT	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  SalonID FROM dbo.LockSalons WHERE
	(LockID   = COALESCE(@LockID, LockID))
	
END
