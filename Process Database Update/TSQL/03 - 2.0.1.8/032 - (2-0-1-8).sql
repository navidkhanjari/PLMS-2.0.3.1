USE [Log]
GO

/****** Object:  Table [dbo].[Activities]    Script Date: 05/08/2019 06:14:21 ب.ظ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Activities](
	[ID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[RecordID] [decimal](18, 0) NULL,
	[Details] [nvarchar](512) NULL,
	[Type] [int] NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Time] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Log_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Log_Users]
GO


