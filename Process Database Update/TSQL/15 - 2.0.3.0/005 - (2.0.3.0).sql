USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewRegister]    Script Date: 6/14/2022 1:38:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AddNewRegister]
@Startdate nvarchar(50),
@Dateout nvarchar(50),
@LogDate nvarchar(50),
@PlanningId int,
@MemberId int,
@RegisterDate nvarchar(50),
@CoachDiscount decimal(18, 0),
@ClubDiscount decimal(18, 0),
@Discount decimal(18, 0),
@Cost decimal(18, 0),
@Sessioncount int,
@Number int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Registers (Startdate,Dateout,LogDate,PlanningId,MemberId,RegisterDate,Discount,CoachDiscount,ClubDiscount,Cost,Sessioncount,Number)
    VALUES (@Startdate,@Dateout,@LogDate,@PlanningId,@MemberId,@RegisterDate,@Discount,@CoachDiscount,@ClubDiscount,@Cost,@Sessioncount,@Number);
    SELECT @@IDENTITY AS 'RegisterId';

END
