USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetLocks]    Script Date: 04/22/2019 11:31:19 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLocks] 
@LockID INT	=	null,
@Number INT = NULL,
@Category nvarchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  * FROM dbo.Locks WHERE
	(Active = 1) AND
	(LockID   = COALESCE(@LockID, LockID))	    AND
	(Number = COALESCE(@Number, Number))		AND
	(Category = COALESCE(@Category, Category)) 

	
END
