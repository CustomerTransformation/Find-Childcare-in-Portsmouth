USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[GetSettingDetails]    Script Date: 07/05/2019 10:12:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Gregory
-- Create date: 02/05/2018
-- Description:	Retrieve details for Registered Carer
-- 23/10/2018 updated for Additional Information field
-- =============================================
ALTER PROCEDURE [dbo].[GetSettingDetails] 
	@carerID as int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [IDcarer]
		  ,[toShow]
		  ,[typeID]
		  ,[URN]
		  ,[settingName]
		  ,[phoneNo]
		  ,[mobile]
		  ,[contactName]
		  ,[email]
		  ,[pccEmail1]
		  ,[pccEmail2]
		  ,[postcode]
		  ,[locality]
		  ,[linkedOfficer]
		  ,[idaciCode] as idaci
		  ,[website]
		  ,[ageFrom]
		  ,[ageTo]
		  ,[vacancies]
		  ,[overallOfstedJudgeID]
		  ,[ofstedDate]
		  ,[ofstedURL] as ofstedLink
		  ,[options]
		  ,[schoolPickups]
		  ,[addInfo] as addInformation
		  ,[notes]
		  ,[lat]
		  ,[lng]
		  ,[toShow] as toShow1
		  ,[typeID] as typeID1
		  ,[URN] as URN1
		  ,[settingName] as settingName1
		  ,[phoneNo] as phoneNo1
		  ,[mobile] as mobile1
		  ,[contactName] as contactName1
		  ,[email] as email1
		  ,[pccEmail1] as pccEmail11
		  ,[pccEmail2] as pccEmail21
		  ,[postcode] as postcode1
		  ,[locality] as locality1
		  ,[linkedOfficer] as linkedOfficer1
		  ,[idaciCode] as idaci1
		  ,[website] as website1
		  ,[ageFrom] as ageFrom1
		  ,[ageTo] as ageTo1
		  ,[vacancies] as vacancies1
		  ,[overallOfstedJudgeID] as overallOfstedJudgeID1
		  ,[ofstedDate] as ofstedDate1
		  ,[ofstedURL] as ofstedLink1
		  ,[options] as options1
		  ,[schoolPickups] as schoolPickups1
		  ,[addInfo] as addInformation1
		  ,[notes] as notes1
		  ,[lat] as lat1
		  ,[lng] as lng1
		  ,'' as updateLoc
	  FROM [dbo].[RegisteredCarersV3]
	  WHERE [IDcarer] = @carerID
  
END