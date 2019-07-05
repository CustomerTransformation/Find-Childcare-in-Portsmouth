USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[ProviderUpdaters]    Script Date: 07/05/2019 10:24:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ProviderUpdaters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[provUCRN] [int] NOT NULL,
	[provEmail] [varchar](255) NOT NULL,
	[settingID] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


