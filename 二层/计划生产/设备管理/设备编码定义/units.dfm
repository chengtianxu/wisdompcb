object Frm_units: TFrm_units
  Left = 494
  Top = 185
  Width = 363
  Height = 551
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21333#20301#25628#32034
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 88
      Top = 14
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 144
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 355
    Height = 442
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'unit_code'
        Footers = <>
        Title.Caption = #21333#20301#20195#30721
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'unit_name'
        Footers = <>
        Title.Caption = #21333#20301#21517#31216
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 483
    Width = 355
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object ADO02: TADODataSet
    Connection = DM.ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,unit_code,unit_name from data0002 where unit_name li' +
      'ke '#39'%'#39'+:unit_name+'#39'%'#39
    Parameters = <
      item
        Name = 'unit_name+'#39'%'#39
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 32
    Top = 424
    object ADO02rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO02unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADO02unit_name: TStringField
      FieldName = 'unit_name'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO02
    Left = 96
    Top = 424
  end
end
