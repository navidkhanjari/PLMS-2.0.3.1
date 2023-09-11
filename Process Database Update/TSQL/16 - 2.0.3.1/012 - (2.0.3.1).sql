USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeletePresentation]    Script Date: 5/19/2023 3:07:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
create PROCEDURE [dbo].[DeletePresentation] 
	-- Add the parameters for the stored procedure here
	@PresentationId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Presentations SET Active = 0 WHERE PresentationId=@PresentationId;
END
