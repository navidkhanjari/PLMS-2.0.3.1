USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[MemberIsValid]    Script Date: 10/05/2016 21:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[MemberIsValid] 
	-- Add the parameters for the stored procedure here
	@MemberId int = 0,
	@Date nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT COUNT(dbo.Members.CardId) AS Validation 
    FROM dbo.Members 
    INNER JOIN dbo.Registers ON dbo.Members.MemberId = dbo.Registers.MemberId 
    INNER JOIN dbo.Plannings ON dbo.Registers.PlanningId = dbo.Plannings.PlanningId 
    INNER JOIN dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId
    WHERE (dbo.Members.Active = 1) AND(dbo.Registers.Active = 1) AND (dbo.Plannings.Validity = - 1) AND (dbo.Registers.SessionCount > 0) AND (dbo.Members.MemberId = @MemberId) OR
    (dbo.Members.Active = 1)  AND(dbo.Registers.Active = 1) AND (dbo.Plannings.Validity <> - 1) AND (dbo.Registers.SessionCount > 0) AND (dbo.Members.MemberId = @MemberId) AND (dbo.Registers.Startdate <= @Date) AND (dbo.Registers.Dateout >= @Date)
END
