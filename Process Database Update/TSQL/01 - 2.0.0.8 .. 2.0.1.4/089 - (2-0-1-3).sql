USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewPlanning]    Script Date: 6/2/2017 1:12:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[AddNewPlanning] 
@Title nvarchar(50),
@Validity int,
@Space int,
@Gender bit,
@Cost decimal(18, 0),
@Max int,
@SessionCount int,
@Description nvarchar(Max),
@SalonId int,
@DayChecker bit,
@Category nvarchar(100),
@Capacity int,
@CapacitySpace int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Plannings (Title,Validity,Space,Gender,Cost,Max,SessionCount,Description,SalonId,DayChecker,Category,Capacity,CapacitySpace)
	VALUES (@Title,@Validity,@Space,@Gender,@Cost,@Max,@SessionCount,@Description,@SalonId,@DayChecker,@Category,@Capacity,@CapacitySpace);
	SELECT @@IDENTITY AS 'PlanningId';
	
END
