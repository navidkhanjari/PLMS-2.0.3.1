USE [Log]
GO

/****** Object:  Table [dbo].[Sales]    Script Date: 01/10/2017 10:02:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sales](
	[SaleId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[Time] [nvarchar](50) NULL,
	[Cost] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Members]
GO

ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_Active]  DEFAULT ((1)) FOR [Active]
GO

