USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[AuthoriseUpdater]    Script Date: 07/05/2019 09:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 15/06/2018
-- Description:	Update autorised updaters of Setting Details
-- =============================================
ALTER PROCEDURE [dbo].[AuthoriseUpdater] 
	@provID as int
	,@provUCRN as int
	,@provEmail as varchar(255)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO [dbo].[ProviderUpdaters]
           ([provUCRN]
           ,[provEmail]
           ,[settingID])
     VALUES
           (@provUCRN
           ,@provEmail
           ,@provID)

END

