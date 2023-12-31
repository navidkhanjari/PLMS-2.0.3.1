USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetTotalCosts]    Script Date: 01/11/2017 01:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetTotalCosts] 
@MemberId int
AS
BEGIN
	DECLARE @RegiterCost decimal(18, 0)
	DECLARE @SaleCost decimal(18, 0)

	SELECT @RegiterCost = SUM(Cost - Discount) FROM Registers WHERE [Active] = 1 AND (MemberId=@MemberId)		
	SELECT @SaleCost = SUM(Cost - Discount) FROM Sales WHERE [Active] = 1 AND (MemberId=@MemberId)		

	if (@RegiterCost IS NULL) SET @RegiterCost = 0
	if (@SaleCost IS NULL) SET @SaleCost = 0


	declare @Data TABLE( totalCosts DECIMAL(18, 0))
	INSERT INTO @Data (totalCosts) VALUES (@SaleCost + @RegiterCost)
	select * FROM @Data
END
