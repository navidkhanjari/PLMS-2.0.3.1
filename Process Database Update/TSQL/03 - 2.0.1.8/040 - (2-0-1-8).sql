USE [Log]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGenderTitle]    Script Date: 05/14/2019 12:23:27 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[GetActivityDetail]
(
	@Type int
)
RETURNS nvarchar(50)
AS
BEGIN
	RETURN CASE 
		WHEN @Type = 0 THEN N'جدید'
		WHEN @Type = 1 THEN N'ویرایش'
		WHEN @Type = 2 THEN N'حذف'
		WHEN @Type = 3 THEN N'جستجو'
		WHEN @Type = 4 THEN N'چاپ'
		WHEN @Type = 5 THEN N'خروج'
		WHEN @Type = 6 THEN N'تغییر رمز عبور'
		WHEN @Type = 7 THEN N'گزارش حضور غیاب مربیان'
		WHEN @Type = 8 THEN N'گزارش ظرفیت'		
	END
END
