USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetLockers]    Script Date: 11/14/2016 10:23:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetLocker] 
@MemberId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  dbo.Lockers.LockerId, dbo.Lockers.BUSY, dbo.Lockers.CardId FROM dbo.Lockers 
	INNER JOIN dbo.DeliveryLockers ON dbo.Lockers.LockerId = dbo.DeliveryLockers.LockerId
	WHERE dbo.Lockers.BUSY = 1 AND MemberId = @MemberId AND dbo.DeliveryLockers.ReceivedDate = '' AND dbo.DeliveryLockers.ReceivedTime = ''
END
