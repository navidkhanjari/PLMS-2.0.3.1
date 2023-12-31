USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetDelivredLocks]    Script Date: 05/30/2019 21:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetDelivredLocks] 
@MemberID  INT = NULL,
@Category  nvarchar(50) = NULL,
@SalonID  INT = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  
	dbo.Locks.*
	FROM  dbo.Locks 
	INNER JOIN dbo.Keys		  ON dbo.Locks.LockID = dbo.Keys.LockID
	INNER JOIN dbo.LockSalons ON dbo.Locks.LockID = dbo.LockSalons.LockID
    WHERE 
        dbo.Keys.MemberID = COALESCE(@MemberID,dbo.Keys.MemberID) AND
		dbo.Locks.Category = COALESCE(@Category,dbo.Locks.Category) AND	
		dbo.LockSalons.SalonID = COALESCE(@SalonID,dbo.LockSalons.SalonID) 
END
