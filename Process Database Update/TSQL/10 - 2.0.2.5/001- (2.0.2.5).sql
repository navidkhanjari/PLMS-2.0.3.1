USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetCapacity]    Script Date: 6/16/2020 11:57:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCapacity]
	@Date nvarchar(50),
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
	    (Registers.Active = 1)					AND 
		(Members.Active = 1)					AND 
		(Registers.SessionCount > 0)			AND 
		(Plannings.Validity  <> -1)				AND
		(Plannings.PlanningId = @PlanningId)	AND
		(@Date >= Registers.Startdate )			AND
		(@Date <= Registers.Dateout);

END
