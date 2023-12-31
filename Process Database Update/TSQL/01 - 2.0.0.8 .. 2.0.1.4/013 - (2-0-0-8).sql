
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
Create PROCEDURE [dbo].[GetTransactionById] 
@TransactionId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Transactions
	WHERE (Transactions.Active = 1) AND
	(Transactions.TransactionId = @TransactionId)
END
