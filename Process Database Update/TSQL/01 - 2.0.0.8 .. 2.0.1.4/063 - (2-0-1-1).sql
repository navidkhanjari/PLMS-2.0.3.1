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
CREATE PROCEDURE [dbo].[EditCost]
    @CostId       INT,
	@CostCenterId INT,
	@AccountId    INT,
	@Date         NVARCHAR(50),
	@Cost         DECIMAL(18,0),
	@Description  NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE Costs SET
		CostCenterId = @CostCenterId, 
		AccountId = @AccountId, 
		Date = @Date, 
		Cost = @Cost, 
		Description = @Description 
    WHERE CostId = @CostId;
END
