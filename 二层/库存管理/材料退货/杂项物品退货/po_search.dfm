object Form2: TForm2
  Left = 283
  Top = 102
  Width = 623
  Height = 590
  Caption = #37319#36141#35746#21333#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 355
    Width = 615
    Height = 6
    Cursor = crVSplit
    Align = alBottom
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 361
    Width = 615
    Height = 168
    Align = alBottom
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION2'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_PRICE'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY_RECEIVED'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recd_date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 108
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 615
    Height = 323
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #37319#36141#35746#21333#21495#30721
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Title.Caption = #35746#21333#26085#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #31867#22411
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 529
    Width = 615
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 231
      Top = 7
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 311
      Top = 7
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 124
      Top = 9
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37319#36141#35746#21333#21495#30721':'
    end
    object Edit1: TEdit
      Left = 214
      Top = 5
      Width = 157
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 378
      Top = 3
      Width = 25
      Height = 25
      TabOrder = 1
      TabStop = False
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
  object DataSource1: TDataSource
    DataSet = AQ70
    Left = 424
    Top = 316
  end
  object AQ70: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQ70CalcFields
    ProcedureName = 'ep042;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@type'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = 'M'
      end>
    Left = 456
    Top = 316
    object AQ70RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object AQ70CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object AQ70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object AQ70po_type: TStringField
      FieldName = 'po_type'
      FixedChar = True
      Size = 1
    end
    object AQ70status: TWordField
      FieldName = 'status'
    end
    object AQ70CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 5
    end
    object AQ70SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 30
    end
    object AQ70WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ70WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 30
    end
    object AQ70FACTORY_LOCATION: TStringField
      FieldName = 'FACTORY_LOCATION'
    end
    object AQ70v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object AQ70v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
  end
  object ADO0072: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0072.DESCRIPTION, Data0072.GUI_GE, Data0072.QUAN_ORD,'
      
        '      Data0072.UNIT_PRICE, Data0072.recd_date, Data0002.UNIT_NAM' +
        'E,'
      '      Data0072.QUANTITY_RECEIVED, Data0072.reason,'
      '      Data0072.DESCRIPTION2'
      'FROM Data0072 INNER JOIN'
      '      Data0002 ON Data0072.UNIT_PTR = Data0002.RKEY'
      'where data0072.poptr=:rkey')
    Left = 514
    Top = 472
    object ADO0072DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ADO0072GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO0072QUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object ADO0072UNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'UNIT_PRICE'
    end
    object ADO0072recd_date: TDateTimeField
      DisplayLabel = #26368#21518#25910#36135#26085#26399
      FieldName = 'recd_date'
    end
    object ADO0072UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO0072QUANTITY_RECEIVED: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY_RECEIVED'
    end
    object ADO0072reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO0072DESCRIPTION2: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO0072
    Left = 480
    Top = 472
  end
end
