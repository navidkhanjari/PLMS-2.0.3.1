USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewLockSalon]    Script Date: 4/14/2019 5:17:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewLockSalon] 
	@LockID	 int,
	@SalonID int
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO LockSalons (LockID, SalonID) VALUES (@LockID, @SalonID);

	
END

