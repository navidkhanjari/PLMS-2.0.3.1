USE [Log]
GO
/****** Object:  StoredProcedure [dbo].[GetRegisters]    Script Date: 6/14/2022 1:40:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetRegisters] 
	@MemberID int = null,
	@CardId nvarchar(50) = null,
	
	@FirstName nvarchar(50) = null,
	@LastName nvarchar(50) = null,	
	@Gender bit = null,
	
	@SalonId int = null,
	@Coach		NVARCHAR(50) = NULL,
	@Sport		NVARCHAR(50) = NULL,
	@PlanningId int = null,	
	@Validation nvarchar(50) = null,
	
	@ToDay nvarchar(50) = null,
	
	@RegisterDateFrom nvarchar(50) = null,
	@RegisterDateTo nvarchar(50) = null,
	
	@StartDateFrom nvarchar(50) = null,
	@StartDateTo nvarchar(50) = null,
	
	@ExpireDateFrom nvarchar(50) = null,
	@ExpireDateTo nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @StrSql Nvarchar(MAX);
	set @StrSql = 'SELECT dbo.Registers.registerId, dbo.GetGenderTitle(dbo.Members.Gender) AS gender, dbo.Members.CardId, dbo.Members.FirstName + '' '' + dbo.Members.LastName AS fullname, dbo.GetMemberDebtorStatus(dbo.Members.MemberId) As Status, dbo.GetUsedSessions(dbo.Registers.RegisterId) AS UsedSessions, ';
	set @StrSql = @StrSql + 'dbo.Registers.RegisterDate, dbo.Registers.Startdate, dbo.Registers.Dateout, dbo.Registers.LogDate, dbo.Registers.SessionCount, dbo.Registers.Number,dbo.GetValidityTitle(dbo.Plannings.Validity) AS validityType, dbo.Plannings.Sport + '' ['' + dbo.Plannings.Coach  + '' / '' + dbo.Plannings.Title +'']'' AS Title, dbo.Salons.Title AS salonTitle,dbo.Registers.Cost , dbo.Registers.CoachDiscount, dbo.Registers.ClubDiscount, dbo.Registers.Cost - dbo.Registers.Discount AS price,  CONVERT(INT, (dbo.Registers.Cost) -  (dbo.Registers.Cost) * [Percent] / 100 - dbo.Registers.ClubDiscount) AS [Company] ,CONVERT(INT, (dbo.Registers.Cost) * [Percent] / 100 - dbo.Registers.CoachDiscount) AS [Percent] , dbo.Registers.Discount, dbo.RegisterIsValidate(''' + @ToDay + ''', dbo.Registers.StartDate, dbo.Registers.Dateout, dbo.Registers.SessionCount, dbo.Plannings.Validity) As Validation FROM dbo.Registers ';
	set @StrSql = @StrSql + 'INNER JOIN	dbo.Plannings ON dbo.Registers.PlanningId = dbo.Plannings.PlanningId '; 
	set @StrSql = @StrSql + 'INNER JOIN	dbo.Salons ON dbo.Plannings.SalonId = dbo.Salons.SalonId ';
    set @StrSql = @StrSql + 'INNER JOIN	dbo.Members ON dbo.Registers.MemberId = dbo.Members.MemberId ';
	set @StrSql = @StrSql + 'WHERE (dbo.Registers.Active = 1) AND  (dbo.Members.Active = 1) ';

	if (@MemberID IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Members.MemberID = '+ convert(nvarchar(100), @MemberID)  +')';

	if (@CardId IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Members.CardId = N'''+ @CardId +''')';
	if (@FirstName IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Members.FirstName LIKE N''%'+ @FirstName +'%'')';
	if (@LastName IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Members.LastName LIKE N''%'+ @LastName +'%'')';
		
	if (@Gender = 0)
		Set @StrSql = @StrSql + ' AND (dbo.Members.Gender = 0)';
		
	if (@Gender = 1)
		Set @StrSql = @StrSql + ' AND (dbo.Members.Gender = 1)';	
	
	if (@RegisterDateFrom IS NOT NULL AND @RegisterDateTo IS NOT NULL)
		Set @StrSql = @StrSql + ' AND (dbo.Registers.RegisterDate  BETWEEN ''' + @RegisterDateFrom + ''' AND ''' + @RegisterDateTo + ''') ';	
	
	if (@StartDateFrom IS NOT NULL AND @StartDateTo IS NOT NULL)
		Set @StrSql = @StrSql + ' AND (dbo.Registers.Startdate  BETWEEN ''' + @StartDateFrom + ''' AND ''' + @StartDateTo + ''') ';	
	
	if (@StartDateFrom IS NOT NULL AND @StartDateTo IS NULL)
		Set @StrSql = @StrSql + ' AND (dbo.Registers.Startdate <= ''' + @StartDateFrom + ''') AND (dbo.Registers.Dateout >= ''' + @StartDateFrom + ''') ';


	if (@ExpireDateFrom IS NOT NULL AND @ExpireDateTo IS NOT NULL)
		Set @StrSql = @StrSql + ' AND (dbo.Registers.Dateout  BETWEEN ''' + @ExpireDateFrom + ''' AND ''' + @ExpireDateTo + ''') ';	

	if (@SalonId IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Salons.SalonId = '+ convert(nvarchar(100), @SalonId) +')';
	
	if (@PlanningId IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Plannings.PlanningId	 = '+ convert(nvarchar(100), @PlanningId) +')';
	
	if (@Coach IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Plannings.Coach	 = N'''+ @Coach +''')';

	if (@Sport IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.Plannings.Sport	 = N'''+ @Sport +''')';

	if (@Validation IS NOT NULL)
		set @StrSql = @StrSql + 'AND (dbo.RegisterIsValidate(''' + @ToDay + ''', dbo.Registers.StartDate, dbo.Registers.Dateout, dbo.Registers.SessionCount, dbo.Plannings.Validity)  = N'''+ @Validation +''')';

	set @StrSql = @StrSql + ' ORDER BY dbo.Registers.RegisterDate ASC';
	EXECUTE sp_executesql @StrSql;
END

 
	