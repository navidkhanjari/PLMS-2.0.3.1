USE [Log]
GO

/****** Object:  StoredProcedure [dbo].[GetLockCategories]    Script Date: 4/14/2019 4:15:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLockCategories] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT Category FROM dbo.Locks WHERE Active = 1
	
END

GO

