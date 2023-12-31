USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetMessages]    Script Date: 7/9/2019 3:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLoginRollCalls] 
@Date nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT * FROM RollCalls 
	WHERE 
		(RollCalls.LogoutTime = '00:00:00') AND
		(RollCalls.Date = @Date)
END
