USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCost]    Script Date: 12/22/2016 00:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCost]
    @CostId       INT
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE Costs SET
		Active = 0
    WHERE CostId = @CostId;
END
