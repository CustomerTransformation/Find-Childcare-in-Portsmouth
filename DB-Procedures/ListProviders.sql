USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListProviders]    Script Date: 07/05/2019 10:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Gregory
-- Create date: 01/05/2018
-- Description:	List providers for pick list
--				05/02/2019 added in parameter to
--					pass number so can update on change in
--					the firmstep form isn't used in the procedure
-- =============================================
ALTER PROCEDURE [dbo].[ListProviders] 
	@typeID as int
	,@countChanges as int = 0
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @typeID IS NULL
		SET @typeID = 999
	ELSE IF @typeID = 0
		SET @typeID = 999
	

    SELECT [IDcarer] as name
      ,[settingName] + ' (' + isnull(ty.typeName,'') + ')' as display
  FROM [dbo].[RegisteredCarersV3] rc
  LEFT JOIN dbo.CMtype ty on rc.typeID = ty.IDtype
  WHERE rc.typeID = @typeID 
		OR @typeID = 999
	ORDER BY [settingName]
  
  
END
