object frmFindcds: TfrmFindcds
  Left = 384
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 416
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 386
    Width = 523
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
    Width = 523
    Height = 385
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 0
      Width = 522
      Height = 385
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 522
        Height = 385
        Align = alClient
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        TitleHeight = 30
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
      Height = 385
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 135
        Height = 385
        Align = alLeft
        ItemHeight = 13
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
    CommandText = 
      'declare @tb table('#13#10'[FieldName] varChar(50),'#13#10'[FieldName1] varCh' +
      'ar(50),'#13#10'[FieldDataType] varchar(15),'#13#10'[FieldKind] tinyint,'#13#10'[Fi' +
      'eldCaption] nvarchar(50),'#13#10'[Oper] varchar(15),'#13#10'[Condvalu] varch' +
      'ar(50),'#13#10'[Condvalu2] varchar(50)) --'#21019#24314#34920#21464#37327#13#10'select * from @tb'
    Params = <>
    ProviderName = 'dspRead'
    AfterScroll = dt1AfterScroll
    Left = 321
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
  object dspRead: TDataSetProvider
    DataSet = dtRead
    Options = [poAllowCommandText]
    Left = 232
    Top = 252
  end
  object dtRead: TADODataSet
    Connection = DM.ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'declare @tb table('#13#10'[FieldName] varChar(20),'#13#10'[FieldName1] varCh' +
      'ar(50),'#13#10'[FieldDataType] varchar(15),'#13#10'[FieldKind] tinyint,'#13#10'[Fi' +
      'eldCaption] nvarchar(50),'#13#10'[Oper] varchar(15),'#13#10'[Condvalu] varch' +
      'ar(50),'#13#10'[Condvalu2] varchar(50)) --'#21019#24314#34920#21464#37327#13#10'select * from @tb'
    Parameters = <>
    Left = 182
    Top = 252
  end
end
