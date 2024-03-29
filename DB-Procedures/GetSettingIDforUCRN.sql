USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[GetSettingIDforUCRN]    Script Date: 07/05/2019 10:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 18/06/2018
-- Description:	Get the Provider for the UCRN
-- =============================================
ALTER PROCEDURE [dbo].[GetSettingIDforUCRN] 
	@UCRN as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT TOP 1 [settingID] as selectProvider
	  FROM [dbo].[ProviderUpdaters]
	  WHERE [provUCRN] = @UCRN

END

