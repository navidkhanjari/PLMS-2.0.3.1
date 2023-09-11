USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 05/13/2019 11:19:02 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[AddNewCategory] 
	@Title nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Categories(Title) VALUES (@Title);

	SELECT @@IDENTITY AS 'CategoryId'
END
