CREATE FUNCTION [dbo].[GetInsuranceTitle]
(
	@Date nvarchar(50),
	@Insurance nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN
	if @Insurance IS NULL OR @Insurance = ''
		return N'نامعتبر';
	if @Insurance < @Date
		return N'نامعتبر';
	return N'معتبر';
END
