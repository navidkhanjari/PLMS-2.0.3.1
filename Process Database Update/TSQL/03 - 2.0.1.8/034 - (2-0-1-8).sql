USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetActivities]    Script Date: 05/14/2019 12:39:17 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetActivities] 

	@UserName		nvarchar(50) = null,
	@TableName		nvarchar(50) = null,
	@RecordID		Decimal(18,0)= null,
	@DateFrom		nvarchar(10) = null,
	@DateTo			nvarchar(10) = null,
	@TimeFrom		nvarchar(8)  = null,
	@TimeTo			nvarchar(8)  = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  *,dbo.GetActivityDetail(dbo.Activities.Type) AS TypeTitle,
	 dbo.Users.FirstName + ' ' +dbo.Users.LastName As FullName
	FROM dbo.Activities 	
	INNER JOIN dbo.Users ON Users.UserName = Activities.UserName

	WHERE	
	(dbo.Users.UserName  =    COALESCE(@UserName, dbo.Users.UserName))		AND
	(TableName =    COALESCE(@TableName, TableName))	AND
	(RecordID  =    COALESCE(@RecordID, RecordID))		AND	
	(Date	  >=    COALESCE(@DateFrom, Date))			AND
	(Date	  <=    COALESCE(@DateTo, Date))			AND
	(Time	  >=    COALESCE(@TimeFrom, Time))			AND
	(Time	  <=	COALESCE(@TimeTo, Time))

	ORDER BY dbo.Activities.Date ASC, dbo.Activities.Time ASC
END
