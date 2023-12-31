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
CREATE PROCEDURE [dbo].[EditRegister] 
	-- Add the parameters for the stored procedure here
	@RegisterId    int, 
	@SessionCount  int,
	@StartDate     nvarchar(10),
	@DateOut       nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Registers SET SessionCount = @SessionCount, Startdate = @StartDate, DateOut = @DateOut WHERE RegisterId = @RegisterId;
END
