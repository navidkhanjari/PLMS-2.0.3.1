USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[GetPercent]
(
	@ID int
)
RETURNS int
AS
BEGIN
	DECLARE @Percent INT
	select @Percent = [Percent] from Plannings where PlanningId = @ID

	RETURN @Percent;
END
