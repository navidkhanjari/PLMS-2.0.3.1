USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditPlanning]    Script Date: 6/2/2017 1:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[EditPlanning] 
@Title nvarchar(50),
@Validity int,
@Space int, 
@Gender bit,
@Cost decimal(18, 0),
@Max int,
@SessionCount int,
@Description nvarchar(Max),
@SalonId int,
@DayChecker bit,
@PlanningId int,
@Category nvarchar(100),
@Capacity int,
@CapacitySpace int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Plannings SET 
	Title=@Title,
	Validity=@Validity,
	Space=@Space,
	SessionCount=@SessionCount,
	Gender=@Gender,
	Cost=@Cost,
    Max=@Max,
	Description=@Description,
	SalonId=@SalonId,
	DayChecker=@DayChecker,
	Category=@Category,
	Capacity=@Capacity,
	CapacitySpace=@CapacitySpace
	WHERE PlanningId=@PlanningId
END
