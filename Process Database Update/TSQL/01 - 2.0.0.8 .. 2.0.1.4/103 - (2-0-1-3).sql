USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteHoliday] 
	@HolidayId int
AS
BEGIN

	SET NOCOUNT ON;
    
	UPDATE Holidays SET active=0 WHERE HolidayId=@HolidayId;
END
