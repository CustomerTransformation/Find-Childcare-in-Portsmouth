USE [FStepChildCare_prod]
GO

/****** Object:  StoredProcedure [dbo].[ListCMschemes]    Script Date: 30/12/2019 14:42:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 11/07/2019
-- Description:	list of schemes for out of school clubs
-- =============================================
CREATE PROCEDURE [dbo].[ListCMschemes] 
	@selValue as varchar(20),
	@currValues as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF ISNULL(@currValues, 1) = 1
		SET @currValues = 1

    SELECT IDscheme as [name]
		  ,schemeDesc as [display]
	  FROM [dbo].[CMschemes]
	  WHERE inUse = @currValues
	  OR @currValues = 0
	  OR IDscheme = @selValue;
	  
END

GO


