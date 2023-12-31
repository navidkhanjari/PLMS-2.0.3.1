USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[EditMember]    Script Date: 12/05/2016 16:58:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[EditMember] 
@CardId nvarchar(50),
@LogCardId nvarchar(50),
@FirstName nvarchar(50),
@LastName  nvarchar(50),
@BirthDay  nvarchar(50),
@MarriageDate nvarchar(50),
@NationalId  nvarchar(50),
@Gender bit,
@Enabled  Bit,
@Picture image,
@JobTitle  nvarchar(50),
@HomePhone  nvarchar(50),
@Mobile  nvarchar(50),
@Address  nvarchar(MAX),
@Reagent  nvarchar(50),
@Description  nvarchar(MAX),
@FatherName  nvarchar(50),
@Email  nvarchar(200),
@Insurance  nvarchar(50),
@ExpirationDate  nvarchar(50),
@MemberId int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Members SET CardId=@CardId,LogCardId=@LogCardId,FirstName=@FirstName,LastName=@LastName,BirthDay=@BirthDay,MarriageDate=@MarriageDate,NationalId=@NationalId,Gender=@Gender,
    Picture=@Picture,Enabled=@Enabled,JobTitle=@JobTitle,HomePhone=@HomePhone,Mobile=@Mobile,Address=@Address,Reagent=@Reagent,Description=@Description, FatherName=@FatherName,Email=@Email,
	Insurance=@Insurance,ExpirationDate=@ExpirationDate WHERE MemberId=@MemberId
END
