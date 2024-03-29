USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ProviderCheckUpdaters]    Script Date: 07/05/2019 10:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 19/06/2018
-- Description:	Summary users already setup for access
-- =============================================
ALTER PROCEDURE [dbo].[ProviderCheckUpdaters] 
		@IDcarer int
		,@UCRN nvarchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @numRows int
			,@loopCounter int
			,@htmlOut varchar(max)
			,@htmlNewLn varchar(500)
			,@UCRNreg int
			,@UCRNnew int
			,@alreadyReg varchar(5);
	
	SET @alreadyReg = 'no';
	SET @UCRNnew = NULLIF(@UCRN, '');
	
	CREATE TABLE #Temp(ID int identity(1,1) NOT NULL
						,IDentered int
						,provUCRN int
						,provEmail varchar(255)
						)

	
	INSERT INTO #Temp (
				IDentered
				,provUCRN
				,provEmail
				)
    SELECT [ID]
		  ,[provUCRN]
		  ,[provEmail]
	  FROM [dbo].[ProviderUpdaters]
	  WHERE [settingID] = @IDcarer;
	  
	SET @numRows = SCOPE_IDENTITY(); 
	SET @loopCounter = 1
	SET @htmlOut = ''
	
	WHILE(@loopCounter <= @numRows)
	BEGIN
		SELECT  @htmlNewLn = '<li>' + provEmail + '</li>'
				,@UCRNreg = provUCRN
		FROM #Temp
		WHERE ID = @loopCounter;
		
		IF @UCRNreg = @UCRNnew
		BEGIN
			SET @alreadyReg = 'yes';
			SET @htmlOut = @htmlOut + '<li>Already registered</li>'
		END
		ELSE
		BEGIN
			SET @htmlOut = @htmlOut + @htmlNewLn;
		END
		
		SET @loopCounter = @loopCounter + 1;
	END


	SELECT @htmlOut as ListReg, @numRows as numReg, @alreadyReg as alreadyReg;


END

