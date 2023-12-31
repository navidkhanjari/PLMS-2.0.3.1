USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[AddNewPlan] 
	@MemberId [int] ,
	@RegisterDate [nvarchar](10) ,
	@SportHistory [int] ,
	@SportHistoryDescription [nvarchar](max) ,
	@SupplementHistory [bit] ,
	@SupplementDescription [nvarchar](max) ,
	@ChangeWeightHistory [bit] ,
	@ChangeWeightDescription [nvarchar](max) ,
	@UseSupplement [bit] ,
	@UseSupplementDescription [nvarchar](max) ,
	@Target [nvarchar](max) ,
	@TargetDescription [nvarchar](max) ,
	@Length [int] ,
	@Weigh [int] ,
	@ShoulderSize [int] ,
	@NeckSize [int] ,
	@LumbarSize [int] ,
	@ChestSize [int] ,
	@RightArmSize [int] ,
	@LeftArmSize [int] ,
	@RightForearmSize [int] ,
	@LeftForearmSize [int] ,
	@RightHipSize [int] ,
	@LeftHipSize [int] ,
	@RightThighSize [int] ,
	@LeftThighSize [int] ,
	@RightLegSize [int] ,
	@LeftLegSize [int] ,
	@RightWristSize [int] ,
	@LeftWristSize [int] ,
	@HeartBeat [int] ,
	@BloodPressure [int] ,
	@BloodGlucose [int] ,
	@BloodFat [int] ,
	@Metabolism [int] ,
	@TotalBodyWater [int] ,
	@SizeDescription [nvarchar](max) ,
	@SicknessHistory [bit] ,
	@SicknessHistoryDescription [nvarchar](max) ,
	@UseSicknessType [nvarchar](max) ,
	@FoodSensitivity [bit] ,
	@FoodSensitivityDescription [nvarchar](max) ,
	@SicknessDescription [nvarchar](max) ,
	@Description [nvarchar](max) ,
	@Picture1 [image],
	@Picture2 [image],
	@Picture3 [image],
	@Picture4 [image],
	@Picture5 [image],
	@Picture6 [image],
	@Picture7 [image],
	@Picture8 [image]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [Plans] (MemberId,RegisterDate,SportHistory,SportHistoryDescription,SupplementHistory,SupplementDescription,ChangeWeightHistory,ChangeWeightDescription,UseSupplement,UseSupplementDescription,Target,TargetDescription,Length,Weigh,ShoulderSize,NeckSize,LumbarSize,ChestSize,RightArmSize,LeftArmSize,RightForearmSize,LeftForearmSize,RightHipSize,LeftHipSize,RightThighSize,LeftThighSize,RightLegSize,LeftLegSize,RightWristSize,LeftWristSize,HeartBeat,BloodPressure,BloodGlucose,BloodFat,Metabolism,TotalBodyWater,SizeDescription,SicknessHistory,SicknessHistoryDescription,UseSicknessType,FoodSensitivity,FoodSensitivityDescription,SicknessDescription,Description,Picture1,Picture2,Picture3,Picture4,Picture5,Picture6,Picture7,Picture8)
	VALUES (@MemberId, @RegisterDate, @SportHistory, @SportHistoryDescription, @SupplementHistory, @SupplementDescription, @ChangeWeightHistory, @ChangeWeightDescription, @UseSupplement, @UseSupplementDescription, @Target, @TargetDescription, @Length, @Weigh, @ShoulderSize, @NeckSize, @LumbarSize, @ChestSize, @RightArmSize, @LeftArmSize, @RightForearmSize, @LeftForearmSize, @RightHipSize, @LeftHipSize, @RightThighSize, @LeftThighSize, @RightLegSize, @LeftLegSize, @RightWristSize, @LeftWristSize, @HeartBeat, @BloodPressure, @BloodGlucose, @BloodFat, @Metabolism, @TotalBodyWater, @SizeDescription, @SicknessHistory, @SicknessHistoryDescription, @UseSicknessType, @FoodSensitivity, @FoodSensitivityDescription, @SicknessDescription, @Description, @Picture1, @Picture2, @Picture3, @Picture4, @Picture5, @Picture6, @Picture7, @Picture8)
	SELECT @@IDENTITY AS 'PlanId';
END
