USE [LOG]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFingerPrint]    Script Date: 8/13/2023 1:17:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteALLFingerPrint] 
	@MemberId INT
AS
BEGIN
	SET NOCOUNT ON;

	Delete From FingerPrints Where MemberID = @MemberId;
END
