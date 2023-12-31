USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EditMessage] 
@MessageId decimal,
@Mobile nvarchar(50),
@Text nvarchar(300),
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

	UPDATE Messages  SET Text=@Text,
				     Mobile=@Mobile,
	                 Date=@Date,
	                 ExpireDate=@ExpireDate,
	                 Type=@Type,
	                 DataField1=@DataField1,
	                 DataField2=@DataField2,
	                 DataField3=@DataField3,
	                 Place=@Place 
	WHERE MessageId=@MessageId
END
