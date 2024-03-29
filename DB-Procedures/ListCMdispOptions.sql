USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListCMdispOptions]    Script Date: 07/05/2019 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 11/06/2018
-- Description:	list the display options
-- =============================================
ALTER PROCEDURE [dbo].[ListCMdispOptions] 
	@selValue as varchar(20),
	@currValues as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF ISNULL(@currValues, 1) = 1
		SET @currValues = 1

    SELECT dispCode as [name] 
		  ,dispOption as [display]
	  FROM [dbo].[CMdisplayOptions]
	  WHERE inUse = @currValues
	  OR @currValues = 0
	  OR dispCode = @selValue;
	  
END


