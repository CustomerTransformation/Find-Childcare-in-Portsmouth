USE [FStepChildCare_prod]
GO

/****** Object:  UserDefinedFunction [dbo].[ageRangeDescription]    Script Date: 31/12/2019 09:38:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 18/07/2019
-- Description:	produce text desc of age range
-- =============================================
CREATE FUNCTION [dbo].[ageRangeDescription] 
(
	@ageFrom as decimal(4,1)
	,@ageTo as decimal(4,1)
)
RETURNS varchar(50)
AS
BEGIN
	DECLARE @ageRangeDesc as varchar(50)

	IF @ageFrom IS NOT NULL
	BEGIN
		SET @ageRangeDesc = 'Age from: ' + REPLACE(CAST(@ageFrom as varchar(5)), '.0', '')
		IF @ageTo IS NOT NULL
			SET @ageRangeDesc = @ageRangeDesc + ' to: ' + REPLACE(CAST(@ageTo as varchar(5)), '.0', '')
	END
	ELSE IF @ageTo IS NOT NULL
			SET @ageRangeDesc = 'To age: ' + REPLACE(CAST(@ageTo as varchar(5)), '.0', '')
			
	-- Return the result of the function
	RETURN @ageRangeDesc

END
GO


