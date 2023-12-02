USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCost]    Script Date: 01/04/2017 12:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProduct]
    @ProductId       INT
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE Products SET
		Active = 0
    WHERE ProductId = @ProductId;
END
