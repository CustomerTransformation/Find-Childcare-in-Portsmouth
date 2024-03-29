USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[MapCMselectedV2]    Script Date: 07/05/2019 10:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 22/02/2018
-- Description:	Produce list of map points from selected
-- =============================================
ALTER PROCEDURE [dbo].[MapCMselectedV2]
		@selectedIDs as varchar(max)
		,@selectAll as varchar(5)
AS
BEGIN
	SET NOCOUNT ON;
	
	CREATE TABLE #temp (ID int identity (1,1), lat decimal(5,3), lng decimal(5,3), display varchar(255), name varchar(max)) 

	

	INSERT INTO #temp (lat, lng, display, name)
	SELECT	  lat
			, lng
			, IDcarer as display
			, '<div>' + CASE WHEN [toShow] Like '%hNm%' THEN
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
				+ '<p>Postcode: ' + Postcode
				+ CASE WHEN [toShow] Like '%hEm%' THEN
					' '
				  ELSE
					'<br />Email: <a target="_top" href="mailto:' + isnull(email, '') + '">' + isnull(email, '') + '</a>'
				  END
				+ CASE WHEN [toShow] Like '%hCn%' THEN
					' '
				  ELSE
					 '<br />Tel: <a target="_top" href="tel:' + isnull(phoneNo, '') + '">' + isnull(phoneNo, '') + '</a>'
				  END
				+ '<br />Ofsted grade: ' + isnull(score,'')
				+ '<br />Vacancies: ' + (CASE vacancies
											WHEN 'no' THEN 'No'
											WHEN 'yes' THEN 'Yes'
											ELSE 'Contact Us'
										END)
				+ '</p></div>' as name 
	FROM [dbo].[RegisteredCarersV3]
	  LEFT JOIN dbo.CMofsted ON [overallOfstedJudgeID] = IDofstedScore
	  JOIN DelimitedSplit8K (@selectedIDs,',') SplitString
				ON [RegisteredCarersV3].IDcarer = SplitString.Item
	WHERE	lat is not null 
	  AND	lng is not null
	  AND   [RegisteredCarersV3].[toShow] not like '%hPc%'

    
	select *, 'yes' AS gotdata from #temp
	
	Drop Table #temp
END


