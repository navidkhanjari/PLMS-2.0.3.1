USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddHoliday] 
	@Date  nvarchar(10),
	@Title nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Holidays(Date, Title) VALUES (@Date, @Title);
	SELECT @@IDENTITY AS 'HolidayId';
END
