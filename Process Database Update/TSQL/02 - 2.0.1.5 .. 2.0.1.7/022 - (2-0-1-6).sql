USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditRegister]    Script Date: 12/5/2018 2:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[EditRegister] 
	-- Add the parameters for the stored procedure here
	@RegisterId    INT, 
	@SessionCount  INT,
	@Number        INT,
	@PlanningId    INT,
	@Cost          DECIMAL(18, 0),
	@Discount      DECIMAL(18, 0),
	@StartDate     nvarchar(10),
	@DateOut       nvarchar(10)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Registers SET
	 SessionCount = @SessionCount, 
	 Startdate  = @StartDate, 
	 DateOut    = @DateOut,
	 Number     = @Number,
	 Cost       = @Cost,
	 Discount	= @Discount,
	 PlanningId = @PlanningId
	WHERE RegisterId = @RegisterId;
END
