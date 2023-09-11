USE [Log]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EditPlanning] 
@Title nvarchar(50),
@Validity int,
@Space int, 
@Gender bit,
@Cost decimal(18, 0),
@Max int,
@Percent int,
@SessionCount int,
@Description nvarchar(Max),
@SalonId int,
@DayChecker bit,
@PlanningId int,
@Sport nvarchar(100),
@Coach nvarchar(50),
@Capacity int,
@CapacitySpace int,
@Enabled Bit
AS
BEGIN

	SET NOCOUNT ON;
	UPDATE Plannings SET 
	Title=@Title,
	Validity=@Validity,
	Space=@Space,
	[Percent] = @Percent,
	SessionCount=@SessionCount,
	Gender=@Gender,
	Cost=@Cost,
    Max=@Max,
	Description=@Description,
	SalonId=@SalonId,
	DayChecker=@DayChecker,
	Sport=@Sport,
	Coach=@Coach,
	Capacity=@Capacity,
	CapacitySpace=@CapacitySpace,
	Enabled = @Enabled
	WHERE PlanningId=@PlanningId
END
