USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewLocker]    Script Date: 11/14/2016 9:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleveredLocker] 
	@MemberId int,
	@LockerId int,
	@DeliveredDate NVARCHAR(10),
	@DeliveredTime NVARCHAR(8),
    @ReceivedDate NVARCHAR(10),
	@ReceivedTime NVARCHAR(8)
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO DeliveryLockers
		(MemberId, LockerId, DeliveredDate, DeliveredTime, ReceivedDate, ReceivedTime) 
	VALUES 
		(@MemberId, @LockerId, @DeliveredDate, @DeliveredTime, @ReceivedDate, @ReceivedTime);
	UPDATE Lockers SET Busy = 1 WHERE LockerId = @LockerId;
END
