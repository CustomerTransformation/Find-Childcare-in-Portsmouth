USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[SufficiencySurveyDates]    Script Date: 07/05/2019 10:25:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SufficiencySurveyDates](
	[IDsurvey] [int] IDENTITY(1,1) NOT NULL,
	[showSurveyFrom] [date] NULL,
	[surveyRequiredBy] [date] NULL,
	[stopShowingSurvey] [date] NULL,
	[surveyWhen] [varchar](1000) NULL,
	[isLatest] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


