USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[CMtype]    Script Date: 07/05/2019 10:24:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMtype](
	[IDtype] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](30) NULL,
	[inUse] [bit] NOT NULL,
	[termTimeOnly] [varchar](5) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


