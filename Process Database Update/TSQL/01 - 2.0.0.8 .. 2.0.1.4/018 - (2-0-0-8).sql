USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewMember]    Script Date: 10/12/2016 00:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process Co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[AddNewMember] 
@CardId nvarchar(50),
@FirstName nvarchar(50),
@LastName  nvarchar(50),
@BirthDay  nvarchar(50),
@Enabled  Bit,
@MarriageDate nvarchar(50),
@NationalId  nvarchar(50),
@Gender bit,
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
@Date  nvarchar(10)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Members (CardId,FirstName,LastName,BirthDay, MarriageDate,NationalId,Gender,Enabled,Picture,JobTitle,HomePhone,Mobile,Address,Reagent,Description,FatherName,Email,Insurance,ExpirationDate,Date)
	VALUES (@CardId,@FirstName,@LastName,@BirthDay, @MarriageDate,@NationalId,@Gender,@Enabled,@Picture,@JobTitle,@HomePhone,@Mobile,@Address,@Reagent,@Description,@FatherName,@Email,@Insurance,@ExpirationDate,@Date);
	SELECT @@IDENTITY AS 'MemberId';
END
