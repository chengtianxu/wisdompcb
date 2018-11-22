object Form_Supplier: TForm_Supplier
  Left = 421
  Top = 129
  Width = 547
  Height = 563
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20379#24212#21830#25628#32034
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 14
      Width = 78
      Height = 13
      Caption = #20379#24212#21830#20195#30721#65306
    end
    object Edit1: TEdit
      Left = 184
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 312
      Top = 8
      Width = 25
      Height = 24
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 488
    Width = 539
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnEnter: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnEnterClick
    end
    object btnCancel: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 539
    Height = 447
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        FieldName = 'CODE'
        Footers = <>
        Title.Caption = #20379#24212#21830#20195#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'SUPPLIER_NAME'
        Footers = <>
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 306
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #20379#24212#21830#31616#31216
        Width = 126
      end>
  end
  object ADO23: TADODataSet
    Connection = DM.ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select RKEY,CODE,SUPPLIER_NAME,ABBR_NAME,ANALYSIS_CODE1,EDI_ID f' +
      'rom Data0023 where code like +'#39'%'#39'+:code+'#39'%'#39
    Parameters = <
      item
        Name = 'code+'#39'%'#39
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 24
    Top = 456
    object ADO23RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO23CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADO23SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO23ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADO23ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
    object ADO23EDI_ID: TStringField
      FieldName = 'EDI_ID'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO23
    Left = 80
    Top = 456
  end
  object ADO189: TADODataSet
    Connection = DM.ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT Top 1 Data0189.STATE_TAX FROM Data0024 INNER JOIN Data018' +
      '9 ON Data0024.CITY_TAX_PTR = Data0189.RKEY'#13#10'WHERE Data0024.SUPPL' +
      'IER_PTR =:rkey23 '
    Parameters = <
      item
        Name = 'rkey23'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 144
    Top = 456
    object ADO189STATE_TAX: TBCDField
      FieldName = 'STATE_TAX'
      Precision = 4
      Size = 2
    end
  end
end
