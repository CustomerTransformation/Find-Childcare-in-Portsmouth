USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListCMoptions]    Script Date: 07/05/2019 10:14:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 01/05/2018
-- Description:	list of options
-- =============================================
ALTER PROCEDURE [dbo].[ListCMoptions] 
	@selValue as varchar(20),
	@currValues as bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF ISNULL(@currValues, 1) = 1
		SET @currValues = 1

    SELECT [name]
		  ,[display]
	  FROM [dbo].[CMoptions]
	  WHERE inUse = @currValues
	  OR @currValues = 0
	  OR name = @selValue;
	  
END

