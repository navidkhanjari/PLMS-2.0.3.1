USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetMember]    Script Date: 12/06/2016 10:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =======================s======================
ALTER PROCEDURE [dbo].[GetMember] 
    @LogCardId nvarchar(50) = NULL,
	@CardId nvarchar(50) = NULL,
	@MemberId int = NULL,
	@NationalId NVARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;
    SELECT	* FROM Members 
    WHERE Active=1
    AND  LogCardId = COALESCE(@LogCardId, LogCardId)
    AND  CardId = COALESCE(@CardId, CardId)
    AND  MemberId = COALESCE(@MemberId, MemberId)
    AND  NationalId = COALESCE(@NationalId, NationalId)
END
