object Findcds_frm: TFindcds_frm
  Left = 384
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 364
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 334
    Width = 527
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 163
      Top = 2
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 278
      Top = 2
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 1
    Width = 527
    Height = 333
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 0
      Width = 526
      Height = 333
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 526
        Height = 333
        Align = alClient
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        TitleHeight = 23
        OnGetCellParams = DBGridEh1GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'FieldName'
            Footers = <>
            Visible = False
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'FieldCaption'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 105
          end
          item
            EditButtons = <>
            FieldName = 'FieldKind'
            Footers = <>
            Visible = False
          end
          item
            DropDownRows = 8
            EditButtons = <>
            FieldName = 'Oper'
            Footers = <>
            Title.Alignment = taCenter
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'Condvalu'
            Footers = <>
            Title.Alignment = taCenter
            Width = 160
            OnEditButtonClick = DBGridEh1Columns4EditButtonClick
          end
          item
            EditButtons = <>
            FieldName = 'Condvalu2'
            Footers = <>
            Title.Alignment = taCenter
            Width = 160
          end
          item
            EditButtons = <>
            FieldName = 'FieldDataType'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'FieldName1'
            Footers = <>
            Visible = False
          end>
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 1
      Height = 333
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 135
        Height = 333
        Align = alLeft
        ItemHeight = 12
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 136
        Top = 112
        Width = 25
        Height = 25
        Caption = '>>'
        TabOrder = 1
      end
      object BitBtn2: TBitBtn
        Left = 136
        Top = 160
        Width = 25
        Height = 25
        Caption = '<<'
        TabOrder = 2
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dt1
    Left = 336
    Top = 160
  end
  object dt1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRead'
    AfterScroll = dt1AfterScroll
    Left = 329
    Top = 241
    object dt1FieldCaption: TWideStringField
      DisplayLabel = #26597#35810#26465#20214
      FieldName = 'FieldCaption'
      Size = 50
    end
    object dt1FieldKind: TSmallintField
      FieldName = 'FieldKind'
    end
    object dt1Oper: TStringField
      DisplayLabel = #26465#20214#20851#31995
      FieldName = 'Oper'
      OnGetText = dt1OperGetText
      OnSetText = dt1OperSetText
      Size = 15
    end
    object dt1Condvalu: TStringField
      DisplayLabel = #26597#35810#20540
      FieldName = 'Condvalu'
      OnChange = dt1CondvaluChange
      OnSetText = dt1CondvaluSetText
      Size = 50
    end
    object dt1Condvalu2: TStringField
      DisplayLabel = #26597#35810#20540'2'
      FieldName = 'Condvalu2'
      OnSetText = dt1CondvaluSetText
      Size = 50
    end
    object dt1FieldDataType: TStringField
      FieldName = 'FieldDataType'
      Size = 15
    end
    object dt1FieldName: TStringField
      DisplayLabel = #23383#27573#21517
      FieldName = 'FieldName'
      Size = 50
    end
    object dt1FieldName1: TStringField
      FieldName = 'FieldName1'
      Size = 50
    end
  end
end
