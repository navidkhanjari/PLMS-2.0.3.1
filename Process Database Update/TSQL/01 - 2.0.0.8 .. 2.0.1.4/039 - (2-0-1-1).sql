USE [Log]
GO

/****** Object:  Table [dbo].[Costs]    Script Date: 12/31/2016 02:31:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Costs](
	[CostId] [int] IDENTITY(1,1) NOT NULL,
	[CostCenterId] [int] NULL,
	[AccountId] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[Cost] [decimal](18, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Costs] PRIMARY KEY CLUSTERED 
(
	[CostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Costs]  WITH CHECK ADD  CONSTRAINT [FK_Costs_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Costs] CHECK CONSTRAINT [FK_Costs_Accounts]
GO

ALTER TABLE [dbo].[Costs]  WITH CHECK ADD  CONSTRAINT [FK_Costs_CostCenters] FOREIGN KEY([CostCenterId])
REFERENCES [dbo].[CostCenters] ([CostCenterId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Costs] CHECK CONSTRAINT [FK_Costs_CostCenters]
GO

ALTER TABLE [dbo].[Costs] ADD  CONSTRAINT [DF_Costs_Active]  DEFAULT ((1)) FOR [Active]
GO


