USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetListOfRollCall]    Script Date: 04/28/2019 10:37:09 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetListOfRollCall] 
	@RegisterId	decimal(18, 0) = NULL,
	@Date  nvarchar(50) = NULL,
	@SalonID	int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM dbo.RollCalls 
	INNER JOIN dbo.Registers ON  dbo.RollCalls.RegisterId = dbo.Registers.RegisterId
	INNER JOIN dbo.Plannings ON  dbo.Registers.PlanningId = dbo.Plannings.PlanningId
	INNER JOIN dbo.Salons	 ON  dbo.Salons.SalonId		  = dbo.Plannings.SalonId
	WHERE
		dbo.RollCalls.Date  = coalesce (@Date, dbo.RollCalls.Date) AND
		dbo.RollCalls.RegisterId  = coalesce (@RegisterId, dbo.RollCalls.RegisterId) AND
		dbo.Plannings.SalonId  = coalesce (@SalonID, dbo.Plannings.SalonId)
END
