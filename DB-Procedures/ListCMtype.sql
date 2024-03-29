USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListCMtype]    Script Date: 07/05/2019 10:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 20/02/2018
-- Description:	List for Pick list of Child Minder Localities
-- =============================================
ALTER PROCEDURE [dbo].[ListCMtype] 
	@listAll as varchar(5),
	@currentSel as int
AS
BEGIN
	SET NOCOUNT ON;

	IF @listAll is Null
		SET @listAll = 'No'

	SELECT IDtype as name, typeName as display
	FROM CMtype
	WHERE inUse = 1 
		OR @listAll = 'Yes'
		OR IDtype = @currentSel
	Order By typeName
END


