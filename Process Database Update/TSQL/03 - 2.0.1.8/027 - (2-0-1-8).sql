USE [Log]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGenderTitle]    Script Date: 05/01/2019 01:46:00 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[GetDeliveryTitle]
(
	@Type bit
)
RETURNS nvarchar(50)
AS
BEGIN
	If @Type = 0
	 RETURN N'تحویل به عضو'	 
	ELSE 
	 RETURN N'تحویل از عضو';
	RETURN N'';
END
