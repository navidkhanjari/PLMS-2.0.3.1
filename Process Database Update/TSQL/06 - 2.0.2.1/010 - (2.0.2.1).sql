USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[AddNewMessage] 
@Text nvarchar(300),
@Mobile nvarchar(50),
@Date nvarchar(50),
@ExpireDate nvarchar(10),
@Type int,
@DataField1 nvarchar(50),
@DataField2 nvarchar(50),
@DataField3 nvarchar(50),
@Place bit
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Messages (Text,Mobile,Date, [ExpireDate],Type,DataField1,DataField2,DataField3,Place) 
	VALUES               (@Text,@Mobile,@Date, @ExpireDate,@Type,@DataField1,@DataField2,@DataField3,@Place);
	SELECT @@IDENTITY AS 'MessageId';
END
