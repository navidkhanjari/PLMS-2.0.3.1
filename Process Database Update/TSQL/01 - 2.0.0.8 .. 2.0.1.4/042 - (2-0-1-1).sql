USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditAccount]    Script Date: 12/03/2016 22:08:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[EditCostCenter] 
	-- Add the parameters for the stored procedure here
	@CostCenterId int = 0, 
	@Title nvarchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE CostCenters SET Title=@Title WHERE CostCenterId=@CostCenterId;
END
