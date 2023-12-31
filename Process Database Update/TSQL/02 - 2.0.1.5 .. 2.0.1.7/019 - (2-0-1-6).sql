USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetTickets]    Script Date: 10/24/2018 12:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetTickets] 
@TicketId decimal(18, 0) = null,
@CardId nvarchar(50) = null,
@Gender bit = null,
@FullName nvarchar(50)= null,
@AccountId int = null,
@Sport NVARCHAR(50) = null,
@Coach NVARCHAR(50) = null,
@PlanningId int = null,
@StartDate nvarchar(50) = null,
@DateOut nvarchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT  
	dbo.Tickets.*, 
	(dbo.Tickets.Cost - dbo.Tickets.Discount ) AS FinalCost,
	dbo.GetGenderTitle(dbo.Tickets.Gender) AS GenderTitle, 
	dbo.Tickets.Date + ' ' + dbo.Tickets.Time AS DateTime,
	dbo.Plannings.Coach,
	dbo.Plannings.Sport,
	 dbo.Plannings.Sport + ' [' + dbo.Plannings.Coach + ' / ' + dbo.Plannings.Title + ']' AS PlanningTitle
	FROM    dbo.Plannings 
	INNER JOIN  dbo.Tickets ON dbo.Plannings.PlanningId = dbo.Tickets.PlanningId
	WHERE Tickets.Active = 1 AND
	Tickets.TicketId = COALESCE(@TicketId, Tickets.TicketId) AND
	Tickets.CardId = COALESCE(@CardId, Tickets.CardId) AND
	Tickets.Gender = COALESCE(@Gender, Tickets.Gender) AND
	Tickets.FullName LIKE '%' + COALESCE(@FullName, Tickets.FullName) + '%' AND
	Tickets.AccountId = COALESCE(@AccountId, Tickets.AccountId) AND	
	Tickets.PlanningId = COALESCE(@PlanningId, Tickets.PlanningId) AND
	Plannings.Coach = COALESCE(@Coach, Plannings.Coach) AND
	Plannings.Sport = COALESCE(@Sport, Plannings.Sport) AND
	Tickets.Date >= COALESCE(@StartDate, Tickets.Date) AND 
	Tickets.Date <= COALESCE(@DateOut, Tickets.Date)
	ORDER BY dbo.Tickets.Date DESC, dbo.Tickets.Time DESC
			
END
