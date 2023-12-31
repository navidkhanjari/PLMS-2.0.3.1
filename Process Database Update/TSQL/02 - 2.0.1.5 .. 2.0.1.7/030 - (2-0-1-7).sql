USE [Log]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMemberDebtorStatus]    Script Date: 12/17/2018 5:02:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER FUNCTION [dbo].[GetMemberDebtorStatus]
(
	@MemberId int
)
RETURNS nvarchar(50)
AS
BEGIN
	DECLARE @Debtor decimal(18, 0)
	SET @Debtor = dbo.GetMemberDebtorValue(@MemberId)
	If @Debtor = 0
	 RETURN N'بیحساب'	 
	ELSE IF @Debtor > 0 
	 RETURN N'بستانکار'
	ELSE 
	 RETURN N'بدهکار'
	RETURN '';
END
