USE [LOG]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMemberValidtion]    Script Date: 11/06/2016 16:49:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[RegisterIsValidate]
(
	@Date nvarchar(50),
	@Startdate nvarchar(50) = Null,
	@Dateout   nvarchar(50) = Null,
	@SessionCount INT = 0,
	@Validity INT = 0
)
RETURNS nvarchar(50)
AS
BEGIN
		IF (@SessionCount > 0    AND 
		    @Validity   <> -1    AND
		    @Startdate  <= @Date AND 
		    @Dateout    >= @Date)
		RETURN N'معتبر';
	RETURN N'نامعتبر';
END
