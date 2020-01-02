USE [FStepChildCare_prod]
GO

/****** Object:  StoredProcedure [dbo].[ListCMoptionsPublic]    Script Date: 30/12/2019 14:44:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 12/07/2019
-- Description:	list of options for use on the public search form
-- =============================================
CREATE PROCEDURE [dbo].[ListCMoptionsPublic] 
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT [name]
		  ,[fullDesc] as display
	  FROM [dbo].[CMoptions]
	  WHERE inUse = 1;
	  
END

GO


