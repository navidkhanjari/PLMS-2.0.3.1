USE [Log]
GO

/****** Object:  Table [dbo].[LockHistories]    Script Date: 05/05/2019 11:24:25 ق.ظ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LockHistories](
	[LockHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[LockID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Date] [nvarchar](10) NOT NULL,
	[Time] [nvarchar](8) NOT NULL,
	[Type] [bit] NOT NULL,
 CONSTRAINT [PK_LockHistories] PRIMARY KEY CLUSTERED 
(
	[LockHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LockHistories]  WITH CHECK ADD  CONSTRAINT [FK_LockHistories_Locks] FOREIGN KEY([LockID])
REFERENCES [dbo].[Locks] ([LockID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[LockHistories] CHECK CONSTRAINT [FK_LockHistories_Locks]
GO

ALTER TABLE [dbo].[LockHistories]  WITH CHECK ADD  CONSTRAINT [FK_LockHistories_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[LockHistories] CHECK CONSTRAINT [FK_LockHistories_Members]
GO


