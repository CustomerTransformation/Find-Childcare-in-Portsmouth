USE [ProdChildCare]
GO

/****** Object:  View [dbo].[SurveySummaryInfo]    Script Date: 07/05/2019 10:32:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SurveySummaryInfo]
AS
SELECT     dbo.RegisteredCarersV3.IDcarer, dbo.RegisteredCarersV3.settingName AS [Setting name], dbo.CMtype.typeName AS [Provider type], 
                      dbo.RegisteredCarersV3.email AS [Main contact email], dbo.RegisteredCarersV3.pccEmail1 AS [email 1 for PCC use], 
                      dbo.RegisteredCarersV3.pccEmail2 AS [email 2 for PCC use], dbo.ProviderUpdaters.provEmail AS [Registered updater email], 
                      dbo.sufficiencySurveys.surveyComplete AS [Survey complete], dbo.sufficiencySurveys.created_by AS [Survey started by], 
                      dbo.sufficiencySurveys.created_date AS [Date survey started], dbo.sufficiencySurveys.updated_by AS [Survey last updated by], 
                      dbo.sufficiencySurveys.updated_date AS [Date survey updated]
FROM         dbo.RegisteredCarersV3 LEFT OUTER JOIN
                      dbo.CMtype ON dbo.RegisteredCarersV3.typeID = dbo.CMtype.IDtype LEFT OUTER JOIN
                      dbo.ProviderUpdaters ON dbo.RegisteredCarersV3.IDcarer = dbo.ProviderUpdaters.settingID LEFT OUTER JOIN
                      dbo.sufficiencySurveys ON dbo.RegisteredCarersV3.IDcarer = dbo.sufficiencySurveys.IDsetting

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[34] 2[6] 3) )"
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
               Bottom = 372
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CMtype"
            Begin Extent = 
               Top = 125
               Left = 258
               Bottom = 244
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProviderUpdaters"
            Begin Extent = 
               Top = 71
               Left = 695
               Bottom = 241
               Right = 855
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sufficiencySurveys"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 370
               Right = 658
            End
            DisplayFlags = 280
            TopColumn = 36
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2985
         Width = 4155
         Width = 3675
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 4110
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SurveySummaryInfo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SurveySummaryInfo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SurveySummaryInfo'
GO


