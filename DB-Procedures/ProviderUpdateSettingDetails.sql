USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ProviderUpdateSettingDetails]    Script Date: 07/05/2019 10:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 02/05/2018
-- Description:	Provider Update Setting Details
-- 23/10/2018 updated for Additional Information field
-- =============================================
ALTER PROCEDURE [dbo].[ProviderUpdateSettingDetails]
		@IDcarer as int, 
     	@toShow as nvarchar(255),
     	@typeID as int,
     	@URN as nvarchar(255),
     	@settingName as nvarchar(255),
     	@phoneNo as nvarchar(255),
     	@mobile as nvarchar(255),
     	@contactName as nvarchar(255),
     	@email as nvarchar(255),
     	@pccEmail1 as nvarchar(255),
     	@pccEmail2 as nvarchar(255),
     	@postcode as nvarchar(255),
     	@locality as varchar(50),
     	@linkedOfficer as varchar(150),
     	@idaci as nvarchar(5),
     	@website as nvarchar(255),
     	@ageFrom as int,
     	@ageTo as int,
     	@vacancies as nvarchar(255),
     	@schoolPicups as nvarchar(500),
     	@overallOfstedJudgeID as int,
     	@ofstedDate as date,
     	@ofstedLink as varchar(255),
     	@options as nvarchar(255),
     	@notes as nvarchar(255),
     	@lat as decimal(9,6),
     	@lng as decimal(9,6),
     	@locUpdated as varchar(5),
     	@user as varchar(50),
     	@addInfo as varchar(500) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @geoPoint as geography
			,@err_message nvarchar(255)
	
	IF @locUpdated = 'yes' and @lat is not null and @lng is not null
		SET @geoPoint = geography::Point(@lat, @lng, 4326)

	IF ISNULL(@IDcarer, '') = ''
	BEGIN    
		SET @err_message = @settingName + ' not found'
		RAISERROR (@err_message, 11,1)
	END
	ELSE
	BEGIN
		IF @locUpdated = 'yes'
			UPDATE [dbo].[RegisteredCarersV3]
			   SET [toShow] = @toShow
				  ,[typeID] = @typeID
				  ,[URN] = @URN
				  ,[settingName] = @settingName
				  ,[phoneNo] = @phoneNo
				  ,[mobile] = @mobile
				  ,[contactName] = @contactName
				  ,[email] = @email
				  ,[pccEmail1] = @pccEmail1
				  ,[pccEmail2] = @pccEmail2
				  ,[postcode] = @postcode
				  ,[locality] = @locality
				  ,[linkedOfficer] = @linkedOfficer
				  ,[idaciCode] = @idaci
				  ,[website] = @website
				  ,[ageFrom] = @ageFrom
				  ,[ageTo] = @ageTo
				  ,[vacancies] = @vacancies
				  ,[schoolPickups] = @schoolPicups
				  ,[addInfo] = @addInfo
				  ,[overallOfstedJudgeID] = @overallOfstedJudgeID
				  ,[ofstedDate] = @ofstedDate
				  ,[ofstedURL] = @ofstedLink
				  ,[options] = @options
				  ,[notes] = @notes
				  ,[lat] = @lat
				  ,[lng] = @lng
				  ,[geoPoint] = @geoPoint
				  ,[UpdatedBy] = @user
				  ,[UpdatedDate] = GETDATE()
			 WHERE IDcarer = @IDcarer;
		 ELSE
			UPDATE [dbo].[RegisteredCarersV3]
			   SET [toShow] = @toShow
				  ,[typeID] = @typeID
				  ,[URN] = @URN
				  ,[settingName] = @settingName
				  ,[phoneNo] = @phoneNo
				  ,[mobile] = @mobile
				  ,[contactName] = @contactName
				  ,[email] = @email
				  ,[pccEmail1] = @pccEmail1
				  ,[pccEmail2] = @pccEmail2
				  ,[locality] = @locality
				  ,[linkedOfficer] = @linkedOfficer
				  ,[idaciCode] = @idaci
				  ,[website] = @website
				  ,[ageFrom] = @ageFrom
				  ,[ageTo] = @ageTo
				  ,[vacancies] = @vacancies
				  ,[schoolPickups] = @schoolPicups
				  ,[addInfo] = @addInfo
				  ,[overallOfstedJudgeID] = @overallOfstedJudgeID
				  ,[ofstedDate] = @ofstedDate
				  ,[ofstedURL] = @ofstedLink
				  ,[options] = @options
				  ,[notes] = @notes
				  ,[UpdatedBy] = @user
				  ,[UpdatedDate] = GETDATE()
			 WHERE IDcarer = @IDcarer;
	
		SELECT [IDcarer]
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
			  ,[schoolPickups] as schoolPickups1
			  ,[addInfo] as addInformation1
			  ,[overallOfstedJudgeID] as overallOfstedJudgeID1
			  ,[ofstedDate] as ofstedDate1
			  ,[ofstedURL] as ofstedLink1
			  ,[options] as options1
			  ,[notes] as notes1
			  ,[lat] as lat1
			  ,[lng] as lng1
			  ,'' as updateLoc
			  ,'' as newRecord
		  FROM [dbo].[RegisteredCarersV3]
		  WHERE [IDcarer] = @IDcarer;
	END	

END

