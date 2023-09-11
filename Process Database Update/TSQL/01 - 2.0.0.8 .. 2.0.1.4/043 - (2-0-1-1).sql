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
CREATE PROCEDURE [dbo].[DeleteCostCenter] 
	-- Add the parameters for the stored procedure here
	@CostCenterId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE CostCenters SET active=0 WHERE CostCenterId=@CostCenterId;
END
