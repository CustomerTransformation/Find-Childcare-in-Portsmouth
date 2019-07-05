USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[CMoptions]    Script Date: 07/05/2019 10:24:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMoptions](
	[name] [varchar](20) NOT NULL,
	[display] [varchar](50) NOT NULL,
	[inUse] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


