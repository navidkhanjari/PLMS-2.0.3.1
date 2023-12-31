use[log]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetMembers]
	@Date nvarchar(50) = Null,	
	@Firstname nvarchar(50) = Null,
	@Lastname nvarchar(50) = Null,
	@Reagent nvarchar(50) = Null,
	@JobTitle nvarchar(50) = Null,
	@CardId nvarchar(50) = Null,
	@NationalId nvarchar(50) = Null,
	@MemberId int = Null,	
	@Gender bit = Null,	
	@MarriageDate nvarchar(50) = Null,
	
	@StartBirthDay nvarchar(50) = Null,
	@EndBirthDay nvarchar(50) = Null,	
	
	@StartInsurance nvarchar(50) = Null,
	@EndInsurance nvarchar(50) = Null,

	@ExpireStartDate nvarchar(50) = Null,
	@ExpireEndDate   nvarchar(50) = Null,
		
	@RegisterStartDate nvarchar(50) = Null,
	@RegisterEndDate   nvarchar(50) = Null,
		
	@Validation nvarchar(50) = NULL,
	@Debtor nvarchar(50) = NULL,
	@Insurance nvarchar(50) = NULL,
	@PlanningId int = Null
AS
BEGIN
	SET NOCOUNT ON;	
	DECLARE @CharVariable NVARCHAR(MAX);
	set @CharVariable = 'SELECT	MemberId, Date, CardId, NationalId, FirstName + '' '' + LastName AS fullName, JobTitle, Reagent, Mobile, FatherName, Email, dbo.GetGenderTitle(gender) AS Gender, LastName, dbo.Members.BirthDay, dbo.Members.ExpirationDate, dbo.Members.MarriageDate , dbo.GetInsuranceTitle('''+@Date+''', dbo.Members.ExpirationDate) AS InsuranceValidation ';
	
	if (@Debtor IS NOT NULL)
		Set @CharVariable = @CharVariable + ', dbo.GetMemberDebtorValue(MemberId) As DebtorValue ';
	
	Set @CharVariable = @CharVariable + 'FROM dbo.Members WHERE (dbo.Members.Active = 1)';
	
	if (@MemberId IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.MemberId = ' + CONVERT(varchar(MAX), @MemberId) + ')';		
	if (@Firstname IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.Firstname LIKE N''%' + @Firstname + '%'')';
		
	if (@Lastname IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.LastName LIKE N''%' + @Lastname + '%'')';
		
	if (@JobTitle IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.JobTitle LIKE N''%' + @JobTitle + '%'')';
		
	if (@Reagent IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.Reagent LIKE N''%' + @Reagent + '%'')';
		
	if (@CardId IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.CardId LIKE N''%' + @CardId + '%'')';
		
	if (@NationalId IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.NationalId LIKE N''%' + @NationalId + '%'')';
		
	if (@Gender = 0)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.Gender = 0)';
		
	if (@Gender = 1)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.Gender = 1)';	
		
	if (@MarriageDate IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.MarriageDate LIKE N''%' + @MarriageDate + '%'')';
		
	if (@StartBirthDay IS NOT NULL AND @EndBirthDay IS NOT NULL)	
	if (@StartBirthDay <> @EndBirthDay)
		Set @CharVariable = @CharVariable + ' AND (SUBSTRING(dbo.Members.BirthDay, 5, 6) BETWEEN ''' + @StartBirthDay+''' AND ''' + @EndBirthDay + ''')';
	else
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.BirthDay LIKE ''%' + @StartBirthDay+'%'')';
		
	if (@StartInsurance IS NOT NULL AND @EndInsurance IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.ExpirationDate BETWEEN ''' + @StartInsurance + ''' AND ''' + @EndInsurance  + ''')';		
	
	if (@RegisterStartDate IS NOT NULL AND @RegisterEndDate IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND (dbo.Members.Date BETWEEN ''' + @RegisterStartDate + ''' AND ''' + @RegisterEndDate  + ''')';		
	
	
	if (@Debtor IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND dbo.GetMemberDebtorStatus(MemberId) = N''' + @Debtor + '''';
		
	if (@Insurance IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND dbo.GetInsuranceTitle('''+@Date+''', dbo.Members.ExpirationDate) = N''' + @Insurance + '''';
	
	declare @Planning nvarchar(50);
	if (@ExpireStartDate IS NULL OR @ExpireEndDate IS NULL) begin
		set @ExpireStartDate = 'NULL';
		set @ExpireEndDate   = 'NULL';
	end
	else begin
		set @ExpireStartDate = '''' + @ExpireStartDate + '''';
		set @ExpireEndDate   = '''' + @ExpireEndDate + '''';
	end	
	
	if @PlanningId IS NULL
		set @Planning = 'NULL';		
	else 
		set @Planning = CONVERT(varchar(50),@PlanningId);
		
	if (@Validation IS NOT NULL)
		Set @CharVariable = @CharVariable + ' AND dbo.GetMemberValidtion(MemberId, '''+@Date+''', '+@ExpireStartDate+', '+@ExpireEndDate+', '+@Planning+', NULL) = N'''+@Validation + '''';
	EXECUTE sp_executesql @CharVariable;		  
END
