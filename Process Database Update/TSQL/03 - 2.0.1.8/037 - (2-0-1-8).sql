USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCostCenter]    Script Date: 05/12/2019 04:01:13 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[AddNewCostCenter] 
	@Title nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO CostCenters(Title) VALUES (@Title);

	SELECT @@IDENTITY AS 'CostCenterId';

END
