
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
ALTER FUNCTION [dbo].[GetMemberValidtion]
(
	@MemberId int,
	@Date nvarchar(50),
	@ExpireStartDate nvarchar(50) = Null,
	@ExpireEndDate   nvarchar(50) = Null,
	@PlanningId int = NULL,
	@RegisterId int = NULL
)
RETURNS nvarchar(50)
AS
BEGIN
	IF EXISTS(SELECT Members.CardId
				FROM dbo.Members
				INNER JOIN dbo.Registers ON dbo.Members.MemberId = dbo.Registers.MemberId
				INNER JOIN dbo.Plannings ON dbo.Registers.PlanningId = dbo.Plannings.PlanningId
				INNER JOIN dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId
				WHERE	(dbo.Registers.Active = 1)         AND 
						(dbo.Members.MemberId = @MemberId) AND 
						(dbo.Plannings.Validity = - 1)     AND 
						(dbo.Registers.SessionCount > 0)   AND  
						(dbo.Registers.RegisterId = COALESCE(@RegisterId, dbo.Registers.RegisterId)) AND
						(dbo.Plannings.PlanningId = COALESCE(@PlanningId, dbo.Plannings.PlanningId))
						OR
						(dbo.Registers.Active = 1)         AND 
						(dbo.Members.MemberId = @MemberId) AND 
						(dbo.Plannings.Validity <> - 1)    AND
						(dbo.Registers.SessionCount > 0)   AND 
						(dbo.Registers.Startdate <= @Date) AND 
						(dbo.Registers.Dateout >= @Date)   AND 		
										
						(dbo.Registers.Dateout >= COALESCE(@ExpireStartDate,dbo.Registers.Dateout)) AND 
						(dbo.Registers.Dateout <= COALESCE(@ExpireEndDate, dbo.Registers.Dateout))   AND 
						(dbo.Registers.RegisterId = COALESCE(@RegisterId, dbo.Registers.RegisterId)) AND
						(dbo.Plannings.PlanningId = COALESCE(@PlanningId, dbo.Plannings.PlanningId)))						
		RETURN N'معتبر';
	RETURN N'نامعتبر';
END
