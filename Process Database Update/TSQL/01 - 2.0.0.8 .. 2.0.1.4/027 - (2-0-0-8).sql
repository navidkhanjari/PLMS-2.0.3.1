USE [LOG]
GO
/****** Object:  StoredProcedure [dbo].[EditPerson]    Script Date: 10/22/2016 00:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process Co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[EditPerson] 
@PersonId int, 
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

	UPDATE People SET	FirstName=@FirstName, 
						LastName=@LastName, 
						Gender=@Gender, 
						JobTitle=@JobTitle, 
						Mobile=@Mobile, 
						HomePhone=@HomePhone,
						Email=@Email,
						[Description]=@Description, 
						Picture=@Picture
	WHERE PersonId=@PersonId
END
