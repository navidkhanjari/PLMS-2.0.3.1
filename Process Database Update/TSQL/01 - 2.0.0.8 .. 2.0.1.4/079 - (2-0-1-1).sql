USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetUnits]    Script Date: 01/11/2017 22:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetSaleLineItems] 
@SaleId         INT = NULL,
@SaleLineItemId INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  *
	FROM dbo.SaleLineItems
	WHERE 
	dbo.SaleLineItems.SaleId         = COALESCE(@SaleId, dbo.SaleLineItems.SaleId) AND
	dbo.SaleLineItems.SaleLineItemId = COALESCE(@SaleLineItemId, dbo.SaleLineItems.SaleLineItemId)
END
