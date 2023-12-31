USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeliveryLockToMember]    Script Date: 8/23/2023 11:25:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[DeliveryLockToMember] 
	@MemberID	 int,
	@LockID		 int,
	@Date		 nvarchar(10),
	@Time		 nvarchar(8)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE Locks SET
		Busy = 1
	Where LockID = @LockID;
	
	INSERT INTO Keys (MemberID, LockID, Date) VALUES (@MemberID, @LockID, @Date);

	INSERT INTO LockHistories (MemberID, LockID, Date, Time, Type) VALUES (@MemberID, @LockID, @Date, @Time, 0)
	
	SELECT @@IDENTITY AS 'LockHistoryID'
END

