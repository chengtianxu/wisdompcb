inherited frmqk1005002GridEdit: Tfrmqk1005002GridEdit
  ClientHeight = 541
  ClientWidth = 1058
  ExplicitWidth = 1074
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 1058
    Height = 541
    ExplicitWidth = 1058
    ExplicitHeight = 541
    object spl1: TSplitter [0]
      Left = 505
      Top = 26
      Width = 10
      Height = 514
      ExplicitLeft = 603
      ExplicitTop = 18
    end
    inherited pnlTop: TPanel
      Width = 1056
      ExplicitWidth = 1056
      inherited pnlTopTool: TPanel
        Width = 1054
        ExplicitWidth = 1054
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
      Top = 26
      Width = 504
      Height = 514
      Align = alLeft
      TabOrder = 1
      object eh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 502
        Height = 512
        Align = alClient
        DataSource = dsGrid
        DynProps = <>
        PopupMenu = pm1
        ReadOnly = True
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TName'
            Footers = <>
            Title.Caption = #34920#26684#21517#31216
            Width = 250
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BakNote'
            Footers = <>
            Title.Caption = #35828#26126
            Width = 300
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object pnl2: TPanel
      Left = 515
      Top = 26
      Width = 542
      Height = 514
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 593
      ExplicitWidth = 464
    end
  end
  object mtGrid: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 89
    Top = 178
  end
  object mtGridDetail: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 338
    Top = 188
  end
  object dsGrid: TDataSource
    DataSet = mteh1
    Left = 208
    Top = 184
  end
  object mteh1: TMemTableEh
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'mteh1Index1'
        Fields = 'TName'
        Options = [ixUnique]
      end>
    Params = <>
    StoreDefs = True
    Left = 145
    Top = 146
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 297
    Top = 346
    object mniN1: TMenuItem
      Tag = 200
      Caption = #26032#22686#21516#32423
      OnClick = mniN1Click
    end
    object mniN2: TMenuItem
      Tag = 201
      Caption = #26032#22686#19979#32423
      OnClick = mniN1Click
    end
    object mniN3: TMenuItem
      Tag = 202
      Caption = #32534#36753
      OnClick = mniN3Click
    end
    object mniN4: TMenuItem
      Tag = 203
      Caption = #21024#38500
      OnClick = mniN4Click
    end
  end
end
