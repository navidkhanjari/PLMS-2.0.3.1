USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUnit]    Script Date: 05/13/2019 11:23:55 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[AddNewUnit] 
	@Title nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Units(Title) VALUES (@Title);

	SELECT @@IDENTITY AS 'UnitId'
END
