USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewRegister]    Script Date: 01/10/2017 09:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[AddNewSale] 
@MemberId INT,
@Date     NVARCHAR(50),
@Time     NVARCHAR(50),
@Discount DECIMAL(18, 0),
@Cost     DECIMAL(18, 0)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Sales (MemberId, Date, Time, Discount, Cost)
    VALUES (@MemberId, @Date, @Time, @Discount, @Cost);
    SELECT @@IDENTITY AS 'SaleId';
END
