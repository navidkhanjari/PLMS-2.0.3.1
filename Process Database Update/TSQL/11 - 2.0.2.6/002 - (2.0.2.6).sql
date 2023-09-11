USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EditRegister] 

	@RegisterId    INT, 
    @RegisterDate  NVARCHAR(10),
	@StartDate     nvarchar(10),
	@DateOut       nvarchar(10),
	@SessionCount  INT,
	@Number        INT,
	@Cost          DECIMAL(18, 0),
	@ClubDiscount  DECIMAL(18, 0),
	@CoachDiscount DECIMAL(18, 0),
	@Discount      DECIMAL(18, 0),	
	@PlanningId    INT

AS
BEGIN

	SET NOCOUNT ON;

	UPDATE Registers SET
	 SessionCount	= @SessionCount, 
	 Startdate		= @StartDate, 
	 RegisterDate   = @RegisterDate,
	 DateOut		= @DateOut,
	 Number			= @Number,
	 Cost			= @Cost,
	 Discount		= @Discount,
	 CoachDiscount	= @CoachDiscount,
	 ClubDiscount	= @ClubDiscount,
	 PlanningId		= @PlanningId
	WHERE RegisterId = @RegisterId;

END

