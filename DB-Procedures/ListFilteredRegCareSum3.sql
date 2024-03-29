USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListFilteredRegCareSum3]    Script Date: 07/05/2019 10:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Daniel Gregory
-- Create date: 21/08/2018
-- Description:	List filtered Registered Carers summary
-- =============================================
ALTER PROCEDURE [dbo].[ListFilteredRegCareSum3] 
		@selectedIDs as varchar(max) 
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT [IDcarer] as name
		  ,CASE WHEN [toShow] Like '%hNm%' THEN
				'Osted URN ' + [URN]
			ELSE
				[settingName] 
			END
		  + ' - Ages ' + ISNULL(convert(varchar(5),[ageFrom]),'') 
		  + ' to ' + ISNULL(convert(varchar(5),ageTo),'') 
		  + ' - Ofsted: ' + ISNULL(score, '') as display
		  /***,[settingName]
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
		  ,[options]***/
	  FROM [dbo].[RegisteredCarersV3]
	  LEFT JOIN dbo.CMofsted ON [overallOfstedJudgeID] = IDofstedScore
	JOIN DelimitedSplit8K (@selectedIDs,',') SplitString
		ON [RegisteredCarersV3].IDcarer = SplitString.Item
	   
END




