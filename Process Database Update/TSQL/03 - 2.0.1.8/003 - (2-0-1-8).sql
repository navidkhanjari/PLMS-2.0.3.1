USE [Log]
GO
/****** Object:  Table [dbo].[Keys]    Script Date: 4/14/2019 12:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keys](
	[LockID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
 CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED 
(
	[LockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Keys]  WITH CHECK ADD  CONSTRAINT [FK_Keys_Locks] FOREIGN KEY([LockID])
REFERENCES [dbo].[Locks] ([LockID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Keys] CHECK CONSTRAINT [FK_Keys_Locks]
GO
ALTER TABLE [dbo].[Keys]  WITH CHECK ADD  CONSTRAINT [FK_Keys_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Keys] CHECK CONSTRAINT [FK_Keys_Members]
GO
