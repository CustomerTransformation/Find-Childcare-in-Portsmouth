USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[CMlocality]    Script Date: 07/05/2019 10:24:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMlocality](
	[IDlocality] [int] IDENTITY(1,1) NOT NULL,
	[localityName] [varchar](20) NULL,
	[inUse] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CMlocality] ADD  CONSTRAINT [DF_CMlocality_inUse]  DEFAULT ((1)) FOR [inUse]
GO


