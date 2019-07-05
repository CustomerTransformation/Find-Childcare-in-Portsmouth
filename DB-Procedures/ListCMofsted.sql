USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[ListCMofsted]    Script Date: 07/05/2019 10:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 20/02/2018
-- Description:	List for Pick list of Child Minder Localities
-- =============================================
ALTER PROCEDURE [dbo].[ListCMofsted] 
	@listAll as varchar(5),
	@currentSel as int
AS
BEGIN
	SET NOCOUNT ON;

	IF @listAll is Null
		SET @listAll = 'No'

	SELECT IDofstedScore as name, score as display, scoreValue
	FROM CMofsted
	WHERE inUse = 1 
		OR @listAll = 'Yes'
		OR IDofstedScore = @currentSel
	Order By scoreValue
END


