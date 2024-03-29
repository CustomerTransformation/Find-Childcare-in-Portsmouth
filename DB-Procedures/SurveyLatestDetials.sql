USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[SurveyLatestDetials]    Script Date: 07/05/2019 10:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 14/02/2019
-- Description:	load details for the latest sufficiency survey
-- =============================================
ALTER PROCEDURE [dbo].[SurveyLatestDetials]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT TOP (1) [showSurveyFrom] as [showSurveyFrom1]
				  ,[surveyRequiredBy] as [surveyRequiredBy1]
				  ,[stopShowingSurvey] as [stopShowingSurvey1]
				  ,[surveyWhen] as [surveyWhen1]
			  FROM [dbo].[SufficiencySurveyDates]
			 WHERE [isLatest] = 1
END

