USE[LOG]

GO

ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Groups]
GO

