USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetHolidays]
@HolidayId		[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *	
	FROM [Holidays]
	WHERE 
		Active = 1 AND
		@HolidayId = COALESCE(@HolidayId, HolidayId)
END
