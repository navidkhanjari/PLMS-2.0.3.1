USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewSalon]    Script Date: 12/21/2016 23:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewCost]
	@CostCenterId INT,
	@AccountId    INT,
	@Date         NVARCHAR(50),
	@Cost         DECIMAL(18,0),
	@Description  NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Costs (CostCenterId, AccountId, Date, Cost, Description) VALUES (@CostCenterId, @AccountId, @Date, @Cost, @Description);
    SELECT @@IDENTITY AS 'CostId';
END
