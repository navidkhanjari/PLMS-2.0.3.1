USE [Log]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMessageTypeTitle]    Script Date: 5/24/2023 3:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER FUNCTION [dbo].[GetMessageTypeTitle]
(
	@Type int
)
RETURNS nvarchar(50)
AS
BEGIN

	IF @Type = 0
		RETURN N'خوش آمد گویی'	 
	ELSE IF @Type = 1
		RETURN N'تبریک تولد'	 
	ELSE IF @Type = 2
		RETURN N'پایان اعتبار بیمه'	 
	ELSE IF @Type = 3
		RETURN N'پایان اعتبار خدمت'	 
	ELSE IF @Type = 4
		RETURN N'ورود و خروج'	 
	ELSE IF @Type = 5
		RETURN N'اطلاع رسانی'	 
	ELSE IF @Type = 6
		RETURN N'گزارش مدیریت'	 
	ELSE 
		RETURN N'نامشخص'	 

	RETURN N''
END
