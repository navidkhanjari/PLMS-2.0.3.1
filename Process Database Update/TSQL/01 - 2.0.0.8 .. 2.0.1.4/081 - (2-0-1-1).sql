USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewAccount]    Script Date: 01/25/2017 13:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ResetCards] 
AS
BEGIN
	SET NOCOUNT ON;
    Update Members Set LogCardId = CardId;
END
