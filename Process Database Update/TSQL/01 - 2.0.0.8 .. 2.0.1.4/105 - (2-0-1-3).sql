USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCapacity]
	@StartDate nvarchar(50),
	@EndDate nvarchar(50),
	@PlanningId int
AS
BEGIN
	SET NOCOUNT ON;	
	SELECT 
		Members.MemberId,
		Members.FirstName + ' ' + Members.LastName AS FullName,
		Members.CardId,
		Registers.RegisterDate,
		Registers.Startdate,
		Registers.Dateout,
		Registers.SessionCount
	FROM Registers
	INNER JOIN Plannings ON Plannings.PlanningId = Registers.PlanningId
	INNER JOIN Members	 ON Members.MemberId = Registers.MemberId
	WHERE
	    Registers.Active	=	1				AND
		Members.Active		=	1				AND
		Registers.SessionCount > 0			AND
		Plannings.Validity  <> -1			AND		
		Registers.Dateout   >= @StartDate 	AND
		Registers.Startdate <= @EndDate 	AND
		Plannings.PlanningId = @PlanningId
END
