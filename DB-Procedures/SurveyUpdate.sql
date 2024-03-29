USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[SurveyUpdate]    Script Date: 07/05/2019 10:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 14/02/2019
-- Description:	Update to latest info for sufficiency survey
-- =============================================
ALTER PROCEDURE [dbo].[SurveyUpdate] 
	@showSurveyFrom as date
	,@surveyRequiredBy as date
	,@stopShowingSurvey as date
	,@surveyWhen as varchar(1000)
	,@user as varchar(255)
AS	
BEGIN
	SET NOCOUNT ON;

    DECLARE @latestID as int
    
    UPDATE [dbo].[SufficiencySurveyDates]
	   SET [isLatest] = 0
		  ,[UpdatedBy] = @user
		  ,[UpdatedDate] = GETDATE()
	 WHERE [isLatest] = 1

	INSERT INTO [dbo].[SufficiencySurveyDates]
           ([showSurveyFrom]
           ,[surveyRequiredBy]
           ,[stopShowingSurvey]
           ,[surveyWhen]
           ,[isLatest]
           ,[CreatedBy]
           ,[CreatedDate])
     VALUES
           (@showSurveyFrom
           ,@surveyRequiredBy
           ,@stopShowingSurvey
           ,@surveyWhen
           ,1
           ,@user
           ,GETDATE())

	SET @latestID = SCOPE_IDENTITY()
	
	SELECT [showSurveyFrom] as [showSurveyFrom1]
		  ,[surveyRequiredBy] as [surveyRequiredBy1]
		  ,[stopShowingSurvey] as [stopShowingSurvey1]
		  ,[surveyWhen] as [surveyWhen1]
	  FROM [dbo].[SufficiencySurveyDates]
	 WHERE [IDsurvey] = @latestID
	   AND [isLatest] = 1
END

