USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMember]    Script Date: 04/28/2019 11:54:46 ق.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[DeleteMember] 
	@MemberId int = 0
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Members SET CardId = '' , Active=0  WHERE MemberId = @MemberId;
END
