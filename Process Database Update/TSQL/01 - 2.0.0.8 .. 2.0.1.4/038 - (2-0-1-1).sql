USE [Log]
GO

/****** Object:  Table [dbo].[CostCenters]    Script Date: 12/03/2016 20:54:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CostCenters](
	[CostCenterId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_CostCenterss] PRIMARY KEY CLUSTERED 
(
	[CostCenterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CostCenters] ADD  CONSTRAINT [DF_CostCenters_Active]  DEFAULT ((1)) FOR [Active]
GO


