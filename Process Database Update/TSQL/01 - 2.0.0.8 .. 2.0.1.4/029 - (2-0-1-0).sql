USE [Log]
GO

/****** Object:  Table [dbo].[DeliveryLockers]    Script Date: 11/10/2016 12:42:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DeliveryLockers](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[LockerId] [int] NULL,
	[DeliveredDate] [nvarchar](10) NULL,
	[DeliveredTime] [nvarchar](8) NULL,
	[ReceivedDate] [nvarchar](10) NULL,
	[ReceivedTime] [nvarchar](8) NULL,
 CONSTRAINT [PK_Locker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DeliveryLockers]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryLockers_Lockers] FOREIGN KEY([LockerId])
REFERENCES [dbo].[Lockers] ([LockerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[DeliveryLockers] CHECK CONSTRAINT [FK_DeliveryLockers_Lockers]
GO

ALTER TABLE [dbo].[DeliveryLockers]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryLockers_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[DeliveryLockers] CHECK CONSTRAINT [FK_DeliveryLockers_Members]
GO


