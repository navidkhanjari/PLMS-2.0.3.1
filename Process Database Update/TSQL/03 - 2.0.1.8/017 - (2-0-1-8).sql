USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetDelivredLocks]    Script Date: 04/27/2019 12:23:52 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLockMember] 
@LockID  INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  
	dbo.Keys.MemberID

	FROM  dbo.Keys 	
    WHERE 
        dbo.Keys.LockID   = @LockID		
					
END
