USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[DeleteMessage]    Script Date: 09/12/2016 08:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOutMessage] 
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Messages SET Active=0 WHERE place = 1;
END
