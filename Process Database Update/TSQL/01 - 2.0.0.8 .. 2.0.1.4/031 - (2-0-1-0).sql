USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewSalon]    Script Date: 11/10/2016 20:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewLocker] 
	@LockerId int,
	@CardId nvarchar(50),
	@Busy   bit
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Lockers (LockerId, CardId, Busy) VALUES (@LockerId, @CardId, @Busy);
END
