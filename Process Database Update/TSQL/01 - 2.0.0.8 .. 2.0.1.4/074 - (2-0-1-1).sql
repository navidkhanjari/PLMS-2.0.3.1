USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewSale]    Script Date: 01/10/2017 20:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewSaleLineItem] 
@SaleId    DECIMAL(18,0),
@ProductId DECIMAL(18,0),
@Count     INT,
@Cost      DECIMAL(18,0)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO SaleLineItems (SaleId, ProductId, Count, Cost)
    VALUES (@SaleId, @ProductId, @Count, @Cost);
    SELECT @@IDENTITY AS 'SaleLineItemId';
END
