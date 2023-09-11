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
CREATE PROCEDURE [dbo].[EditProduct]
    @ProductId    INT,
	@CategoryId   INT,
	@UnitId       INT,
	@Name         NVARCHAR(50),
	@Price        DECIMAL(18,0),
	@Description  NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE Products SET
    CategoryId  = @CategoryId,
    UnitId      = @UnitId, 
    Name        = @Name, 
    Price       = @Price,
    Description = @Description
    WHERE ProductId = @ProductId
END
