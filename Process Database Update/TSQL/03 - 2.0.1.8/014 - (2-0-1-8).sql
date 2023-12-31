USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeliveryLockToMember]    Script Date: 05/14/2019 04:18:15 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeliveryLockToMember] 
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
	
	INSERT INTO Keys (MemberID, LockID) VALUES (@MemberID, @LockID);

	INSERT INTO LockHistories (MemberID, LockID, Date, Time, Type) VALUES (@MemberID, @LockID, @Date, @Time, 0)
	
	SELECT @@IDENTITY AS 'LockHistoryID'
END

