USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMember]    Script Date: 12/15/2018 4:29:59 PM ******/
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
	UPDATE Members SET CardId = '' , LogCardId = '', Active=0  WHERE MemberId = @MemberId;
END
