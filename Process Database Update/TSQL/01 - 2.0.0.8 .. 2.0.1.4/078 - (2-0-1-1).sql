USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleteSalon]    Script Date: 01/11/2017 20:08:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSale] 
	-- Add the parameters for the stored procedure here
	@SaleId DECIMAL(18, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Sales SET Active = 0 WHERE Sales.SaleId = @SaleId;
END
