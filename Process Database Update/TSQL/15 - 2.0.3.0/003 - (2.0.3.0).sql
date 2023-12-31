USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewPlanning]    Script Date: 6/7/2022 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AddNewPlanning] 
@Title nvarchar(50),
@Validity int,
@Space int,
@Gender bit = null,
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
@Enabled Bit,
@AllocateLock bit
AS
BEGIN

	SET NOCOUNT ON;
	INSERT INTO Plannings (Title,Validity, [Percent] ,Space,Gender,Cost,Max,SessionCount,Description,SalonId,DayChecker,Sport,Coach,Capacity,CapacitySpace,Enabled, AllocateLock)
	VALUES (@Title,@Validity, @Percent,@Space,@Gender,@Cost,@Max,@SessionCount,@Description,@SalonId,@DayChecker,@Sport,@Coach,@Capacity,@CapacitySpace,@Enabled, @AllocateLock);
	SELECT @@IDENTITY AS 'PlanningId';
	
END
