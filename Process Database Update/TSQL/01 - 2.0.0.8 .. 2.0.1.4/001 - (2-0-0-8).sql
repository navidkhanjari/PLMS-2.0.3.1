use[Log]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetRollCallType] 
	@MemberId int,
	@Date nvarchar(50),	
	@SalonId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
	TOP (1) PERCENT dbo.RollCalls.Date, 
	dbo.RollCalls.loginTime, 
	dbo.RollCalls.logoutTime,
	dbo.RollCalls.RegisterId 
	FROM dbo.RollCalls 
	INNER JOIN dbo.Registers ON dbo.RollCalls.RegisterId = dbo.Registers.RegisterId 
	INNER JOIN dbo.Plannings ON dbo.Registers.PlanningId = dbo.Plannings.PlanningId 
	WHERE 
	(dbo.Registers.MemberId=@MemberId) AND 
	(dbo.RollCalls.logoutTime = '00:00:00') AND 
	(dbo.RollCalls.Date =@Date) AND
	(dbo.Plannings.SalonId = @SalonId)
	ORDER BY dbo.RollCalls.Date DESC, dbo.RollCalls.loginTime DESC
END
