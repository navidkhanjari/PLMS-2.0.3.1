USE [Log]
GO

/****** Object:  Table [dbo].[FingerPrints]    Script Date: 7/6/2019 10:42:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FingerPrints](
	[FingerPrintId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Data] [nvarchar](1024) NOT NULL,
	[Quality] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_FingerPrints] PRIMARY KEY CLUSTERED 
(
	[FingerPrintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FingerPrints] ADD  CONSTRAINT [DF_FingerPrints_Active]  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[FingerPrints]  WITH CHECK ADD  CONSTRAINT [FK_FingerPrints_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[FingerPrints] CHECK CONSTRAINT [FK_FingerPrints_Members]
GO


