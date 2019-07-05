USE [ProdChildCare]
GO

/****** Object:  Table [dbo].[CMofsted]    Script Date: 07/05/2019 10:24:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CMofsted](
	[IDofstedScore] [int] IDENTITY(1,1) NOT NULL,
	[score] [varchar](25) NULL,
	[scoreValue] [int] NULL,
	[inUse] [bit] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CMofsted] ADD  CONSTRAINT [DF_CMofsted_inUse]  DEFAULT ((1)) FOR [inUse]
GO


