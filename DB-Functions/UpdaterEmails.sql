USE [ProdChildCare]
GO
/****** Object:  UserDefinedFunction [dbo].[UpdaterEmails]    Script Date: 07/05/2019 10:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 07/12/2018
-- Description:	List all email address that can update provider
-- =============================================
ALTER FUNCTION [dbo].[UpdaterEmails] 
(
	@settingID int
)
RETURNS varchar(1000)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar varchar(1000)
			,@updateID as int
			,@updateIDnew as int
			,@email as varchar(256)
	
	SET @updateID = 0;
	SET @updateIDnew = 0;
	SET @ResultVar = '';

	WHILE @updateID is not null
	BEGIN
		SELECT TOP 1 @email = [provEmail] 
					,@updateIDnew = [ID]
			FROM [dbo].[ProviderUpdaters]
		   WHERE ID > @updateID
		     AND settingID = @settingID
		  ORDER BY [ID];
		
		IF @updateIDnew > @updateID
		BEGIN
			SET @updateID = @updateIDnew;
			IF LEN(@ResultVar) > 1
				SET @ResultVar = @ResultVar + '; ' + @email;
			ELSE
				SET @ResultVar = @email;
		END
		ELSE
			SET @updateID = NULL;
		
	END
	-- Return the result of the function
	RETURN @ResultVar

END

