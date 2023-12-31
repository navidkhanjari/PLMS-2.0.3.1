USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 01/04/2017 10:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetProducts]
@ProductId       INT = NULL,
@Name            NVARCHAR(50) = NULL,
@CategoryId      INT = NULL,
@UnitId          INT = NULL,
@Keyword         NVARCHAR(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT     
    dbo.Products.ProductId, 
    dbo.Products.CategoryId, 
    dbo.Products.UnitId, 
    dbo.Products.Name, 
    dbo.Products.Price, 
    dbo.Products.Description, 
    dbo.Categories.Title AS CategoryTitle, 
    dbo.Units.Title AS UnitTitle
    FROM  dbo.Products 
    INNER JOIN dbo.Units ON dbo.Products.UnitId = dbo.Units.UnitId 
    INNER JOIN dbo.Categories ON dbo.Products.CategoryId = dbo.Categories.CategoryId
    WHERE     
		(dbo.Products.Active = 1) AND 
		(dbo.Units.Active = 1) AND 
		(dbo.Categories.Active = 1) AND
		(dbo.Products.Name LIKE '%' + COALESCE(@Name, dbo.Products.Name) + '%') AND
		(dbo.Products.CategoryId      = COALESCE(@CategoryId, dbo.Products.CategoryId)) AND
		(dbo.Products.UnitId          = COALESCE(@UnitId, dbo.Products.UnitId)) AND
		(dbo.Products.ProductId       = COALESCE(@ProductId, dbo.Products.ProductId)) AND
		(dbo.Products.Description LIKE '%' + COALESCE(@Keyword, dbo.Products.Description) + '%')	
	ORDER BY dbo.Products.Name ASC;	
END
