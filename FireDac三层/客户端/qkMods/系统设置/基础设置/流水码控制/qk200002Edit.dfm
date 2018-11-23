inherited frmqk200002Edit: Tfrmqk200002Edit
  Caption = 'frmqk200002Edit'
  ClientHeight = 573
  ClientWidth = 825
  ExplicitWidth = 841
  ExplicitHeight = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 825
    Height = 573
    ExplicitWidth = 825
    ExplicitHeight = 573
    inherited pnlTop: TPanel
      Width = 823
      ExplicitWidth = 823
      inherited pnlTopTool: TPanel
        Width = 821
        ExplicitWidth = 821
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
      Left = 201
      Top = 26
      Width = 521
      Height = 546
      Align = alLeft
      TabOrder = 1
      object lbl1: TLabel
        Left = 1
        Top = 1
        Width = 519
        Height = 39
        Align = alTop
        AutoSize = False
        Caption = #35828#26126#65306#27969#27700#30721#32452#25104'= '#22836'+'#27969#27700#21495'+'#23614' '#65288#22836#21644#23614#25353#24207#21495#25490#24207#65289
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 557
      end
      object lbl2: TLabel
        Left = 2
        Top = 511
        Width = 119
        Height = 24
        AutoSize = False
        Caption = #26368#32456#27969#27700#30721#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblView: TLabel
        Left = 214
        Top = 511
        Width = 19
        Height = 19
        Caption = #26080
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object gp1: TRzGroupBox
        Left = 1
        Top = 40
        Width = 519
        Height = 196
        Align = alTop
        Caption = #22836
        TabOrder = 0
        object eh1: TDBGridEh
          Left = 1
          Top = 14
          Width = 517
          Height = 181
          Align = alClient
          DataSource = dsHeader
          DynProps = <>
          TabOrder = 0
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SeqNo'
              Footers = <>
              Title.Caption = #24207#21495
              Width = 45
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Value'
              Footers = <>
              Title.Caption = #20540
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object gp2: TRzGroupBox
        Left = 1
        Top = 308
        Width = 519
        Height = 196
        Align = alTop
        Caption = #23614
        TabOrder = 1
        object eh2: TDBGridEh
          Left = 1
          Top = 14
          Width = 517
          Height = 181
          Align = alClient
          DataSource = dsEnd
          DynProps = <>
          TabOrder = 0
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SeqNO'
              Footers = <>
              Title.Caption = #24207#21495
              Width = 45
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Value'
              Footers = <>
              Title.Caption = #20540
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object gp3: TRzGroupBox
        Left = 1
        Top = 236
        Width = 519
        Height = 72
        Align = alTop
        Caption = #24403#21069#27969#27700#21495
        TabOrder = 2
        object edtseed: TRzDBEdit
          Left = 88
          Top = 24
          Width = 255
          Height = 32
          DataSource = dsSeed
          DataField = 'seed'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object btn1: TRzButton
        Left = 109
        Top = 507
        Caption = #26597#30475
        TabOrder = 3
        OnClick = btn1Click
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 26
      Width = 200
      Height = 546
      Align = alLeft
      TabOrder = 2
      object lbl3: TLabel
        Left = 10
        Top = 6
        Width = 119
        Height = 24
        AutoSize = False
        Caption = #32534#30721#21517#31216#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 10
        Top = 70
        Width = 175
        Height = 24
        AutoSize = False
        Caption = #32534#30721#31867#22411'('#40664#35748'0)'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 10
        Top = 142
        Width = 175
        Height = 24
        AutoSize = False
        Caption = #35828#26126#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edtseed1: TRzDBEdit
        Left = 10
        Top = 32
        Width = 156
        Height = 24
        DataSource = dsSeed
        DataField = 'seedName'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtseedName: TRzDBEdit
        Left = 10
        Top = 100
        Width = 156
        Height = 24
        DataSource = dsSeed
        DataField = 'TType'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtType: TRzDBEdit
        Left = 10
        Top = 172
        Width = 156
        Height = 24
        DataSource = dsSeed
        DataField = 'BakNote'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object mtSeed: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 168
  end
  object mtheader: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 496
    Top = 240
  end
  object mtEnd: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 576
    Top = 240
  end
  object dsSeed: TDataSource
    DataSet = mtSeed
    Left = 354
    Top = 178
  end
  object dsHeader: TDataSource
    DataSet = mtheader
    Left = 490
    Top = 302
  end
  object dsEnd: TDataSource
    DataSet = mtEnd
    Left = 577
    Top = 297
  end
end
