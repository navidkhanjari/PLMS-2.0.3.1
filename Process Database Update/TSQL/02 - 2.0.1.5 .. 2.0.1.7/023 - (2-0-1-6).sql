USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewTransaction]    Script Date: 12/15/2018 12:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[EditTransaction] 
@TransactionId decimal(18, 0),
@AccountId int,
@UserName varchar(50),
@Price int,
@Date nvarchar(50),
@Time nvarchar(50),
@Description nvarchar(MAX),
@Type bit
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE Transactions SET [AccountId] = @AccountId, [UserName] = @UserName, [Price] = @Price, [Date] = @Date, [Time] = @Time, [Type] = @Type, [Description] = @Description WHERE [TransactionId] =@TransactionId;   
END
