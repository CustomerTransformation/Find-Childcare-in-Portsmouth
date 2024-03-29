USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListFilteredRegisteredCarersv2]    Script Date: 07/05/2019 10:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 11/06/2018
-- Description:	List filtered Registered Carers
	--@ageFrom as int,
	--@ageTo as int,
-- 24/10/2018 updated for Additional details and show more
-- =============================================
ALTER PROCEDURE [dbo].[ListFilteredRegisteredCarersv2] 
	@postcode as nvarchar(10),
	@2yearFund as nvarchar(5),
	@15hrFund as varchar(5),
	@30hrFund as varchar(5),
	@taxFree as varchar(5),
	@minOfstedJudge as int,
	@ofstedNew as nvarchar(5),
	@nearLoc as nvarchar(5),
	@nearlat as decimal(9,6),
	@nearlng as decimal(9,6),
	@distance as float
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @nearPNT geography, 
			@distanceM decimal(7,3),
			@numRows as int,
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
			@rowCount as int,
			@idCarer as varchar(5),
			@lstIDsout as varchar(max),
			@schPickups as varchar(max),
			@addInfo as varchar(max);
	
	CREATE TABLE #Temp(ID int identity(1,1) NOT NULL
			  ,[IDcarer] int NOT NULL
			  ,[toShow] varchar(20) NULL
			  ,[settingName] nvarchar(255) NULL
			  ,[URN] varchar(255) NULL
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
			  ,[schPickups] varchar(max) NULL
			  ,[addInformation] varchar(max) NULL
			  ,[calDist] decimal(7,3) NULL)
	
	SET @postcode = ISNULL(@postcode, '')
	SET @2yearFund = ISNULL(@2yearFund, '')
	SET @30hrFund = ISNULL(@30hrFund, '')
	SET @15hrFund = ISNULL(@15hrFund, '')
	SET @taxFree = ISNULL(@taxFree, '')
	--SET @minOfstedJudge = ISNULL(@minOfstedJudge, 0)
	SET @ofstedNew = ISNULL(@ofstedNew, '')
	--SET @ageFrom = ISNULL(@ageFrom, '')
	--SET @ageTo = ISNULL(@ageTo, '')
	SET @nearLoc = ISNULL(@nearLoc, '')
	--SET @nearlat = ISNULL(@nearlat, '')
	--SET @nearlng = ISNULL(@nearlng, '')
	--SET @distance = ISNULL(@distance, '')

	IF @nearLoc = 'yes'
	BEGIN
		--SET @nearPNT = geography::STGeomFromText('POINT(' + convert(varchar,@nearlat) + ' ' + convert(varchar,@nearlng) + ')', 4326);
		SET @nearPNT = geography::Point(@nearlat,@nearlng,4326);
		SET @distanceM = @distance * 1609.344;
		
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
						  ,[schPickups]
						  ,[addInformation]
						  ,[calDist])
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
			  ,[schoolPickups]
			  ,[addInfo]
			  ,@nearPNT.STDistance([geoPoint]) as calDist
		  FROM [dbo].[RegisteredCarersV3]
		  LEFT JOIN dbo.CMofsted ON [overallOfstedJudgeID] = IDofstedScore
		 WHERE [toShow] NOT LIKE '%hAl%'
		   AND (@minOfstedJudge = '' OR scoreValue >= @minOfstedJudge
				OR (scoreValue = 0 AND @ofstedNew = 'yes') )
		   AND (@2yearFund = '' OR (@2yearFund = 'yes' AND [options] like '%2yearFund%'))
		   AND (@15hrFund = '' OR (@15hrFund = 'yes' AND [options] like '%3_4yearFund%'))
		   AND (@30hrFund = '' OR (@30hrFund = 'yes' AND [options] like '%3_4yearExtend%'))
		   AND (@taxFree = '' OR (@taxFree = 'yes' AND [options] like '%taxFree%'))
		   --AND @ageFrom >= ageFrom AND @ageFrom <= ageTo
		   --AND @ageTo <= ageTo AND @ageTo >= ageFrom
		   --AND (@postcode = '' OR [postcode] like @postcode + '%')
		   AND @nearPNT.STDistance(geoPoint) <= @distance
		  ORDER BY calDist;
		   
	END
	ELSE
	BEGIN
		INSERT INTO #Temp([IDcarer]
						  ,[toShow]
						  ,[settingName]
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
						  ,[schPickups]
						  ,[addInformation])
		SELECT [IDcarer]
			  ,[toShow]
			  ,[settingName]
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
			  ,[schoolPickups]
			  ,[addInfo]
		  FROM [dbo].[RegisteredCarersV3]
		  LEFT JOIN dbo.CMofsted ON [overallOfstedJudgeID] = IDofstedScore
		 WHERE ([toShow] NOT LIKE '%hAl%' or [toShow] is null)
		   AND (@minOfstedJudge is null OR scoreValue >= @minOfstedJudge
				OR (scoreValue = 0 AND @ofstedNew = 'yes') )
		   AND (@2yearFund = '' OR (@2yearFund = 'yes' AND [options] like '%2yearFund%'))
		   AND (@15hrFund = '' OR (@15hrFund = 'yes' AND [options] like '%3_4yearFund%'))
		   AND (@30hrFund = '' OR (@30hrFund = 'yes' AND [options] like '%3_4yearExtend%'))
		   AND (@taxFree = '' OR (@taxFree = 'yes' AND [options] like '%taxFree%'))
		   --AND @ageFrom >= ageFrom AND @ageFrom <= ageTo
		   --AND @ageTo <= ageTo AND @ageTo >= ageFrom
		   AND (@postcode = '' OR [postcode] like @postcode + '%')
		  ORDER BY settingName;
	END
	
	SET @numRows = SCOPE_IDENTITY();
	SET @loopCounter = 1
	SET @rowCount = 1
	SET @htmlOut = ''
