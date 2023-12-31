USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPlans]
@MemberId	[int] = NULL,
@PlanId		[int] = NULL
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *, 
		CASE   
          WHEN SportHistory =  0 THEN N'کمتر از شش ماه'   
		  WHEN SportHistory =  1 THEN N'کمتر از یک سال'   
          WHEN SportHistory =  2 THEN N'بیشتر از یک سال'    
		END  AS [SportHistoryTitle],
		CASE   
          WHEN SupplementHistory =  0 THEN N'ندارد'   
		  WHEN SupplementHistory =  1 THEN N'دارد'   
		END  AS [SupplementHistoryTitle],
		CASE   
          WHEN ChangeWeightHistory =  0 THEN N'ندارد'   
		  WHEN ChangeWeightHistory =  1 THEN N'دارد'   
		END  AS [ChangeWeightHistoryTitle],
		CASE   
          WHEN UseSupplement =  0 THEN N'ندارد'   
		  WHEN UseSupplement =  1 THEN N'دارد'   
		END  AS [UseSupplementTitle],
		CASE   
          WHEN SicknessHistory =  0 THEN N'ندارد'   
		  WHEN SicknessHistory =  1 THEN N'دارد'   
		END  AS [SicknessHistoryTitle],
		CASE   
          WHEN FoodSensitivity =  0 THEN N'ندارد'   
		  WHEN FoodSensitivity =  1 THEN N'دارد'   
		END  AS [FoodSensitivityTitle]
	FROM [Plans]
	WHERE 
		Active = 1 AND
		PlanId = COALESCE(@PlanId, PlanId) AND
		MemberId = COALESCE(@MemberId, MemberId)
END
