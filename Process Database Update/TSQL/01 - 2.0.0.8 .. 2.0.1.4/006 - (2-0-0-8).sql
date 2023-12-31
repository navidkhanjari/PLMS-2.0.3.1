use[log]
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

-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetValidationRegisters]
	-- Add the parameters for the stored procedure here
	@Date nvarchar(50) = null,
	@CardId nvarchar(50) = null,
	@SalonId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT dbo.Registers.registerId, 
				CASE dbo.Plannings.Validity WHEN - 1 THEN 
					dbo.Registers.Startdate 
				ELSE 
					dbo.Registers.Startdate + '-' + dbo.Registers.Dateout 
				END AS date, 
				dbo.Registers.SessionCount,
				dbo.Registers.Number,
				dbo.GetValidityTitle(dbo.Plannings.Validity) AS validityType, 
				dbo.Plannings.Title, 
				dbo.Registers.Cost, 
				dbo.Salons.Title AS salonTitle,
				dbo.Members.CardId, dbo.Members.FirstName + ' ' + dbo.Members.LastName AS fullname, 
				dbo.GetGenderTitle(dbo.Members.Gender) AS gender
	FROM dbo.Registers 
	INNER JOIN	dbo.Plannings ON dbo.Registers.PlanningId = dbo.Plannings.PlanningId 
	INNER JOIN	dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId
	INNER JOIN	dbo.Members ON dbo.Registers.MemberId = dbo.Members.MemberId 
	WHERE 
		((dbo.Registers.SessionCount > 0) AND (dbo.Plannings.Validity = - 1) AND (dbo.Registers.Active = 1)
		OR 
		(dbo.Registers.SessionCount > 0) AND 
		(dbo.Plannings.Validity <> - 1) AND 
		(@Date >= dbo.Registers.Startdate) AND (@Date <= dbo.Registers.Dateout)  AND 
		(dbo.Registers.Active = 1)) 
		AND dbo.Members.Active = 1
		AND dbo.Plannings.Active = 1
		AND dbo.Salons.Active = 1
		AND dbo.Members.CardId = COALESCE(@CardId, dbo.Members.CardId)
		AND dbo.Salons.SalonId = COALESCE(@SalonId, dbo.Salons.SalonId)        
END
