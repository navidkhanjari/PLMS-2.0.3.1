USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditHoliday] 
	@HolidayId	int,
	@Date  nvarchar(10),
	@Title nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE Holidays SET
	Date = @Date, 
	Title = @Title
	WHERE HolidayId = @HolidayId
END
