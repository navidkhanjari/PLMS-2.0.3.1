USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewAccount]    Script Date: 12/03/2016 22:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewCategory] 
	@Title nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Categories(Title) VALUES (@Title);
END
