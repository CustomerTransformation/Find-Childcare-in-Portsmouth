USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[sufficiencySurveyLoadResponses]    Script Date: 07/05/2019 10:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 21/02/2019
-- Description:	load recorded responses for Sufficiency Survey
-- =============================================
ALTER PROCEDURE [dbo].[sufficiencySurveyLoadResponses] 
	@provID as int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @numRecords as int
	
	SELECT @numRecords = COUNT([IDsurvey])
	  FROM [dbo].[sufficiencySurveys]
	 WHERE [IDsetting] = @provID
	
	IF @numRecords > 0
		SELECT TOP(1) [IDsurvey] as surveyID
			  ,[termTimeOnly]
			  ,[numWeeks]
			  ,[overnightCare]
			  ,[openChanged12]
			  ,[earlyYearsPlaces]
			  ,[totalVacancies]
			  ,[noOffered12]
			  ,[noHours12]
			  ,[under2s]
			  ,[no2YearOlds]
			  ,[no3_4YearOlds]
			  ,[vacUnder2s]
			  ,[vac2YearOlds]
			  ,[vac3_4YearOlds]
			  ,[weekendOvernight]
			  ,[fund2YearOlds]
			  ,[fund3_4YearOlds]
			  ,[fund2yrsChange]
			  ,[fund3_4yrsChange]
			  ,[whatAreYourPaymen]
			  ,[perDayUnder2]
			  ,[perSessionUnder2]
			  ,[perWeekUnder2]
			  ,[perHourUnder2]
			  ,[perDay2yrs]
			  ,[perSession2yrs]
			  ,[perWeek2yrs]
			  ,[perHour2yrs]
			  ,[perDay3_4yrs]
			  ,[perSession3_4yrs]
			  ,[perWeek3_4yrs]
			  ,[perHour3_4yrs]
			  ,[feesPast12]
			  ,[additionalCharges]
			  ,[noAdditonalCharges]
			  ,[otherCharges]
			  ,[numberAppretices]
			  ,[numberVolunteers]
			  ,[volunteerHours]
			  ,[assistChildminder]
			  ,[numOtherSetting]
			  ,[forThesewhereKno]
			  ,[anotherSettingOther]
			  ,[increaseCapacity12]
			  ,[planChanges]
			  ,[doYouHaveAnyConc]
			  ,[pleaseSelectReason]
			  ,[premisesIssue]
			  ,[otherConcern]
			  ,CASE WHEN [surveyComplete] = 'yes' THEN [surveyComplete]
					ELSE '' END as surveyComplete
		  FROM [dbo].[sufficiencySurveys]
		 WHERE [IDsetting] = @provID
	ELSE
		SELECT TOP(1) '' as surveyID
			  ,'' as termTimeOnly
			  ,'' as numWeeks
			  ,'' as overnightCare
			  ,'' as openChanged12
			  ,'' as earlyYearsPlaces
			  ,'' as totalVacancies
			  ,'' as noOffered12
			  ,'' as noHours12
			  ,'' as under2s
			  ,'' as no2YearOlds
			  ,'' as no3_4YearOlds
			  ,'' as vacUnder2s
			  ,'' as vac2YearOlds
			  ,'' as vac3_4YearOlds
			  ,'' as weekendOvernight
			  ,'' as fund2YearOlds
			  ,'' as fund3_4YearOlds
			  ,'' as fund2yrsChange
			  ,'' as fund3_4yrsChange
			  ,'' as whatAreYourPaymen
			  ,'' as perDayUnder2
			  ,'' as perSessionUnder2
			  ,'' as perWeekUnder2
			  ,'' as perHourUnder2
			  ,'' as perDay2yrs
			  ,'' as perSession2yrs
			  ,'' as perWeek2yrs
			  ,'' as perHour2yrs
			  ,'' as perDay3_4yrs
			  ,'' as perSession3_4yrs
			  ,'' as perWeek3_4yrs
			  ,'' as perHour3_4yrs
			  ,'' as feesPast12
			  ,'' as additionalCharges
			  ,'' as noAdditonalCharges
			  ,'' as otherCharges
			  ,'' as numberAppretices
			  ,'' as numberVolunteers
			  ,'' as volunteerHours
			  ,'' as assistChildminder
			  ,'' as numOtherSetting
			  ,'' as forThesewhereKno
			  ,'' as anotherSettingOther
			  ,'' as increaseCapacity12
			  ,'' as planChanges
			  ,'' as doYouHaveAnyConc
			  ,'' as pleaseSelectReason
			  ,'' as premisesIssue
			  ,'' as otherConcern
			  ,'' as surveyComplete


END

