USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleveredLocker]    Script Date: 11/14/2016 10:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ReceivedLocker] 
	@LockerId int,
    @ReceivedDate NVARCHAR(10),
	@ReceivedTime NVARCHAR(8)
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE DeliveryLockers SET
		ReceivedDate = @ReceivedDate, 
		ReceivedTime = @ReceivedTime
	WHERE LockerId = @LockerId AND ReceivedDate = '' AND ReceivedTime = ''
	UPDATE Lockers SET Busy = 0 WHERE LockerId = @LockerId;
END
