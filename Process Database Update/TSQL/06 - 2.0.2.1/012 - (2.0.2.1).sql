USE [Log]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetRegistersLastRollCall]
	@Date nvarchar(50),
	@MemberId int = null,
	@SalonId  int = null
AS
BEGIN

	SET NOCOUNT ON;

	SELECT DISTINCT dbo.Registers.RegisterId
	FROM	dbo.Registers 
	INNER JOIN	dbo.Plannings ON dbo.Registers.PlanningId = dbo.Plannings.PlanningId
	INNER JOIN	dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId
	INNER JOIN	dbo.RollCalls ON dbo.Registers.RegisterId = dbo.RollCalls.RegisterId	
	INNER JOIN	dbo.Members ON dbo.Registers.MemberId = dbo.Members.MemberId
	WHERE	
	(dbo.Registers.Active = 1)				AND
	(dbo.RollCalls.LogoutTime = '00:00:00') AND
	(dbo.RollCalls.Date = @Date)			AND
	(dbo.Members.MemberId = COALESCE(@MemberId, dbo.Members.MemberId)) AND
	(dbo.Salons.SalonId   = COALESCE(@SalonId , dbo.Salons.SalonId))
END
