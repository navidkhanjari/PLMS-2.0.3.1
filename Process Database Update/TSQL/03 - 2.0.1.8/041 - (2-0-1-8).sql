USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetLastRollCall]    Script Date: 6/5/2018 2:43:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastRollCall]
	@Date nvarchar(50),
	@RegisterId int = null,
	@MemberId int = null
AS
BEGIN

	SET NOCOUNT ON;

	SELECT	TOP (1) PERCENT dbo.RollCalls.*
	FROM	dbo.Registers 
	INNER JOIN	dbo.RollCalls ON dbo.Registers.RegisterId = dbo.RollCalls.RegisterId
	INNER JOIN	dbo.Members ON dbo.Registers.MemberId = dbo.Members.MemberId
	WHERE	
	(dbo.RollCalls.Date = @Date) AND
	(dbo.Registers.RegisterId = COALESCE(@RegisterId, dbo.Registers.RegisterId)) AND
	(dbo.Members.MemberId = COALESCE(@MemberId, dbo.Members.MemberId))
	ORDER BY dbo.RollCalls.LoginTime DESC
END
