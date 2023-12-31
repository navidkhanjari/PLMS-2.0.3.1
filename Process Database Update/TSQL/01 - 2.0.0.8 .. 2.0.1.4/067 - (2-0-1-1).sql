USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCost]    Script Date: 01/04/2017 10:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewProduct]
	@CategoryId   INT,
	@UnitId       INT,
	@Name         NVARCHAR(50),
	@Price        DECIMAL(18,0),
	@Description  NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Products (CategoryId, UnitId, Name, Price, Description) VALUES (@CategoryId, @UnitId, @Name, @Price, @Description);
    SELECT @@IDENTITY AS 'ProductId';
END
