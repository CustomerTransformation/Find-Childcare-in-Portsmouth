USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[CMidaci]    Script Date: 07/05/2019 10:24:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMidaci](
	[ID_IDACI] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](5) NOT NULL,
	[display] [varchar](10) NOT NULL,
	[inUse] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


