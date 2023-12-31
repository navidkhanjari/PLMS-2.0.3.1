USE [Log]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AddNewPlanning] 
@Title nvarchar(50),
@Validity int,
@Space int,
@Gender bit,
@Cost decimal(18, 0),
@Max int,
@Percent int,
@SessionCount int,
@Description nvarchar(Max),
@SalonId int,
@DayChecker bit,
@Sport nvarchar(100),
@Coach nvarchar(50),
@Capacity int,
@CapacitySpace int,
@Enabled Bit
AS
BEGIN

	SET NOCOUNT ON;
	INSERT INTO Plannings (Title,Validity, [Percent] ,Space,Gender,Cost,Max,SessionCount,Description,SalonId,DayChecker,Sport,Coach,Capacity,CapacitySpace,Enabled)
	VALUES (@Title,@Validity, @Percent,@Space,@Gender,@Cost,@Max,@SessionCount,@Description,@SalonId,@DayChecker,@Sport,@Coach,@Capacity,@CapacitySpace,@Enabled);
	SELECT @@IDENTITY AS 'PlanningId';
	
END
