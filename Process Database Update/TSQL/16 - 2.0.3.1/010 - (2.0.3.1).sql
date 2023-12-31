USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetGroups]    Script Date: 5/19/2023 3:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
create PROCEDURE [dbo].[GetGroups] 
@GroupId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Groups
	WHERE Active = 1 AND 
	GroupId = COALESCE(@GroupId, GroupId)
	ORDER BY Title
END
