USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetPlanning]    Script Date: 6/6/2022 10:35:42 PM ******/
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

	DECLARE @CharVariable NVARCHAR(MAX);
	set @CharVariable = 'SELECT * FROM dbo.Plannings INNER JOIN dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId WHERE (dbo.Salons.Active = 1) AND (dbo.Plannings.Active = 1)';

	if (@Gender = 0)
		Set @CharVariable = @CharVariable + ' AND (dbo.Plannings.Gender IS null OR dbo.Plannings.Gender = 0)';
		
	if (@Gender = 1)
		Set @CharVariable = @CharVariable + ' AND (dbo.Plannings.Gender IS null OR dbo.Plannings.Gender = 1)';

	if (@SalonId IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Plannings.SalonId = ' + CONVERT(varchar(MAX), @SalonId) + ')';

	if (@PlanningId IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Plannings.PlanningId = ' + CONVERT(varchar(MAX), @PlanningId) + ')';

	if (@Sport IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Plannings.Sport = N''' + @Sport + ''')';

	if (@Coach IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Plannings.Coach = N''' + @Coach + ''')';

    Set @CharVariable = @CharVariable + ' ORDER BY dbo.Plannings.Sport, dbo.Plannings.Coach, dbo.Plannings.Title';

	EXECUTE sp_executesql @CharVariable;
END
