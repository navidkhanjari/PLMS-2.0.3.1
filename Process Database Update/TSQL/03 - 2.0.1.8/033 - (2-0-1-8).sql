USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewActivity]    Script Date: 05/11/2019 04:13:37 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewActivity] 
	@UserName	nvarchar(50)		,
	@TableName	nvarchar(50) = null ,
	@RecordedID	nvarchar(50) = null ,
	@Details	nvarchar(512) = null ,
	@Type		nvarchar(50)		,
	@Date		nvarchar(50)		,
	@Time		nvarchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Activities (UserName, TableName, RecordID, Details, Type, Date, Time)
	VALUES				(@UserName, @TableName, @RecordedID, @Details, @Type, @Date, @Time);
END
