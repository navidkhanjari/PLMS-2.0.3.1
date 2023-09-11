USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMessage]    Script Date: 11/11/2021 12:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[DeleteMessage] 
	@MessageId decimal(18, 0) = 0
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Messages SET Active=0 WHERE MessageId = @MessageId;
END
