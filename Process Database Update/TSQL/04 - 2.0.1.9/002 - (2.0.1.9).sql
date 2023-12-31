USE [Log]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewFingerPrint] 
@MemberId	INT,
@Number		INT,
@Data		NVARCHAR(1024),
@Quality	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO FingerPrints (MemberId, Number, Data, Quality) VALUES (@MemberId, @Number, @Data, @Quality);

	SELECT @@IDENTITY AS 'FingerPrintId';
END
