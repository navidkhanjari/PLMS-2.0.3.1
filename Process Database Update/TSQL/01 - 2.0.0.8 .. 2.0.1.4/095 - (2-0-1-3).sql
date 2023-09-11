USE [Log]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Plans]
(
	[PlanId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[RegisterDate] [nvarchar](10) NOT NULL,
	[SportHistory] [int] NOT NULL,
	[SportHistoryDescription] [nvarchar](max) NOT NULL,
	[SupplementHistory] [bit] NOT NULL,
	[SupplementDescription] [nvarchar](max) NOT NULL,
	[ChangeWeightHistory] [bit] NOT NULL,
	[ChangeWeightDescription] [nvarchar](max) NOT NULL,
	[UseSupplement] [bit] NOT NULL,
	[UseSupplementDescription] [nvarchar](max) NOT NULL,
	[Target] [nvarchar](max) NOT NULL,
	[TargetDescription] [nvarchar](max) NOT NULL,
	[Length] [int] NOT NULL,
	[Weigh] [int] NOT NULL,
	[ShoulderSize] [int] NOT NULL,	
	[NeckSize] [int] NOT NULL,
	[LumbarSize] [int] NOT NULL,
	[ChestSize] [int] NOT NULL,
	[RightArmSize] [int] NOT NULL,
	[LeftArmSize] [int] NOT NULL,
	[RightForearmSize] [int] NOT NULL,
	[LeftForearmSize] [int] NOT NULL,
	[RightHipSize] [int] NOT NULL,
	[LeftHipSize] [int] NOT NULL,
	[RightThighSize] [int] NOT NULL,
	[LeftThighSize] [int] NOT NULL,
	[RightLegSize] [int] NOT NULL,
	[LeftLegSize] [int] NOT NULL,
	[RightWristSize] [int] NOT NULL,
	[LeftWristSize] [int] NOT NULL,
	[HeartBeat] [int] NOT NULL,
	[BloodPressure] [int] NOT NULL,
	[BloodGlucose] [int] NOT NULL,
	[BloodFat] [int] NOT NULL,
	[Metabolism] [int] NOT NULL,
	[TotalBodyWater] [int] NOT NULL,
	[SizeDescription] [nvarchar](max) NOT NULL,
	[SicknessHistory] [bit] NOT NULL,
	[SicknessHistoryDescription] [nvarchar](max) NOT NULL,
	[UseSicknessType] [nvarchar](max) NOT NULL,
	[FoodSensitivity] [bit] NOT NULL,
	[FoodSensitivityDescription] [nvarchar](max) NOT NULL,
	[SicknessDescription] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Picture1] [image] NULL,
	[Picture2] [image] NULL,
	[Picture3] [image] NULL,
	[Picture4] [image] NULL,
	[Picture5] [image] NULL,
	[Picture6] [image] NULL,
	[Picture7] [image] NULL,
	[Picture8] [image] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Plans] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Plans] ADD  CONSTRAINT [DF_Plan_Active]  DEFAULT ((1)) FOR [Active]
GO

ALTER TABLE [dbo].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Plans] CHECK CONSTRAINT [FK_Plan_Members]
GO


