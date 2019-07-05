USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[RegisteredCarersV3]    Script Date: 07/05/2019 10:24:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RegisteredCarersV3](
	[IDcarer] [int] IDENTITY(1,1) NOT NULL,
	[URN] [nvarchar](255) NULL,
	[settingName] [nvarchar](255) NULL,
	[toShow] [varchar](20) NULL,
	[typeID] [int] NULL,
	[phoneNo] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[website] [nvarchar](255) NULL,
	[ageFrom] [int] NULL,
	[ageTo] [int] NULL,
	[vacancies] [nvarchar](5) NULL,
	[overallOfstedJudgeID] [int] NULL,
	[options] [nvarchar](255) NULL,
	[notes] [nvarchar](550) NULL,
	[postcode] [nvarchar](10) NULL,
	[lat] [decimal](9, 6) NULL,
	[lng] [decimal](9, 6) NULL,
	[geoPoint] [geography] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[ofstedURL] [varchar](255) NULL,
	[updatePassword] [varchar](50) NULL,
	[mobile] [varchar](50) NULL,
	[idaciCode] [varchar](5) NULL,
	[pccEmail1] [varchar](255) NULL,
	[pccEmail2] [varchar](255) NULL,
	[schoolPickups] [varchar](500) NULL,
	[contactName] [varchar](255) NULL,
	[linkedOfficer] [varchar](150) NULL,
	[locality] [varchar](50) NULL,
	[ofstedDate] [date] NULL,
	[addInfo] [varchar](500) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


