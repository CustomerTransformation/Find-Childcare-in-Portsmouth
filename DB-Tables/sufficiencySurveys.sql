USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[sufficiencySurveys]    Script Date: 07/05/2019 10:25:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sufficiencySurveys](
	[IDsurvey] [int] IDENTITY(1,1) NOT NULL,
	[IDsetting] [int] NULL,
	[termTimeOnly] [varchar](5) NULL,
	[numWeeks] [int] NULL,
	[overnightCare] [varchar](5) NULL,
	[openChanged12] [varchar](50) NULL,
	[earlyYearsPlaces] [int] NULL,
	[totalVacancies] [int] NULL,
	[noOffered12] [varchar](15) NULL,
	[noHours12] [varchar](15) NULL,
	[under2s] [int] NULL,
	[no2YearOlds] [int] NULL,
	[no3_4YearOlds] [int] NULL,
	[vacUnder2s] [int] NULL,
	[vac2YearOlds] [int] NULL,
	[vac3_4YearOlds] [int] NULL,
	[weekendOvernight] [varchar](310) NULL,
	[fund2YearOlds] [int] NULL,
	[fund3_4YearOlds] [int] NULL,
	[fund2yrsChange] [varchar](50) NULL,
	[fund3_4yrsChange] [varchar](50) NULL,
	[whatAreYourPaymen] [varchar](50) NULL,
	[perDayUnder2] [decimal](5, 2) NULL,
	[perSessionUnder2] [decimal](5, 2) NULL,
	[perWeekUnder2] [decimal](5, 2) NULL,
	[perHourUnder2] [decimal](5, 2) NULL,
	[perDay2yrs] [decimal](5, 2) NULL,
	[perSession2yrs] [decimal](5, 2) NULL,
	[perWeek2yrs] [decimal](5, 2) NULL,
	[perHour2yrs] [decimal](5, 2) NULL,
	[perDay3_4yrs] [decimal](5, 2) NULL,
	[perSession3_4yrs] [decimal](5, 2) NULL,
	[perWeek3_4yrs] [decimal](5, 2) NULL,
	[perHour3_4yrs] [decimal](5, 2) NULL,
	[feesPast12] [varchar](50) NULL,
	[additionalCharges] [varchar](120) NULL,
	[noAdditonalCharges] [varchar](20) NULL,
	[otherCharges] [varchar](310) NULL,
	[numberAppretices] [int] NULL,
	[numberVolunteers] [int] NULL,
	[volunteerHours] [int] NULL,
	[assistChildminder] [varchar](5) NULL,
	[numOtherSetting] [int] NULL,
	[forThesewhereKno] [varchar](200) NULL,
	[anotherSettingOther] [varchar](310) NULL,
	[increaseCapacity12] [varchar](5) NULL,
	[planChanges] [varchar](310) NULL,
	[doYouHaveAnyConc] [varchar](5) NULL,
	[pleaseSelectReason] [varchar](200) NULL,
	[premisesIssue] [varchar](310) NULL,
	[otherConcern] [varchar](310) NULL,
	[surveyComplete] [varchar](5) NULL,
	[created_by] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [varchar](255) NULL,
	[updated_date] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


