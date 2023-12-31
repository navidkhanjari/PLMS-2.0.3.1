USE [Log]
GO
/****** Object:  Table [dbo].[LockSalons]    Script Date: 4/14/2019 12:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LockSalons](
	[SalonID] [int] NOT NULL,
	[LockID] [int] NOT NULL,
 CONSTRAINT [PK_LockSalons] PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC,
	[LockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[LockSalons]  WITH CHECK ADD  CONSTRAINT [FK_LockSalons_Locks] FOREIGN KEY([LockID])
REFERENCES [dbo].[Locks] ([LockID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LockSalons] CHECK CONSTRAINT [FK_LockSalons_Locks]
GO
ALTER TABLE [dbo].[LockSalons]  WITH CHECK ADD  CONSTRAINT [FK_LockSalons_Salons] FOREIGN KEY([SalonID])
REFERENCES [dbo].[Salons] ([SalonId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LockSalons] CHECK CONSTRAINT [FK_LockSalons_Salons]
GO
