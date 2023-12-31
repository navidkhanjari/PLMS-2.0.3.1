USE [LOG]
GO
/****** Object:  StoredProcedure [dbo].[GetPeople]    Script Date: 10/21/2016 23:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetPeople] 
	@Firstname nvarchar(50) = Null,
	@Lastname nvarchar(50) = Null,
	@Gender bit = Null
AS
BEGIN
	SET NOCOUNT ON;	
	SELECT	PersonId, 
			dbo.GetGenderTitle(Gender) AS Gender, 
			FirstName+' '+LastName AS FullName, 
			Mobile, 
			Picture
	FROM People
	WHERE	Active = 1
			AND FirstName LIKE '%' + COALESCE(@Firstname, FirstName) + '%'
			AND LastName LIKE '%' + COALESCE(@Lastname, LastName) + '%'
			AND Gender = COALESCE(@Gender, Gender)	
	ORDER BY LastName ASC, FirstName ASC				
END
