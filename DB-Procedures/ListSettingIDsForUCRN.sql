USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListSettingIDsForUCRN]    Script Date: 07/05/2019 10:17:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 18/06/2018
-- Description:	Get the Provider for the UCRN
-- =============================================
ALTER PROCEDURE [dbo].[ListSettingIDsForUCRN] 
	@UCRN as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @counter as int = 0
	
	--DROP TABLE #Temp
	
    SELECT *
    INTO #Temp
    FROM(
    SELECT row_number() OVER (ORDER BY settingName) name
		  ,[settingID] as settingID
		  ,stg.settingName as display
	  FROM [dbo].[ProviderUpdaters] upd
	  inner join dbo.RegisteredCarersV3 stg
	  ON upd.settingID = stg.IDcarer
	  WHERE [provUCRN] = @UCRN
	  ) lst

	
	SELECT @counter = MAX(name)
	FROM #Temp
	
	-- if there is only one record then name needs to have value 1 so can default in otherwise list starting with name as 2
	
	if @counter > 1 
		SELECT name + 1 as name, settingID, display FROM #Temp
	ELSE 
		SELECT * FROM #Temp
	
	DROP TABLE #Temp

END


