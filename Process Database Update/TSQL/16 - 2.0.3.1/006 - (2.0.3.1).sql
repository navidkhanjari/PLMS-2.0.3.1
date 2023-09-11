USE[LOG]

GO

ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Presentations] FOREIGN KEY([PresentationID])
REFERENCES [dbo].[Presentations] ([PresentationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Presentations]
GO

