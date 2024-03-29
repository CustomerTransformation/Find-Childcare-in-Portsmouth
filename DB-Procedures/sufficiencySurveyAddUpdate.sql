USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[sufficiencySurveyAddUpdate]    Script Date: 07/05/2019 10:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Gregory
-- Create date: 21/02/2019
-- Description:	Add or Update Sufficiency Survey table
-- =============================================
ALTER PROCEDURE [dbo].[sufficiencySurveyAddUpdate] 
		@surveyID as varchar(10),
		@provID as int,
		@termTimeOnly as varchar(5),
		@numWeeks as int,
		@overnightCare as varchar(5),
		@openChanged12 as varchar(50),
		@earlyYearsPlaces as int,
		@totalVacancies as int,
		@noOffered12 as varchar(15),
		@noHours12 as varchar(15),
		@under2s as int,
		@no2YearOlds as int,
		@no3_4YearOlds as int,
		@vacUnder2s as int,
		@vac2YearOlds as int,
		@vac3_4YearOlds as int,
		@weekendOvernight as varchar(310),
		@fund2YearOlds as int,
		@fund3_4YearOlds as int,
		@fund2yrsChange as varchar(50),
		@fund3_4yrsChange as varchar(50),
		@whatAreYourPaymen as varchar(50),
		@perDayUnder2 as varchar(10),
		@perSessionUnder2 as varchar(10),
		@perWeekUnder2 as varchar(10),
		@perHourUnder2 as varchar(10),
		@perDay2yrs as varchar(10),
		@perSession2yrs as varchar(10),
		@perWeek2yrs as varchar(10),
		@perHour2yrs as varchar(10),
		@perDay3_4yrs as varchar(10),
		@perSession3_4yrs as varchar(10),
		@perWeek3_4yrs as varchar(10),
		@perHour3_4yrs as varchar(10),
		@feesPast12 as varchar(50),
		@additionalCharges as varchar(120),
		@noAdditonalCharges as varchar(20),
		@otherCharges as varchar(310),
		@numberAppretices as int,
		@numberVolunteers as int,
		@volunteerHours as int,
		@assistChildminder as varchar(5),
		@numOtherSetting as int,
		@forThesewhereKno as varchar(200),
		@anotherSettingOther as varchar(310),
		@increaseCapacity12 as varchar(5),
		@planChanges as varchar(310),
		@doYouHaveAnyConc as varchar(5),
		@pleaseSelectReason as varchar(200),
		@premisesIssue as varchar(310),
		@otherConcern as varchar(310),
		@surveyComplete as varchar(5),
		@user as varchar(255)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @surveyIDint as int,
			@perDayUnder2Dec as decimal(5,2),
			@perSessionUnder2Dec as decimal(5,2),
			@perWeekUnder2Dec as decimal(5,2),
			@perHourUnder2Dec as decimal(5,2),
			@perDay2yrsDec as decimal(5,2),
			@perSession2yrsDec as decimal(5,2),
			@perWeek2yrsDec as decimal(5,2),
			@perHour2yrsDec as decimal(5,2),
			@perDay3_4yrsDec as decimal(5,2),
			@perSession3_4yrsDec as decimal(5,2),
			@perWeek3_4yrsDec as decimal(5,2),
			@perHour3_4yrsDec as decimal(5,2),
			@numWeeksInt as Int,
			@earlyYearsPlacesInt as Int,
			@totalVacanciesInt as Int,
			@under2sInt as Int,
			@no2YearOldsInt as Int,
			@no3_4YearOldsInt as Int,
			@vacUnder2sInt as Int,
			@vac2YearOldsInt as Int,
			@vac3_4YearOldsInt as Int,
			@fund2YearOldsInt as Int,
			@fund3_4YearOldsInt as Int,
			@numberAppreticesInt as Int,
			@numberVolunteersInt as Int,
			@volunteerHoursInt as Int,
			@numOtherSettingInt as Int

	IF @perDayUnder2 = ''
		  SET @perDayUnder2Dec = NULL
	ELSE
		  SET @perDayUnder2Dec = @perDayUnder2

	IF @perSessionUnder2 = ''
		  SET @perSessionUnder2Dec = NULL
	ELSE
		  SET @perSessionUnder2Dec = @perSessionUnder2

	IF @perWeekUnder2 = ''
		  SET @perWeekUnder2Dec = NULL
	ELSE
		  SET @perWeekUnder2Dec = @perWeekUnder2

	IF @perHourUnder2 = ''
		  SET @perHourUnder2Dec = NULL
	ELSE
		  SET @perHourUnder2Dec = @perHourUnder2

	IF @perDay2yrs = ''
		  SET @perDay2yrsDec = NULL
	ELSE
		  SET @perDay2yrsDec = @perDay2yrs

	IF @perSession2yrs = ''
		  SET @perSession2yrsDec = NULL
	ELSE
		  SET @perSession2yrsDec = @perSession2yrs

	IF @perWeek2yrs = ''
		  SET @perWeek2yrsDec = NULL
	ELSE
		  SET @perWeek2yrsDec = @perWeek2yrs

	IF @perHour2yrs = ''
		  SET @perHour2yrsDec = NULL
	ELSE
		  SET @perHour2yrsDec = @perHour2yrs

	IF @perDay3_4yrs = ''
		  SET @perDay3_4yrsDec = NULL
	ELSE
		  SET @perDay3_4yrsDec = @perDay3_4yrs

	IF @perSession3_4yrs = ''
		  SET @perSession3_4yrsDec = NULL
	ELSE
		  SET @perSession3_4yrsDec = @perSession3_4yrs

	IF @perWeek3_4yrs = ''
		  SET @perWeek3_4yrsDec = NULL
	ELSE
		  SET @perWeek3_4yrsDec = @perWeek3_4yrs

	IF @perHour3_4yrs = ''
		  SET @perHour3_4yrsDec = NULL
	ELSE
		  SET @perHour3_4yrsDec = @perHour3_4yrs
	
	IF ISNULL(@surveyID, '') = ''
		SET @surveyIDint = 0
	ELSE
		SET @surveyIDint = @surveyID
		
	IF @numWeeks = ''
		SET @numWeeksInt = NULL
	ELSE
		SET @numWeeksInt = @numWeeks

	IF @earlyYearsPlaces = ''
		SET @earlyYearsPlacesInt = NULL
	ELSE
		SET @earlyYearsPlacesInt = @earlyYearsPlaces

	IF @totalVacancies = ''
		SET @totalVacanciesInt = NULL
	ELSE
		SET @totalVacanciesInt = @totalVacancies

	IF @under2s = ''
		SET @under2sInt = NULL
	ELSE
		SET @under2sInt = @under2s

	IF @no2YearOlds = ''
		SET @no2YearOldsInt = NULL
	ELSE
		SET @no2YearOldsInt = @no2YearOlds

	IF @no3_4YearOlds = ''
		SET @no3_4YearOldsInt = NULL
	ELSE
		SET @no3_4YearOldsInt = @no3_4YearOlds

	IF @vacUnder2s = ''
		SET @vacUnder2sInt = NULL
	ELSE
		SET @vacUnder2sInt = @vacUnder2s

	IF @vac2YearOlds = ''
		SET @vac2YearOldsInt = NULL
	ELSE
		SET @vac2YearOldsInt = @vac2YearOlds

	IF @vac3_4YearOlds = ''
		SET @vac3_4YearOldsInt = NULL
	ELSE
		SET @vac3_4YearOldsInt = @vac3_4YearOlds

	IF @fund2YearOlds = ''
		SET @fund2YearOldsInt = NULL
	ELSE
		SET @fund2YearOldsInt = @fund2YearOlds

	IF @fund3_4YearOlds = ''
		SET @fund3_4YearOldsInt = NULL
	ELSE
		SET @fund3_4YearOldsInt = @fund3_4YearOlds

	IF @numberAppretices = ''
		SET @numberAppreticesInt = NULL
	ELSE
		SET @numberAppreticesInt = @numberAppretices

	IF @numberVolunteers = ''
		SET @numberVolunteersInt = NULL
	ELSE
		SET @numberVolunteersInt = @numberVolunteers

	IF @volunteerHours = ''
		SET @volunteerHoursInt = NULL
	ELSE
		SET @volunteerHoursInt = @volunteerHours

	IF @numOtherSetting = ''
		SET @numOtherSettingInt = NULL
	ELSE
		SET @numOtherSettingInt = @numOtherSetting
	
	
	
    IF @surveyIDint > 0
		UPDATE [dbo].[sufficiencySurveys]
		   SET [termTimeOnly] = @termTimeOnly
				,[numWeeks] = @numWeeksInt
				,[overnightCare] = @overnightCare
				,[openChanged12] = @openChanged12
				,[earlyYearsPlaces] = @earlyYearsPlacesInt
				,[totalVacancies] = @totalVacanciesInt
				,[noOffered12] = @noOffered12
				,[noHours12] = @noHours12
				,[under2s] = @under2sInt
				,[no2YearOlds] = @no2YearOldsInt
				,[no3_4YearOlds] = @no3_4YearOldsInt
				,[vacUnder2s] = @vacUnder2sInt
				,[vac2YearOlds] = @vac2YearOldsInt
				,[vac3_4YearOlds] = @vac3_4YearOldsInt
				,[weekendOvernight] = @weekendOvernight
				,[fund2YearOlds] = @fund2YearOldsInt
				,[fund3_4YearOlds] = @fund3_4YearOldsInt
				,[fund2yrsChange] = @fund2yrsChange
				,[fund3_4yrsChange] = @fund3_4yrsChange
				,[whatAreYourPaymen] = @whatAreYourPaymen
				,[perDayUnder2] = @perDayUnder2Dec
				,[perSessionUnder2] = @perSessionUnder2Dec
				,[perWeekUnder2] = @perWeekUnder2Dec
				,[perHourUnder2] = @perHourUnder2Dec
				,[perDay2yrs] = @perDay2yrsDec
				,[perSession2yrs] = @perSession2yrsDec
				,[perWeek2yrs] = @perWeek2yrsDec
				,[perHour2yrs] = @perHour2yrsDec
				,[perDay3_4yrs] = @perDay3_4yrsDec
				,[perSession3_4yrs] = @perSession3_4yrsDec
				,[perWeek3_4yrs] = @perWeek3_4yrsDec
				,[perHour3_4yrs] = @perHour3_4yrsDec
				,[feesPast12] = @feesPast12
				,[additionalCharges] = @additionalCharges
				,[noAdditonalCharges] = @noAdditonalCharges
				,[otherCharges] = @otherCharges
				,[numberAppretices] = @numberAppreticesInt
				,[numberVolunteers] = @numberVolunteersInt
				,[volunteerHours] = @volunteerHoursInt
				,[assistChildminder] = @assistChildminder
				,[numOtherSetting] = @numOtherSettingInt
				,[forThesewhereKno] = @forThesewhereKno
				,[anotherSettingOther] = @anotherSettingOther
				,[increaseCapacity12] = @increaseCapacity12
				,[planChanges] = @planChanges
				,[doYouHaveAnyConc] = @doYouHaveAnyConc
				,[pleaseSelectReason] = @pleaseSelectReason
				,[premisesIssue] = @premisesIssue
				,[otherConcern] = @otherConcern
				,[surveyComplete] = @surveyComplete
				,[updated_by] = @user
				,[updated_date] = GETDATE()
		 WHERE IDsurvey = @surveyIDint
    ELSE
		INSERT INTO [dbo].[sufficiencySurveys]
           ([IDsetting]
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
           ,[surveyComplete]
           ,[created_by]
           ,[created_date])
     VALUES
           (@provID
			,@termTimeOnly
			,@numWeeksInt
			,@overnightCare
			,@openChanged12
			,@earlyYearsPlacesInt
			,@totalVacanciesInt
			,@noOffered12
			,@noHours12
			,@under2sInt
			,@no2YearOldsInt
			,@no3_4YearOldsInt
			,@vacUnder2sInt
			,@vac2YearOldsInt
			,@vac3_4YearOldsInt
			,@weekendOvernight
			,@fund2YearOldsInt
			,@fund3_4YearOldsInt
			,@fund2yrsChange
			,@fund3_4yrsChange
			,@whatAreYourPaymen
			,@perDayUnder2Dec
			,@perSessionUnder2Dec
			,@perWeekUnder2Dec
			,@perHourUnder2Dec
			,@perDay2yrsDec
			,@perSession2yrsDec
			,@perWeek2yrsDec
			,@perHour2yrsDec
			,@perDay3_4yrsDec
			,@perSession3_4yrsDec
			,@perWeek3_4yrsDec
			,@perHour3_4yrsDec
			,@feesPast12
			,@additionalCharges
			,@noAdditonalCharges
			,@otherCharges
			,@numberAppreticesInt
			,@numberVolunteersInt
			,@volunteerHoursInt
			,@assistChildminder
			,@numOtherSettingInt
			,@forThesewhereKno
			,@anotherSettingOther
			,@increaseCapacity12
			,@planChanges
			,@doYouHaveAnyConc
			,@pleaseSelectReason
			,@premisesIssue
			,@otherConcern
			,@surveyComplete
			,@user
			,GETDATE())
    
END
