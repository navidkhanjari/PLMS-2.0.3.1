USE [Log]
GO

/****** Object:  Table [dbo].[SaleLineItems]    Script Date: 01/10/2017 10:02:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SaleLineItems](
	[SaleLineItemId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[SaleId] [decimal](18, 0) NULL,
	[ProductId] [int] NULL,
	[Count] [int] NULL,
	[Cost] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SaleLineItems] PRIMARY KEY CLUSTERED 
(
	[SaleLineItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SaleLineItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleLineItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SaleLineItems] CHECK CONSTRAINT [FK_SaleLineItems_Products]
GO

ALTER TABLE [dbo].[SaleLineItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleLineItems_Sales] FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sales] ([SaleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SaleLineItems] CHECK CONSTRAINT [FK_SaleLineItems_Sales]
GO


