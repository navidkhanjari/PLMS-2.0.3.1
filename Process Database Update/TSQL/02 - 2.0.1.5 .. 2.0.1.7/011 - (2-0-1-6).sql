USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetPlanning]    Script Date: 10/17/2018 8:53:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetPlanning] 
	@Gender bit = Null,
	@SalonId int = Null,
	@PlanningId int = NULL,
	@Sport	nvarchar(100) = NULL,
	@Coach	nvarchar(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

   SELECT * FROM dbo.Plannings 
   INNER JOIN dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId
   WHERE (dbo.Salons.Active = 1) AND (dbo.Plannings.Active = 1) 
   AND Sport = COALESCE(@Sport, Sport) 
   AND Coach = COALESCE(@Coach, Coach) 
   AND Gender = COALESCE(@Gender, Gender) 
   AND dbo.Salons.SalonId = COALESCE(@SalonId, dbo.Salons.SalonId)   
   AND dbo.Plannings.PlanningId = COALESCE(@PlanningId, dbo.Plannings.PlanningId) 
   ORDER BY dbo.Plannings.Sport, dbo.Plannings.Coach, dbo.Plannings.Title
END
