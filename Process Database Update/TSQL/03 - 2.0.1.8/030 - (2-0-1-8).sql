USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeletePlan]    Script Date: 05/05/2019 02:44:50 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteLock] 
	@LockID int = 0
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Locks SET Active=0 WHERE LockID = @LockID;
END
