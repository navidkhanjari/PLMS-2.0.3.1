USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewPlanning]    Script Date: 10/17/2018 8:49:36 PM ******/
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
@Sport nvarchar(100),
@Coach nvarchar(50),
@Capacity int,
@CapacitySpace int,
@Enabled Bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Plannings (Title,Validity,Space,Gender,Cost,Max,SessionCount,Description,SalonId,DayChecker,Sport,Coach,Capacity,CapacitySpace,Enabled)
	VALUES (@Title,@Validity,@Space,@Gender,@Cost,@Max,@SessionCount,@Description,@SalonId,@DayChecker,@Sport,@Coach,@Capacity,@CapacitySpace,@Enabled);
	SELECT @@IDENTITY AS 'PlanningId';
	
END
