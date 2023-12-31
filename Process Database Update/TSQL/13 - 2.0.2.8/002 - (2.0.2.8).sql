USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetLockHistories]    Script Date: 7/17/2021 11:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Process co
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetLockHistories] 

            @CardID nvarchar(10)= null,
            @FirstName nvarchar(50)= null,
            @LastName nvarchar(50)= null,
            @Gender bit = null,
            @Category nvarchar(50)= null,
            @LockID int = null,
            @Type bit= null,
            @StartDate nvarchar(10)= null,
            @LastDate nvarchar(10)= null,
            @HoursFrom nvarchar(8) = null,
            @HoursTo nvarchar(8) = null,
			@Busy	bit = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		SELECT
			dbo.LockHistories.LockHistoryID,
			dbo.Members.CardId,
			dbo.GetGenderTitle(dbo.Members.gender) AS gender,
			dbo.Members.FirstName + ' ' + dbo.Members.LastName AS Fullname ,
			dbo.Locks.Category,
			dbo.Locks.Number,
			dbo.GetDeliveryTitle(dbo.LockHistories.Type) AS Type,
			dbo.LockHistories.Date,
			dbo.LockHistories.Time,
			dbo.Locks.Busy,
			dbo.Locks.LockID
		FROM dbo.LockHistories
		INNER JOIN dbo.Members ON dbo.LockHistories.MemberID = dbo.Members.MemberId
		INNER JOIN dbo.Locks ON dbo.LockHistories.LockID = dbo.Locks.LockID

    -- Insert statements for procedure here
	 WHERE
		 dbo.Members.Active = 1 AND dbo.Locks.Active = 1 AND
		 dbo.Members.CardId = COALESCE(@CardID, dbo.Members.CardId)										AND
		 dbo.Members.FirstName = COALESCE(@FirstName, dbo.Members.FirstName)							AND
		 dbo.Members.LastName = COALESCE(@LastName, dbo.Members.LastName)								AND
		 dbo.Members.Gender = COALESCE(@Gender, dbo.Members.Gender)										AND
		 dbo.Locks.Category = COALESCE(@Category, dbo.Locks.Category)									AND
		 dbo.LockHistories.LockID = COALESCE(@LockID,  dbo.LockHistories.LockID)						AND
		 dbo.LockHistories.Type = COALESCE(@Type, dbo.LockHistories.Type)						AND
		 dbo.LockHistories.Date >= COALESCE(@StartDate, dbo.LockHistories.Date)							AND
		 dbo.LockHistories.Date <= COALESCE(@LastDate, dbo.LockHistories.Date)							AND
		 dbo.LockHistories.Time >= COALESCE(@HoursFrom, dbo.LockHistories.Time)							AND
		 dbo.LockHistories.Time <= COALESCE(@HoursTo, dbo.LockHistories.Time)							AND
		 dbo.Locks.Busy			 = COALESCE(@Busy, dbo.Locks.Busy)
	 ORDER BY dbo.LockHistories.Date , dbo.LockHistories.Time , dbo.Locks.Category , dbo.Locks.Number						
END
