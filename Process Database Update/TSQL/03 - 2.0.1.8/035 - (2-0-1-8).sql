USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewPerson]    Script Date: 05/11/2019 01:50:44 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process Co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[AddNewPerson] 
@FirstName nvarchar(50),
@LastName  nvarchar(50),
@Gender bit,
@JobTitle  nvarchar(50),
@Mobile  nvarchar(50),
@HomePhone  nvarchar(50),
@Email  nvarchar(200),
@Description  nvarchar(MAX),
@Picture image
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO People (FirstName,LastName,Gender,JobTitle,Mobile,HomePhone,Email,[Description],Picture)
	VALUES (@FirstName,@LastName,@Gender, @JobTitle, @Mobile, @HomePhone, @Email, @Description, @Picture);

		SELECT @@IDENTITY AS 'PersonId';
END
