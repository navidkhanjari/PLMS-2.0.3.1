USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetPlanning] 
	@Gender bit = Null,
	@SalonId int = Null,
	@PlanningId int = NULL,
	@Category	nvarchar(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;

   SELECT * FROM dbo.Plannings 
   INNER JOIN dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId
   WHERE (dbo.Salons.Active = 1) AND (dbo.Plannings.Active = 1) 
   AND Category = COALESCE(@Category, Category) 
   AND Gender = COALESCE(@Gender, Gender) 
   AND dbo.Salons.SalonId = COALESCE(@SalonId, dbo.Salons.SalonId)   
   AND dbo.Plannings.PlanningId = COALESCE(@PlanningId, dbo.Plannings.PlanningId)  
END
