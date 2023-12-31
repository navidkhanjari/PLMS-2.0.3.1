USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetPlanning]    Script Date: 10/17/2018 8:53:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSports] 
	@Gender bit = Null,
	@SalonId int = Null
AS
BEGIN
	SET NOCOUNT ON;

    SELECT DISTINCT Sport FROM Plannings WHERE
	Active  = 1	AND
	SalonId = COALESCE(@SalonId, SalonId)  AND
	Gender  = COALESCE(@Gender, Gender)
	order by Sport;

END
