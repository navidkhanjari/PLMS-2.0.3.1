USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditGroup]    Script Date: 5/19/2023 3:07:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
create PROCEDURE [dbo].[EditGroup] 
	-- Add the parameters for the stored procedure here
	@GroupId int = 0, 
	@Title nvarchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Groups SET Title=@Title WHERE GroupId=@GroupId;
END
