USE [Log]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMemberDebtorValue]    Script Date: 01/11/2017 00:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER FUNCTION [dbo].[GetMemberDebtorValue]
(
	@MemberId int
)
RETURNS decimal(18, 0)
AS
BEGIN
	DECLARE @RegiterCost decimal(18, 0)
	DECLARE @SaleCost decimal(18, 0)
	DECLARE @Payment decimal(18, 0)
	DECLARE @Receipts decimal(18, 0)
	SELECT @RegiterCost = SUM(Cost - Discount) FROM Registers WHERE [Active] = 1 AND (MemberId=@MemberId)		
	SELECT @SaleCost = SUM(Cost - Discount) FROM Sales WHERE [Active] = 1 AND (MemberId=@MemberId)		
	SELECT @Payment = SUM(Price) from Transactions WHERE [type] = 1 AND (MemberId=@MemberId) AND Active = 1
	SELECT @Receipts = SUM(Price) from Transactions WHERE [type] = 0 AND (MemberId=@MemberId) AND Active = 1		
	if (@RegiterCost IS NULL) SET @RegiterCost = 0
	if (@SaleCost IS NULL) SET @SaleCost = 0
	if (@Payment IS NULL) SET @Payment = 0
	if (@Receipts IS NULL) SET @Receipts = 0
	RETURN  @Payment - @Receipts - (@SaleCost + @RegiterCost)
END
