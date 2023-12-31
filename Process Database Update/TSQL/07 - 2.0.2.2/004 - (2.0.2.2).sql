USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EditRegister] 

	@RegisterId    INT, 
	@SessionCount  INT,
	@Number        INT,
	@PlanningId    INT,
	@Cost          DECIMAL(18, 0),
	@Discount      DECIMAL(18, 0),
	@CoachDiscount DECIMAL(18, 0),
	@ClubDiscount  DECIMAL(18, 0),
	@StartDate     nvarchar(10),
	@DateOut       nvarchar(10)
	
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Registers SET
	 SessionCount	= @SessionCount, 
	 Startdate		= @StartDate, 
	 DateOut		= @DateOut,
	 Number			= @Number,
	 Cost			= @Cost,
	 Discount		= @Discount,
	 CoachDiscount	= @CoachDiscount,
	 ClubDiscount	= @ClubDiscount,
	 PlanningId		= @PlanningId
	WHERE RegisterId = @RegisterId;
END
