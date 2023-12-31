USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetSalons]    Script Date: 11/10/2016 18:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetLockers] 
@CardId NVARCHAR(50) = null,
@LockerId INT = null,
@Busy     BIT = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Lockers
	Where
	LockerId = COALESCE(@LockerId, LockerId) AND
	CardId   = COALESCE(@CardId, CardId) AND
	Busy     = COALESCE(@Busy, Busy) 
	ORDER BY LockerId
END
