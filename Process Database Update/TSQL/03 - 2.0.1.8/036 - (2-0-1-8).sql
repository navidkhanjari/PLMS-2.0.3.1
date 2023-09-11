USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewAccount]    Script Date: 05/12/2019 03:45:53 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[AddNewAccount] 
	@Title nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Accounts(Title) VALUES (@Title);

	SELECT @@IDENTITY AS 'AccountID';
END
