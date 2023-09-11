USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetLocks]    Script Date: 05/03/1398 06:39:03 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLocksBySalon] 
@SalonID  INT
AS
BEGIN

	SET NOCOUNT ON;

	SELECT DISTINCT * 
	FROM Locks
	INNER JOIN LockSalons ON Locks.LockID = LockSalons.LockID
	WHERE LockSalons.SalonID = @SalonID
		
END
