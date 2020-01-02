USE [FStepCodeTables_prod]
GO

/****** Object:  StoredProcedure [dbo].[pickListFromCSV]    Script Date: 31/12/2019 15:47:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 17/10/2019
-- Description:	to produce output for pick lists from csv input
-- =============================================
CREATE PROCEDURE [dbo].[pickListFromCSV]
		@listCSV as varchar(8000)
AS
BEGIN
	SET NOCOUNT ON;

    
	SELECT Item as display, Item as name
	FROM dbo.DelimitedSplit8K(@listCSV,',')
END
GO


