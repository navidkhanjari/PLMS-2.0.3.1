USE [Log]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUsedSessions]    Script Date: 12/17/2018 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[GetUsedSessions]
(
	@RegisterId int
)
RETURNS decimal(18, 0)
AS
BEGIN
	DECLARE @Count int
	SELECT @Count = Count(@RegisterId) FROM RollCalls Where RegisterId = @RegisterId;
	RETURN  @Count;
END
