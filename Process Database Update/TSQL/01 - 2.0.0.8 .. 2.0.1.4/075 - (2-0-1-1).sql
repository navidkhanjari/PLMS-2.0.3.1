USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetSales]    Script Date: 01/10/2017 22:16:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetSales]
@SaleId    DECIMAL(18,0)   = NULL,
@Gender    BIT             = NULL,
@CardId    NVARCHAR(50)    = NULL,
@FirstName NVARCHAR(50)    = NULL,
@LastName  NVARCHAR(50)    = NULL,
@StartDate NVARCHAR(50)    = NULL,
@DateOut   NVARCHAR(50)    = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT     
		dbo.Members.MemberId, 
		dbo.Members.CardId, 
		dbo.Members.FirstName + ' ' + dbo.Members.LastName AS FullName,
		dbo.Sales.SaleId, 
		dbo.Sales.Date, 
		dbo.Sales.Time, 
		dbo.Sales.Cost, 
		dbo.Sales.Discount
    FROM dbo.Members 
    INNER JOIN dbo.Sales ON dbo.Members.MemberId = dbo.Sales.MemberId
    WHERE     
    (dbo.Members.Active    = 1) AND 
    (dbo.Sales.Active      = 1) AND
    (dbo.Sales.SaleId      = COALESCE(@SaleId, dbo.Sales.SaleId)) AND
    (dbo.Members.Gender    = COALESCE(@Gender, dbo.Members.Gender)) AND
    (dbo.Members.CardId    = COALESCE(@CardId, dbo.Members.CardId)) AND
    (dbo.Members.FirstName LIKE '%' + COALESCE(@FirstName, dbo.Members.FirstName) + '%')AND
    (dbo.Members.LastName  LIKE '%' + COALESCE(@LastName, dbo.Members.LastName) + '%') AND
    (dbo.Sales.Date        >= COALESCE(@StartDate, dbo.Sales.Date)) AND
    (dbo.Sales.Date        <= COALESCE(@DateOut  , dbo.Sales.Date)) 
END
