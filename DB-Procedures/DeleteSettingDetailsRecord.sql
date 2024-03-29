USE [ProdChildCare]
GO
/****** Object:  StoredProcedure [dbo].[DeleteSettingDetailsRecord]    Script Date: 07/05/2019 09:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniel Gregory
-- Create date: 04/02/2019
-- Description:	Delete selected record
-- =============================================
ALTER PROCEDURE [dbo].[DeleteSettingDetailsRecord]
		@IDcarer as int
		,@password as varchar(20)
		,@countChanges as int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @password = 'DCG231' AND ISNULL(@IDcarer, '') != ''
	BEGIN
		DELETE FROM [dbo].[RegisteredCarersV3]
			  WHERE IDcarer = @IDcarer
				AND UPPER([settingName]) LIKE '%DELETE%';
		 SELECT '' as selectProvider
				,@countChanges + 1 as countChanges;
	END	
	ELSE
		SELECT '<div style="color:red"><center><strong>Not Delete please check setting name and password</strong></center></div>' as msgDelete;

END


