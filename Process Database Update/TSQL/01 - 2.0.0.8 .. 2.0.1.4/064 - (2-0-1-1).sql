USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetCosts]    Script Date: 12/31/2016 08:33:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetCosts]
@CostId       INT = null,
@StartDate    NVARCHAR(50) = NULL,
@DateOut      NVARCHAR(50) = NULL,
@CostCenterId INT = NULL,
@Accountid    INT = NULL,
@Keyword      NVARCHAR(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT     
    dbo.Costs.CostId, 
    dbo.Costs.CostCenterId, 
    dbo.Costs.AccountId, 
    dbo.Costs.Date, 
    dbo.Costs.Cost, 
    dbo.Costs.Description, 
    dbo.CostCenters.Title AS CostCenterTitle, 
    dbo.Accounts.Title AS AccountTitle
    FROM  dbo.Costs 
    INNER JOIN dbo.Accounts ON dbo.Costs.AccountId = dbo.Accounts.AccountId 
    INNER JOIN dbo.CostCenters ON dbo.Costs.CostCenterId = dbo.CostCenters.CostCenterId
    WHERE     
		(dbo.Costs.Active = 1) AND 
		(dbo.Accounts.Active = 1) AND 
		(dbo.CostCenters.Active = 1) AND
		(dbo.Costs.CostId = COALESCE(@CostId, dbo.Costs.CostId)) AND
		(dbo.Costs.Date >= COALESCE(@StartDate, dbo.Costs.Date)) AND
		(dbo.Costs.Date <= COALESCE(@DateOut, dbo.Costs.Date)) AND
		(dbo.Costs.AccountId = COALESCE(@AccountId, dbo.Costs.AccountId)) AND
		(dbo.Costs.CostCenterId = COALESCE(@CostCenterId, dbo.Costs.CostCenterId)) AND
		(dbo.Costs.CostId = COALESCE(@CostId, dbo.Costs.CostId)) AND
		(dbo.Costs.Description LIKE '%' + COALESCE(@Keyword, dbo.Costs.Description) + '%')	
	ORDER BY dbo.Costs.Date ASC;	
END
