USE [LOG]
GO
/****** Object:  StoredProcedure [dbo].[GetDeliveryLockers]    Script Date: 12/13/2016 23:17:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetDeliveryLockers] 
@LockerId  INT          = NULL,
@CardId    NVARCHAR(50) = NULL,
@FirstName NVARCHAR(50) = NULL,
@LastName  NVARCHAR(50) = NULL,
@FirstDate NVARCHAR(10) = NULL,
@LastDate  NVARCHAR(10) = NULL,
@Gender    BIT          = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  
	dbo.Members.CardId,
	dbo.Members.Picture,
	dbo.Members.MemberId,
	dbo.Members.FirstName + ' ' + dbo.Members.LastName AS FullName, 
	dbo.DeliveryLockers.LockerId, 
	dbo.DeliveryLockers.DeliveredDate + ' ' + dbo.DeliveryLockers.DeliveredTime AS Delivered, 
	dbo.DeliveryLockers.ReceivedDate + ' ' + dbo.DeliveryLockers.ReceivedTime AS Received
	FROM  dbo.DeliveryLockers 
	INNER JOIN dbo.Members ON dbo.DeliveryLockers.MemberId = dbo.Members.MemberId
    WHERE 
        dbo.DeliveryLockers.LockerId = COALESCE(@LockerId, dbo.DeliveryLockers.LockerId)
    AND dbo.Members.CardId = COALESCE(@CardId, dbo.Members.CardId)
	AND dbo.Members.FirstName LIKE '%' + coalesce (@FirstName, dbo.Members.FirstName) + '%'
	AND dbo.Members.LastName LIKE '%' + coalesce (@LastName, dbo.Members.LastName) + '%'		
	AND dbo.DeliveryLockers.DeliveredDate >= COALESCE(@FirstDate, dbo.DeliveryLockers.DeliveredDate)
	AND dbo.DeliveryLockers.DeliveredDate <= COALESCE(@LastDate, dbo.DeliveryLockers.DeliveredDate)
	AND dbo.Members.Gender = COALESCE(@Gender, dbo.Members.Gender)
	ORDER BY dbo.DeliveryLockers.DeliveredDate DESC , dbo.DeliveryLockers.DeliveredTime DESC
END
