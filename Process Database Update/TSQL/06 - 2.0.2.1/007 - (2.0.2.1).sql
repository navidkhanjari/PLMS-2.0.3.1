USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetTransactions] 
	@MemberID int = null,
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
					dbo.Transactions.Date,
					CASE dbo.Transactions.Type WHEN 1 THEN N'پرداخت' ELSE N'دریافت' END AS TransactionType, 
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
				  AND dbo.Members.MemberId = COALESCE(@MemberID, dbo.Members.MemberID)
		ORDER BY dbo.Transactions.Date  ASC, dbo.Transactions.Time ASC
	else 
		SELECT		dbo.Transactions.TransactionId,
					dbo.Members.CardId, 
					dbo.Members.FirstName + ' ' + dbo.Members.LastName AS fullName, 
					dbo.Transactions.Date + ' ' + dbo.Transactions.Time AS dateTime, 
					dbo.Transactions.Date,
					CASE dbo.Transactions.Type WHEN 1 THEN N'پرداخت' ELSE N'دریافت' END AS TransactionType, 
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
				  AND dbo.Members.MemberId = COALESCE(@MemberID, dbo.Members.MemberID)
		ORDER BY dbo.Transactions.Date  ASC, dbo.Transactions.Time ASC		 	
END
