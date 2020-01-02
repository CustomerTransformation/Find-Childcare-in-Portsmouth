USE [FStepChildCare_prod]
GO

/****** Object:  UserDefinedFunction [dbo].[inclusiveMatch]    Script Date: 31/12/2019 09:40:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 12/07/2019
-- Description:	match the first value into the second if 
-- Return: all first in second --> yes
--         some of first in second --> part
--         none of first in second --> no
-- =============================================
CREATE FUNCTION [dbo].[inclusiveMatch] 
(
	@stringOne as varchar(255)
	,@stringTwo as varchar(255)
)
RETURNS varchar(5)
AS
BEGIN
	DECLARE @strMatch as varchar(5)
		   ,@posCurrOne as int
		   ,@posPrevOne as int
		   ,@posCurrTwo as int
		   ,@countOne as int
		   ,@countMatch as int
	
	IF ISNULL(@stringOne, '') != '' AND ISNULL(@stringTwo, '') != ''
	BEGIN
		
		SET @posPrevOne = 1
		SET @posCurrOne = CHARINDEX(',', @stringOne)
		SET @posCurrTwo = CHARINDEX(',', @stringTwo)
		
		IF @posCurrOne = 0
		BEGIN
			IF ',' + @stringTwo + ',' LIKE '%,' + @stringOne + ',%'
				SET @strMatch = 'yes'
			ELSE
				SET @strMatch = 'no'
		END
		ELSE IF @posCurrTwo = 0
		BEGIN
			SET @strMatch = 'p3'
			IF ',' + @stringOne + ',' LIKE '%,' + @stringTwo + ',%'
				IF @stringOne = @stringTwo
					SET @strMatch = 'yes'
				ELSE
					SET @strMatch = 'part'
			ELSE
				SET @strMatch = 'no'
		END
		ELSE
		BEGIN
			SET @countOne = 1
			SET @countMatch = 0
			SET @stringOne = ',' + @stringOne + ','
			SET @stringTwo = ',' + @stringTwo + ','
			SET @posCurrOne = @posCurrOne + 1
			WHILE @posCurrOne > 0
			BEGIN
				IF  @stringTwo LIKE '%' + SUBSTRING(@stringOne, @posPrevOne, @posCurrOne) + '%'
					SET @countMatch = @countMatch + 1 
				SET @countOne = @countOne + 1
				SET @posPrevOne = @posCurrOne
				SET @posCurrOne = CHARINDEX(',', @stringOne, @posPrevOne + 1)
			END
			SET @countOne = @countOne - 1
			IF @countOne = @countMatch
				SET @strMatch = 'yes'
			ELSE IF @countMatch > 0
				SET @strMatch = 'part'
			ELSE
				SET @strMatch = 'no'
		END
	END
	ELSE
		SET @strMatch = 'no'

	-- Return the result of the function
	RETURN @strMatch

END
GO


