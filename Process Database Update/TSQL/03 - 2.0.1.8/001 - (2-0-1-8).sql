USE [Log]
GO

/****** Object:  Table [dbo].[Locks]    Script Date: 4/14/2019 3:58:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Locks](
	[LockID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Number] [int] NOT NULL,
	[Port] [nvarchar](50) NOT NULL,
	[Address] [int] NOT NULL,
	[Relay] [int] NOT NULL,
	[Busy] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Locks] PRIMARY KEY CLUSTERED 
(
	[LockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Locks] ADD  CONSTRAINT [DF_Locks_Active]  DEFAULT ((1)) FOR [Active]
GO


