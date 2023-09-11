USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewPresentation]    Script Date: 5/19/2023 3:05:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewPresentation] 
	@Title nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Presentations (Title) VALUES (@Title);
END
