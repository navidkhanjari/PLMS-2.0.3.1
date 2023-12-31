USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetPlanning]    Script Date: 10/17/2018 8:53:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetCoachs] 
	@Gender		BIT = Null,
	@SalonId	INT = Null,
	@Sport		NVARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

    SELECT DISTINCT Coach FROM Plannings WHERE
	Active  = 1	AND
	SalonId = COALESCE(@SalonId, SalonId)  AND
	Gender  = COALESCE(@Gender,  Gender)   AND
	Sport   = COALESCE(@Sport,   Sport)
	order by coach
END
