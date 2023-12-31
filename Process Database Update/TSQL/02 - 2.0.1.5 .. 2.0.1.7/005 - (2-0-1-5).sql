USE [LOG]
GO
/****** Object:  StoredProcedure [dbo].[GetExpireRegister]    Script Date: 11/21/2017 10:50:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetExpireRegister] 
	@SessionCount int, 
	@StartDate nvarchar(50),
	@DateOut nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	dbo.Registers.*
	FROM dbo.Registers 
	WHERE 
	(dbo.Registers.Active = 1) AND 
	(dbo.Registers.Dateout BETWEEN @StartDate AND @DateOut) AND 
	(dbo.RegisterHasIntoAlarms(dbo.Registers.RegisterId) = 0)
END
