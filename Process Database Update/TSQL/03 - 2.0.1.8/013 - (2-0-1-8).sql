USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetListOfRollCall]    Script Date: 04/22/2019 05:39:35 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetListOfRollCall] 
	@RegisterId	decimal(18, 0) = NULL,
	@Date  nvarchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM dbo.RollCalls WHERE 
		dbo.RollCalls.Date  = coalesce (@Date, dbo.RollCalls.Date) AND
		dbo.RollCalls.RegisterId  = coalesce (@RegisterId, dbo.RollCalls.RegisterId) 
END