--####  loop through all the retrieved data	
	WHILE(@loopCounter <= @numRows)
	BEGIN
		SELECT @heading = CASE WHEN [toShow] Like '%hNm%' THEN
							  CASE WHEN isnull(website, '') = '' THEN
								'<h4>Ofsted URN ' + isnull(URN, '') + '</h4>'
							  ELSE
								'<h4><a target="_blank" href="' + isnull(website, '') + '">Ofsted URN ' + isnull(URN, '') + '</a></h4>'
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
								'<p class="condensed">Telephone: ' + isnull(phoneNo, '')
							   ELSE
								'<p class="condensed">Telephone: <a target="_top" href="tel:' + isnull(phoneNo, '') + '">' + isnull(phoneNo, '') + '</a>'
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
			   ,@ageRange = '<p class="condensed">Age from ' + isnull(convert(varchar(2),ageFrom), '') + ' to ' + isnull(convert(varchar(2),ageTo), '') + '&nbsp&nbsp&nbsp&nbsp&nbsp'
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
			   ,@schPickups = ISNULL(schPickups, '')
			   ,@addInfo = ISNULL(addInformation, '')
			   ,@idCarer = CONVERT(varchar(5),IDcarer)
		FROM #Temp
		WHERE ID = @loopCounter;
--##### Build the options and additional info paragraphs		
--old		SET @optionsDis = '<p>'
		SET @optionsDis = '<details><summary>more info ...</summary><p>'
		
		IF @options Like '%2YearFund%'
			SET @optionsDis = @optionsDis + '2 year funding'
		
		IF @options Like '%3_4yearFund%'
		BEGIN
			IF LEN(@optionsDis) > 45
				SET @optionsDis = @optionsDis + ', 3 & 4 year universal'
			ELSE
				SET @optionsDis = @optionsDis + '3 & 4 year universal'
		END
		
		IF @options Like '%3_4yearExtend%'
		BEGIN
			IF LEN(@optionsDis) > 45
				SET @optionsDis = @optionsDis + ', 30 hour funding'
			ELSE
				SET @optionsDis = @optionsDis + '30 hour funding'
		END
		
		IF @options Like '%taxFree%'
		BEGIN
			IF LEN(@optionsDis) > 45
				SET @optionsDis = @optionsDis + ', Tax free childcare'
			ELSE
				SET @optionsDis = @optionsDis + 'Tax free childcare'
		END
		
		IF @schPickups != ''
		BEGIN
			IF LEN(@optionsDis) > 45
				SET @optionsDis = @optionsDis + '<br /><strong>School Pickups</strong><br />' + @schPickups
			ELSE
				SET @optionsDis = @optionsDis + '<strong>School Pickups</strong><br />' + @schPickups
		END
		
		IF @addInfo != ''
		BEGIN
			IF LEN(@optionsDis) > 45
				SET @optionsDis = @optionsDis + '<br /><strong>Additional information</strong><br />' + @addInfo
			ELSE
				SET @optionsDis = @optionsDis + '<strong>Additional information</strong><br />' + @addInfo
		END
		
--old		SET @optionsDis = @optionsDis + '</p>'
		SET @optionsDis = @optionsDis + '</p></details>'
--###### add the paragraphs either as first or as subsequent panels		
		IF @rowCount < 2
		BEGIN
--old			SET @htmlOut = @htmlOut + '<div class="row"><div class="col-md-6"><div class="card"><div class="container">'
			SET @htmlOut = @htmlOut + '<div class="row"><div class="col-md-6"><div class="card"><div class="card-body">'
			SET @htmlOut = @htmlOut + @heading + @contact + @ageRange + @ofstead + @vacancies + @optionsDis + '</div></div></div>'
			SET @rowCount = @rowCount + 1;
		END
		ELSE
		BEGIN
--old			SET @htmlOut = @htmlOut + '<div class="col-md-6"><div class="card"><div class="container">'
			SET @htmlOut = @htmlOut + '<div class="col-md-6"><div class="card"><div class="card-body">'
			SET @htmlOut = @htmlOut + @heading + @contact + @ageRange + @ofstead + @vacancies  + @optionsDis + '</div></div></div></div>'
			SET @rowCount = 1;
		END
		IF @lstIDsout is null
			SET @lstIDsout = @idCarer
		ELSE
			SET @lstIDsout = @lstIDsout + ',' + @idCarer
		
		SET @loopCounter = @loopCounter + 1;
	END
	
	SET @htmlOut = '<div class="container-fluid"><div class="card-columns">' + @htmlOut + '</div></div>'
	
--###### add the script for more info
	
	/****SET @htmlOut = @htmlOut + '<script>
					var acc = document.getElementsByClassName("accordion");
					var i;

					for (i = 0; i < acc.length; i++) {
					  acc[i].addEventListener("click", function() {
						this.classList.toggle("active");
						var panelP = this.nextElementSibling;
						if (panelP.style.maxHeight){
						  panelP.style.maxHeight = null;
						} else {
						  panelP.style.maxHeight = panelP.scrollHeight + "px";
						} 
					  });
					}
					</script>' ***/
	
	SELECT @htmlOut as htmlSearchResults , @numRows as checkRows, @lstIDsout as listIDs
	
END

