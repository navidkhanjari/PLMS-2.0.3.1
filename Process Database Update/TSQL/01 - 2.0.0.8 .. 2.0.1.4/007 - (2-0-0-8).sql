use[log]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetTransactions] 
	-- Add the parameters for the stored procedure here
	@Date nvarchar(50) = Null,
	@Firstname nvarchar(50) = Null,
	@Lastname nvarchar(50) = Null,
	@CardId nvarchar(50) = Null,
	@Gender bit = Null,
	@AccountId int = NULL,
	@TransactionType bit = NULL,
	@StartDate nvarchar(50) = Null,
	@DateOut nvarchar(50) = Null
AS
BEGIN
	SET NOCOUNT ON;
	IF @StartDate IS NOT NULL
		SELECT		dbo.Transactions.TransactionId,
					dbo.Members.CardId, 
					dbo.Members.FirstName + ' ' + dbo.Members.LastName AS fullName, 
					dbo.Transactions.Date + ' ' + dbo.Transactions.Time AS dateTime, 
					CASE dbo.Transactions.Type WHEN 1 THEN N'پرداخت' ELSE N'برداشت' END AS TransactionType, 
					dbo.Accounts.Title AS accountTitle, 
					dbo.Transactions.Price,
					dbo.Transactions.Description
		FROM		dbo.Accounts 
					INNER JOIN dbo.Transactions ON dbo.Accounts.AccountId = dbo.Transactions.AccountId 
					INNER JOIN dbo.Members ON dbo.Transactions.MemberId = dbo.Members.MemberId
		WHERE     (dbo.Accounts.Active = 1) AND (dbo.Transactions.Active = 1) AND (dbo.Members.Active = 1)
				  AND dbo.Transactions.Date >= @StartDate AND dbo.Transactions.Date <= @DateOut
				  AND dbo.Members.FirstName = COALESCE(@Firstname, dbo.Members.FirstName)
				  AND dbo.Members.LastName = COALESCE(@Lastname, dbo.Members.LastName)
				  AND dbo.Members.CardId = COALESCE(@CardId, dbo.Members.CardId)
				  AND dbo.Members.Gender = COALESCE(@Gender, dbo.Members.Gender)
				  AND dbo.Transactions.Type = COALESCE(@TransactionType, dbo.Transactions.Type)
				  AND dbo.Accounts.AccountId = COALESCE(@AccountId, dbo.Accounts.AccountId)
		ORDER BY dbo.Transactions.Date DESC, dbo.Transactions.Time DESC, Members.LastName ASC
	else 
		SELECT		dbo.Transactions.TransactionId,
					dbo.Members.CardId, 
					dbo.Members.FirstName + ' ' + dbo.Members.LastName AS fullName, 
					dbo.Transactions.Date + ' ' + dbo.Transactions.Time AS dateTime, 
					CASE dbo.Transactions.Type WHEN 1 THEN N'پرداخت' ELSE N'برداشت' END AS TransactionType, 
					dbo.Accounts.Title AS accountTitle, 
					dbo.Transactions.Price,
					dbo.Transactions.Description
		FROM		dbo.Accounts 
					INNER JOIN dbo.Transactions ON dbo.Accounts.AccountId = dbo.Transactions.AccountId 
					INNER JOIN dbo.Members ON dbo.Transactions.MemberId = dbo.Members.MemberId
		WHERE     (dbo.Accounts.Active = 1) AND (dbo.Transactions.Active = 1) AND (dbo.Members.Active = 1)
				  AND dbo.Members.FirstName = COALESCE(@Firstname, dbo.Members.FirstName)
				  AND dbo.Members.LastName = COALESCE(@Lastname, dbo.Members.LastName)
				  AND dbo.Members.CardId = COALESCE(@CardId, dbo.Members.CardId)
				  AND dbo.Members.Gender = COALESCE(@Gender, dbo.Members.Gender)
				  AND dbo.Transactions.Type = COALESCE(@TransactionType, dbo.Transactions.Type)
				  AND dbo.Accounts.AccountId = COALESCE(@AccountId, dbo.Accounts.AccountId)
		ORDER BY dbo.Transactions.Date DESC, dbo.Transactions.Time DESC, Members.LastName ASC		 
	
END
