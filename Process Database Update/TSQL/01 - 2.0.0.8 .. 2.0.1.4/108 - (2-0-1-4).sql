USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddHoliday]    Script Date: 7/26/2017 1:56:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewHoliday] 
	@Date  nvarchar(10),
	@Title nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Holidays(Date, Title) VALUES (@Date, @Title);
	SELECT @@IDENTITY AS 'HolidayId';
END
