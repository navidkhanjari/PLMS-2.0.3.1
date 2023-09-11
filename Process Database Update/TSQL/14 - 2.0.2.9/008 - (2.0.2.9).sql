USE [Log]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMessageTypeTitle]    Script Date: 11/3/2021 11:42:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[GetMessageStatus]
(
	@Sent Bit,
	@Expired Bit
)
RETURNS nvarchar(50)
AS
BEGIN

	if (@Sent = 1)
		RETURN N'ارسال شده' 
	else if (@Expired = 1)
		RETURN N'منقضی شده'
	RETURN N'ارسال نشده'
END
