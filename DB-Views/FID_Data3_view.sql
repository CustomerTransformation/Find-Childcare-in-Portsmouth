USE [ProdChildCare]
GO

/****** Object:  View [dbo].[FID_Data3_view]    Script Date: 07/05/2019 10:31:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FID_Data3_view]
AS
SELECT     dbo.RegisteredCarersV3.IDcarer AS link, CASE WHEN toShow LIKE '%hNm%' THEN 'Yes' ELSE '' END AS Name, CASE WHEN toShow LIKE '%hPc%' THEN 'Yes' ELSE '' END AS [Post Code], 
                      CASE WHEN toShow LIKE '%hAl%' THEN 'Yes' ELSE '' END AS [All details], CASE WHEN toShow LIKE '%hCnl%' THEN 'Yes' ELSE '' END AS [Contact Tel], 
                      CASE WHEN toShow LIKE '%hEm%' THEN 'Yes' ELSE '' END AS Email, dbo.CMtype.typeName AS Type, dbo.RegisteredCarersV3.URN, dbo.RegisteredCarersV3.settingName, 
                      dbo.RegisteredCarersV3.phoneNo AS ContactPhone, dbo.RegisteredCarersV3.mobile, dbo.RegisteredCarersV3.contactName, dbo.RegisteredCarersV3.email AS PublicEmail, 
                      dbo.RegisteredCarersV3.pccEmail1, dbo.RegisteredCarersV3.pccEmail2, dbo.RegisteredCarersV3.postcode, dbo.RegisteredCarersV3.locality, dbo.RegisteredCarersV3.linkedOfficer, 
                      dbo.CMidaci.display AS IDACI, dbo.RegisteredCarersV3.website, dbo.RegisteredCarersV3.ageFrom, dbo.RegisteredCarersV3.ageTo, dbo.RegisteredCarersV3.vacancies, 
                      dbo.RegisteredCarersV3.schoolPickups, dbo.CMofsted.score AS OfstedGrade, dbo.RegisteredCarersV3.ofstedDate, dbo.RegisteredCarersV3.ofstedURL AS OfstedReport, 
                      CASE WHEN options LIKE '%2yearFund%' THEN 'Yes' ELSE '' END AS [2YrFunding], CASE WHEN options LIKE '%3_4yearFund%' THEN 'Yes' ELSE '' END AS [3&4YrUniversal], 
                      CASE WHEN options LIKE '%3_4yearExtend%' THEN 'Yes' ELSE '' END AS [30HrFunding], CASE WHEN options LIKE '%taxFree%' THEN 'Yes' ELSE '' END AS TaxFreeChildcare, 
                      dbo.RegisteredCarersV3.addInfo, dbo.RegisteredCarersV3.notes, dbo.RegisteredCarersV3.CreatedBy, dbo.RegisteredCarersV3.CreatedDate, dbo.RegisteredCarersV3.UpdatedBy, 
                      dbo.RegisteredCarersV3.UpdatedDate, dbo.UpdaterEmails(dbo.RegisteredCarersV3.IDcarer) AS Updaters
FROM         dbo.RegisteredCarersV3 LEFT OUTER JOIN
                      dbo.CMofsted ON dbo.RegisteredCarersV3.overallOfstedJudgeID = dbo.CMofsted.IDofstedScore LEFT OUTER JOIN
                      dbo.CMtype ON dbo.RegisteredCarersV3.typeID = dbo.CMtype.IDtype LEFT OUTER JOIN
                      dbo.CMidaci ON dbo.RegisteredCarersV3.idaciCode = dbo.CMidaci.name

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[23] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RegisteredCarersV3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 313
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 18
         End
         Begin Table = "CMofsted"
            Begin Extent = 
               Top = 198
               Left = 536
               Bottom = 317
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CMtype"
            Begin Extent = 
               Top = 3
               Left = 551
               Bottom = 107
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CMidaci"
            Begin Extent = 
               Top = 194
               Left = 280
               Bottom = 313
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 39
         Width = 284
         Width = 960
         Width = 1215
         Width = 1320
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FID_Data3_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7875
         Alias = 1740
         Table = 2265
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FID_Data3_view'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FID_Data3_view'
GO


