USE [Log]
GO

/****** Object:  Table [dbo].[Messages]    Script Date: 9/27/2021 1:18:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Messages](
	[MessageId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Reference] [nvarchar](50) NOT NULL,
	[ReferenceId] [int] NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[DefaultId] [nvarchar](50) NOT NULL,
	[Parameter1] [nvarchar](100) NOT NULL,
	[Parameter2] [nvarchar](100) NOT NULL,
	[Parameter3] [nvarchar](100) NOT NULL,
	[Parameter4] [nvarchar](100) NOT NULL,
	[Parameter5] [nvarchar](100) NOT NULL,
	[Parameter6] [nvarchar](100) NOT NULL,
	[Parameter7] [nvarchar](100) NOT NULL,
	[Parameter8] [nvarchar](100) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[GenerateDate] [nvarchar](10) NOT NULL,
	[GenerateTime] [nvarchar](8) NOT NULL,
	[ExpireDate] [nvarchar](10) NOT NULL,
	[Expired] [bit] NOT NULL,
	[Sent] [bit] NOT NULL,
	[SentDate] [nvarchar](50) NOT NULL,
	[SentTime] [nvarchar](8) NOT NULL,
	[SentReferenceId] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_Active]  DEFAULT ((1)) FOR [Active]
GO


