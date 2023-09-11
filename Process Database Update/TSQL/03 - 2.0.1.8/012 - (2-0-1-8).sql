USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleteLock]    Script Date: 04/16/2019 12:36:04 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[DeleteLock] 
	-- Add the parameters for the stored procedure here
	@LockID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Locks SET Active=0  WHERE LockID = @LockID;
END
