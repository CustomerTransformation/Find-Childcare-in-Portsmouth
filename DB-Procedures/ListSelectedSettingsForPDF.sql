USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListSelectedSettingsForPDF]    Script Date: 07/05/2019 10:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 14/06/2018
-- Description:	List selected settings to generate body of PDF
-- =============================================
ALTER PROCEDURE [dbo].[ListSelectedSettingsForPDF]
		@selectedIDs as varchar(max)
		,@selectAll as varchar(5)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @numRows as int,
			@loopCounter as int,
			@htmlOut as varchar(max),
			@heading as varchar(255),
			@contact as varchar(255),
			@url as varchar(500),
			@ageRange as varchar(255),
			@ofstead as varchar(255),
			@vacancies as varchar(255),
			@options as varchar(255),
			@optionsDis as varchar(max),
			@rowCount as int;
	
	CREATE TABLE #Temp(ID int identity(1,1) NOT NULL
			  ,[IDcarer] int NOT NULL
			  ,[toShow] varchar(20) NULL
			  ,[settingName] nvarchar(255) NULL
			  ,[URN] nvarchar(255) NULL
			  ,[phoneNo] nvarchar(255) NULL
			  ,[email] nvarchar(255) NULL
			  ,[postcode] nvarchar(10) NULL
			  ,[website] nvarchar(255) NULL
			  ,[ageFrom] int NULL
			  ,[ageTo] int NULL
			  ,[vacancies] nvarchar(5) NULL
			  ,[schoolPickups]  varchar(500) NULL
			  ,[score] varchar(25) NULL
			  ,[ofstedURL] varchar(255) NULL
			  ,[options] nvarchar(255) NULL
			  ,[addInfo] varchar(500) NULL)
	
	INSERT INTO #Temp([IDcarer]
					  ,[toShow]
					  ,[settingName]
					  ,[URN]
					  ,[phoneNo]
					  ,[email]
					  ,[postcode]
					  ,[website]
					  ,[ageFrom]
					  ,[ageTo]
					  ,[vacancies]
					  ,[schoolPickups]
					  ,[score]
					  ,[ofstedURL]
					  ,[options]
					  ,[addInfo])
	SELECT [IDcarer]
		  ,[toShow]
		  ,[settingName]
		  ,[URN]
		  ,[phoneNo]
		  ,[email]
		  ,[postcode]
		  ,[website]
		  ,[ageFrom]
		  ,[ageTo]
		  ,[vacancies]
		  ,[schoolPickups]
		  ,[score]
		  ,[ofstedURL]
		  ,[options]
		  ,[addInfo]
	  FROM [dbo].[RegisteredCarersV3]
	  LEFT JOIN dbo.CMofsted ON [overallOfstedJudgeID] = IDofstedScore
		JOIN DelimitedSplit8K (@selectedIDs,',') SplitString
			ON [RegisteredCarersV3].IDcarer = SplitString.Item;


	SET @numRows = SCOPE_IDENTITY();
	SET @loopCounter = 1
	SET @rowCount = 1
	SET @htmlOut = ''
	
	WHILE(@loopCounter <= @numRows)
	BEGIN
		SELECT @heading = CASE WHEN [toShow] Like '%hNm%' THEN
							  CASE WHEN isnull(website, '') = '' THEN
								'<h4>Ofsted ' + isnull(URN, '') + '</h4>'
							  ELSE
								'<h4><a target="_blank" href="' + isnull(website, '') + '">Ofsted ' + isnull(URN, '') + '</a></h4>'
							  END
						   ELSE
							  CASE WHEN isnull(website, '') = '' THEN
								'<h4>' + isnull(settingName, '') + '</h4>'
							  ELSE
								'<h4><a target="_blank" href="' + isnull(website, '') + '">' + isnull(settingName, '') + '</a></h4>'
							  END
						   END
			   ,@contact = CASE WHEN [toShow] Like '%hCn%' THEN
							   ''
						   ELSE
							   CASE WHEN isnull(phoneNo, '') = '' THEN
								'<p>Telephone: ' + isnull(phoneNo, '')
							   ELSE
								'<p>Telephone: <a target="_top" href="tel:' + isnull(phoneNo, '') + '">' + isnull(phoneNo, '') + '</a>'
							   END
						   END
						 + CASE WHEN [toShow] Like '%hEm%' THEN
							   ''
						   ELSE
							   CASE WHEN isnull(email, '') = '' THEN
								'<br />Email: ' + isnull(email, '') + '</p>'
							   ELSE
								'<br />Email: <a target="_top" href="mailto:' + isnull(email, '') + '">' + isnull(email, '') + '</a></p>'
							   END
						   END
			   ,@ageRange = '<p>Age from ' + isnull(convert(varchar(2),ageFrom), '') + ' to ' + isnull(convert(varchar(2),ageTo), '') + '&nbsp&nbsp&nbsp&nbsp&nbsp'
			   ,@ofstead = CASE WHEN isnull(ofstedURL, '') = '' THEN
							'Ofsted grade: ' + isnull(score, '')
						   ELSE
							'Ofsted grade: <a target="_blank" href="' + isnull(ofstedURL, '') + '">' + isnull(score, '') + '</a>'
						   END
			   ,@vacancies = '<br />Vacancies: ' + (CASE vacancies
														WHEN 'no' THEN 'No'
														WHEN 'yes' THEN 'Yes'
														ELSE 'Contact Us'
													END) + '</p>'
			   ,@options = isnull(options, '')
		FROM #Temp
		WHERE ID = @loopCounter;
		
		SET @optionsDis = '<p>'
		
		IF @options Like '%2YearFund%'
			SET @optionsDis = @optionsDis + '2 year funding'
		
		IF @options Like '%3_4yearFund%'
		BEGIN
			IF LEN(@optionsDis) > 5
				SET @optionsDis = @optionsDis + ', 3 & 4 year universal'
			ELSE
				SET @optionsDis = @optionsDis + '3 & 4 year universal'
		END
		
		IF @options Like '%3_4yearExtend%'
		BEGIN
			IF LEN(@optionsDis) > 5
				SET @optionsDis = @optionsDis + ', 30 hour funding'
			ELSE
				SET @optionsDis = @optionsDis + '30 hour funding'
		END
		
		IF @options Like '%taxFree%'
		BEGIN
			IF LEN(@optionsDis) > 5
				SET @optionsDis = @optionsDis + ', Tax free childcare'
			ELSE
				SET @optionsDis = @optionsDis + 'Tax free childcare'
		END
		
		SET @optionsDis = @optionsDis + '</p>'
		
		IF @rowCount < 2
		BEGIN
			SET @htmlOut = @htmlOut + '<div class="row"><div class="col-md-6"><div class="card"><div class="container">'
			SET @htmlOut = @htmlOut + @heading + @contact + @ageRange + @ofstead + @vacancies + @optionsDis + '</div></div></div>'
			SET @rowCount = @rowCount + 1;
		END
		ELSE
		BEGIN
			SET @htmlOut = @htmlOut + '<div class="col-md-6"><div class="card"><div class="container">'
			SET @htmlOut = @htmlOut + @heading + @contact + @ageRange + @ofstead + @vacancies  + @optionsDis + '</div></div></div></div>'
			SET @rowCount = 1;
		END
		SET @loopCounter = @loopCounter + 1;
	END
	
	SET @htmlOut = '<div class="container-fluid"><div class="card-columns">' + @htmlOut + '</div></div>'
	
	SELECT @htmlOut as htmlSelectResults , @numRows as checkRowsPDF, @selectedIDs as confirmSelection
	
END


