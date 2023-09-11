USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewLock]    Script Date: 04/15/2019 05:50:10 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[EditLock] 
	@Category	 nvarchar(50),
	@LockID		 int,
	@Number		 int,
	@Port		 nvarchar(50),
	@Address	 int,
	@Relay       int,
	@Busy        bit,
	@Enabled      bit
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE Locks SET
		Category = @Category,
		Number	 = @Number,
		Port	 = @Port,
		Address  = @Address,
		Relay	 = @Relay,
		Busy	 = @Busy,
		Enabled  = @Enabled

	Where LockID=@LockID 
	
END

