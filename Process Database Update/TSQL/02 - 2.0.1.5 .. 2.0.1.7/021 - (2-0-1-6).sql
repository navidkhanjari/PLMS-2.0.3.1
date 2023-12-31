USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetRollCalls]    Script Date: 11/17/2018 2:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetRollCalls] 
	-- Add the parameters for the stored procedure here
	@PlanningId int = null,
	@SalonId int = null,
	@StartDate nvarchar(50) = null,
	@DateOut nvarchar (50) = null,
	@Gender bit = null, 
	@CardId nvarchar(50) = null,
	@FirstName nvarchar(50) = null,
	@LastName nvarchar(50) = null,
	@RegisterId decimal(18,0) = null,
	@Sport	NVARCHAR(50) = null,
	@Coach	NVARCHAR(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		dbo.Members.CardId, 
		dbo.Members.FirstName + ' ' + dbo.Members.LastName AS fullname, 
		dbo.GetGenderTitle(dbo.Members.gender) AS gender, 
		dbo.RollCalls.Date, 
		dbo.RollCalls.loginTime, 
		dbo.RollCalls.logoutTime, 
		dbo.Plannings.Sport + ' [' + dbo.Plannings.Coach + ' / ' + dbo.Plannings.Title + ']' As Title,
		dbo.Registers.Number
	FROM dbo.RollCalls 
		INNER JOIN dbo.Registers ON dbo.RollCalls.RegisterId = dbo.Registers.RegisterId 
		INNER JOIN dbo.Members ON dbo.Registers.MemberId = dbo.Members.MemberId 
		INNER JOIN dbo.Plannings ON dbo.Registers.PlanningId = dbo.Plannings.PlanningId
		INNER JOIN dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId
		WHERE (dbo.Registers.Active = 1) AND (dbo.Members.Active = 1) AND (dbo.Plannings.Active = 1) AND (dbo.Salons.Active = 1)
		AND dbo.Plannings.Sport = coalesce (@Sport, dbo.Plannings.Sport)
		AND dbo.Plannings.Coach = coalesce (@Coach, dbo.Plannings.Coach)
		AND dbo.Salons.SalonId = coalesce (@SalonId, dbo.Salons.SalonId) 
		AND dbo.RollCalls.Date >= coalesce (@StartDate, dbo.RollCalls.Date)
		AND dbo.RollCalls.Date <= coalesce (@DateOut, dbo.RollCalls.Date)
		AND dbo.Members.Gender = coalesce (@Gender, dbo.Members.Gender)
		AND dbo.Members.CardId = coalesce (@CardId, dbo.Members.CardId)
		AND dbo.Members.FirstName LIKE '%' + coalesce (@FirstName, dbo.Members.FirstName) + '%'
		AND dbo.Members.LastName LIKE '%' + coalesce (@LastName, dbo.Members.LastName) + '%'
		AND dbo.Plannings.PlanningId = coalesce (@PlanningId, dbo.Plannings.PlanningId)    
		AND dbo.Registers.RegisterId = coalesce (@RegisterId, dbo.Registers.RegisterId) 
		ORDER BY dbo.RollCalls.Date ASC, dbo.RollCalls.loginTime ASC
END
