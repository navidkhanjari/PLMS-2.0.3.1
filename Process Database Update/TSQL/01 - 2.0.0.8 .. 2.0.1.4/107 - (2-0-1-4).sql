USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetHolidays]
@HolidayId		[int] = null,
@FirstDate		[nvarchar](10) = null,
@LastDate		[nvarchar](10) = null
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *	
	FROM [Holidays]
	WHERE 
		Active = 1 AND
		HolidayId = COALESCE(@HolidayId, HolidayId) AND
		[Date] >= COALESCE(@FirstDate, [Date]) AND
		[Date] <= COALESCE(@LastDate, [Date])
END
