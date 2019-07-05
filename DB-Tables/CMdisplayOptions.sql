USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[CMdisplayOptions]    Script Date: 07/05/2019 10:23:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMdisplayOptions](
	[dispCode] [varchar](5) NOT NULL,
	[dispOption] [varchar](20) NOT NULL,
	[inUse] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


