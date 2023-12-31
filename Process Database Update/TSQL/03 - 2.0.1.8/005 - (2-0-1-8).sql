USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewLock]    Script Date: 4/14/2019 3:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewLock] 
	@Category	 nvarchar(50),
	@Number		 int,
	@Port		 nvarchar(50),
	@Address	 int,
	@Relay       int,
	@Busy        bit,
	@Enabled      bit
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Locks (Category, Number, Port, Address, Relay, Busy, Enabled) VALUES (@Category, @Number, @Port, @Address, @Relay, @Busy, @Enabled);

	SELECT @@IDENTITY AS 'LockId';
END


GO
