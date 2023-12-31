USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetAccounts]    Script Date: 12/03/2016 22:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetCostCenters] 
@CostCenterId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM CostCenters
	WHERE Active = 1 AND 
	CostCenterId = COALESCE(@CostCenterId, CostCenterId)
	ORDER BY Title
END
