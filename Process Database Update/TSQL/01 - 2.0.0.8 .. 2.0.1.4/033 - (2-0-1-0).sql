USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditLocker]    Script Date: 11/11/2016 11:14:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteLocker] 
	@LockerId int
AS
BEGIN
	SET NOCOUNT ON;
    DELETE FROM Lockers WHERE LockerId = @LockerId;
END
