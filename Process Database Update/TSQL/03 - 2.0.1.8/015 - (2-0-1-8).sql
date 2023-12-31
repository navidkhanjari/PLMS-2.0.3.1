USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeliveryLockFromMember]    Script Date: 05/14/2019 04:29:26 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeliveryLockFromMember] 
	@MemberID	 int,
	@LockID		 int,
	@Date		 nvarchar(10),
	@Time		 nvarchar(8)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE Locks SET
		Busy = 0
	Where LockID = @LockID;

	DELETE FROM Keys WHERE LockID = @LockID 

	INSERT INTO LockHistories (MemberID, LockID, Date, Time, Type) VALUES (@MemberID, @LockID, @Date, @Time, 1)
	
	SELECT @@IDENTITY AS 'LockHistoryID'
END

