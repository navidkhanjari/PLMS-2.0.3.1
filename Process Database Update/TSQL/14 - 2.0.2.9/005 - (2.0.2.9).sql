USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[AddNewMessage]    Script Date: 10/29/2021 5:41:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[EditMessage] 
	@MessageId			DECIMAL(18, 0),
	@Type				INT,
	@Reference			NVARCHAR(50),
	@ReferenceId		INT,
	@Value				NVARCHAR(50),
	@DefaultId			NVARCHAR(50),
	@Parameter1			NVARCHAR(100),
	@Parameter2			NVARCHAR(100),
	@Parameter3			NVARCHAR(100),
	@Parameter4			NVARCHAR(100),
	@Parameter5			NVARCHAR(100),
	@Parameter6			NVARCHAR(100),
	@Parameter7			NVARCHAR(100),
	@Parameter8			NVARCHAR(100),
	@Mobile				NVARCHAR(50),
	@GenerateDate		NVARCHAR(10),
	@GenerateTime		NVARCHAR(8),
	@ExpireDate			NVARCHAR(10),
	@Expired			BIT,
	@Sent				BIT,
	@SentDate			NVARCHAR(10),
	@SentTime			NVARCHAR(8),
	@SentReferenceId	NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE Messages SET
	Type = @Type, 
	Reference = @Reference, 
	ReferenceId = @ReferenceId, 
	Value = @Value, 
	DefaultId = @DefaultId, 
	Parameter1 = @Parameter1, 
	Parameter2 = @Parameter2, 
	Parameter3 = @Parameter3, 
	Parameter4 = @Parameter4, 
	Parameter5 = @Parameter5, 
	Parameter6 = @Parameter6,
	Parameter7 = @Parameter7, 
	Parameter8 = @Parameter8, 
	Mobile=@Mobile, 
	GenerateDate = @GenerateDate, 
	GenerateTime = @GenerateTime, 
	ExpireDate = @ExpireDate, 
	Expired = @Expired,
	Sent = @Sent, 
	SentDate = @SentDate, 
	SentTime = @SentTime, 
	SentReferenceId = @SentReferenceId
	WHERE MessageId = @MessageId;
END
