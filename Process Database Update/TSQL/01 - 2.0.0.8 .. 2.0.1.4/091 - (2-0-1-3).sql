USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditPlanning]    Script Date: 6/2/2017 1:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPlanningCategories] 
BEGIN
	SELECT DISTINCT Category FROM Plannings
END
