USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewLocker]    Script Date: 11/11/2016 10:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[EditLocker] 
	@LockerId int,
	@CardId nvarchar(50),
	@Busy   bit
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE Lockers SET 
	CardId = @CardId, 
	Busy = @Busy 
	WHERE LockerId = @LockerId;
END
