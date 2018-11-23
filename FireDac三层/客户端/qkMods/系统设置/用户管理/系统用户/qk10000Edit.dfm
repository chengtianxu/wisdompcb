inherited frmqk10000Edit: Tfrmqk10000Edit
  Caption = 'frmqk10000Edit'
  ClientHeight = 593
  ClientWidth = 694
  ExplicitWidth = 710
  ExplicitHeight = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 694
    Height = 593
    ExplicitWidth = 694
    ExplicitHeight = 593
    inherited pnlTop: TPanel
      Width = 692
      ExplicitWidth = 692
      inherited pnlTopTool: TPanel
        Width = 690
        ExplicitWidth = 690
        inherited btnSave: TRzBitBtn
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitHeight = 23
        end
        inherited btnClose: TRzBitBtn
          ExplicitLeft = 75
          ExplicitTop = 0
          ExplicitHeight = 23
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 74
      Width = 692
      Height = 518
      Align = alClient
      Color = clWhite
      TabOrder = 1
      object pnl3: TPanel
        Left = 344
        Top = 1
        Width = 347
        Height = 516
        Align = alClient
        TabOrder = 0
        object pnl4: TPanel
          Left = 1
          Top = 1
          Width = 345
          Height = 26
          Align = alTop
          Color = clWhite
          TabOrder = 0
          object btnSelectAll: TRzButton
            Left = 1
            Top = 1
            Height = 24
            Align = alLeft
            Caption = #20840#36873
            TabOrder = 0
            OnClick = btnSelectAllClick
          end
        end
        object pgc1: TPageControl
          Left = 1
          Top = 27
          Width = 345
          Height = 488
          ActivePage = ts1
          Align = alClient
          TabOrder = 1
          object ts1: TTabSheet
            Caption = #27169#22359#26435#38480
            object eh2: TDBGridEh
              Left = 0
              Top = 0
              Width = 337
              Height = 459
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
      object pgc2: TPageControl
        Left = 1
        Top = 1
        Width = 343
        Height = 516
        ActivePage = ts2
        Align = alLeft
        TabOrder = 1
        object ts2: TTabSheet
          Caption = #27169#22359#21015#34920
          object eh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 335
            Height = 487
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
    end
    object pnl2: TPanel
      Left = 1
      Top = 26
      Width = 692
      Height = 48
      Align = alTop
      Color = clWhite
      TabOrder = 2
      object lbl1: TLabel
        Left = 25
        Top = 16
        Width = 52
        Height = 13
        Caption = #29992#25143#21517#65306
      end
      object edtLoginName: TRzDBEdit
        Left = 81
        Top = 13
        Width = 121
        Height = 21
        DataSource = dsgSysUser
        DataField = 'LoginName'
        ReadOnly = True
        Color = clInfoBk
        TabOrder = 0
      end
      object cbxActive1: TDBCheckBox
        Left = 232
        Top = 16
        Width = 97
        Height = 17
        Caption = #24320#36890'ERP'
        DataField = 'Active'
        DataSource = dsgSysUser
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  object ds1: TDataSource
    DataSet = mteh1
    Left = 264
    Top = 477
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
    Left = 209
    Top = 477
  end
  object mteh1: TMemTableEh
    Params = <>
    ReadOnly = True
    AfterScroll = mteh1AfterScroll
    Left = 97
    Top = 253
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
    Left = 489
    Top = 453
  end
  object ds2: TDataSource
    DataSet = mtBaseRight
    Left = 544
    Top = 456
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
    Left = 385
    Top = 405
  end
  object mtgSysUser: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 187
    Top = 263
  end
  object dsgSysUser: TDataSource
    DataSet = mtgSysUser
    Left = 256
    Top = 265
  end
end
