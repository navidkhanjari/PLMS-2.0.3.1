USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetSalons]    Script Date: 11/15/2016 9:16:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetDeliveryLockers] 
@LockerId INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  
	dbo.Members.MemberId,
	dbo.Members.FirstName + ' ' + dbo.Members.LastName AS FullName, 
	dbo.DeliveryLockers.LockerId, 
	dbo.DeliveryLockers.DeliveredDate + ' ' + dbo.DeliveryLockers.DeliveredTime AS Delivered, 
	dbo.DeliveryLockers.ReceivedDate + ' ' + dbo.DeliveryLockers.ReceivedTime AS Received
	FROM  dbo.DeliveryLockers 
	INNER JOIN dbo.Members ON dbo.DeliveryLockers.MemberId = dbo.Members.MemberId
    WHERE LockerId = COALESCE(@LockerId, LockerId)
	ORDER BY dbo.DeliveryLockers.DeliveredDate DESC , dbo.DeliveryLockers.DeliveredTime DESC
END
