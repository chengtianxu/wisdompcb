inherited frmqk1604001DepterpRights: Tfrmqk1604001DepterpRights
  Caption = 'frmqk1604001DepterpRights'
  ClientHeight = 626
  ClientWidth = 686
  ExplicitWidth = 702
  ExplicitHeight = 665
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 686
    Height = 626
    ExplicitWidth = 686
    ExplicitHeight = 626
    inherited pnlTop: TPanel
      Width = 684
      ExplicitWidth = 684
    end
    object pgc2: TPageControl
      Left = 1
      Top = 26
      Width = 336
      Height = 599
      ActivePage = ts1
      Align = alLeft
      TabOrder = 1
      object ts1: TTabSheet
        Caption = #27169#22359#21015#34920
        object eh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 328
          Height = 570
          Align = alClient
          DataSource = ds1
          DynProps = <>
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ModName'
              Footers = <>
              Title.Caption = #27169#22359#21015#34920
              Width = 300
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object pgc1: TPageControl
      Left = 337
      Top = 26
      Width = 348
      Height = 599
      ActivePage = ts2
      Align = alClient
      TabOrder = 2
      object ts2: TTabSheet
        Caption = #27169#22359#26435#38480
        object eh2: TDBGridEh
          Left = 0
          Top = 0
          Width = 340
          Height = 570
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          AllowedSelections = [gstRectangle, gstColumns]
          DataSource = ds2
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          TabOrder = 0
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'RightID'
              Footers = <>
              ReadOnly = True
              Title.Caption = #32534#21495
              Width = 35
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'checked'
              Footers = <>
              Title.Caption = #36873
              Width = 25
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'RightName'
              Footers = <>
              ReadOnly = True
              Title.Caption = #26435#38480#21517#31216
              Width = 150
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object ds1: TDataSource
    DataSet = mteh1
    Left = 296
    Top = 568
  end
  object mt1: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 241
    Top = 565
  end
  object mtRights: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 417
    Top = 493
  end
  object mteh1: TMemTableEh
    Params = <>
    ReadOnly = True
    AfterScroll = mteh1AfterScroll
    Left = 129
    Top = 341
  end
  object mtBaseRight: TFDMemTable
    AfterPost = mtBaseRightAfterPost
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 521
    Top = 541
  end
  object ds2: TDataSource
    DataSet = mtBaseRight
    Left = 576
    Top = 544
  end
end
