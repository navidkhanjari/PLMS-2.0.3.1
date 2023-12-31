USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditRollCall]    Script Date: 05/06/2019 01:38:01 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[EditRollCall2] 
@RegisterId decimal(18,0), 

@OldDate nvarchar(50),
@OldLoginTime nvarchar(50),
@OldLogoutTime nvarchar(50),

@NewDate nvarchar(50),
@NewLoginTime nvarchar(50),
@NewLogoutTime nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE RollCalls SET 
		Date = @NewDate , 
		LoginTime = @NewLoginTime ,
		LogoutTime = @NewLogoutTime 
	WHERE 
		RegisterId = @RegisterId AND 
		Date = @OldDate AND 
		LoginTime = @OldLoginTime  AND
		LogoutTime = @OldLogoutTime
END
